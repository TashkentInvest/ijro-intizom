<?php

namespace App\Http\Controllers\Blade;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Document;
use App\Models\File;
use App\Models\Order;
use App\Models\RoleTask;
use Illuminate\Http\Request;
use App\Models\TaskStatus;
use App\Models\Tasks;
use App\Models\TaskUser;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Models\Role;

class TaskController extends Controller
{
    public function index()
    {
        $tasksHistories = Tasks::with('document')
        ->where('status_id', TaskStatus::ACTIVE)
        ->where('status_id', TaskStatus::SHEF_APPROVED)
        ->get()->all();
        return view('tasks.index', compact('tasksHistories'));
    }

    public function calendar()
    {
        return view('pages.calendar.index');
    }

    public function add()
    {
        abort_if_forbidden('left-request.add');
        $categories = Category::all();
        $taskStatuses = TaskStatus::all();
        $count = 1;
        $users = User::get()->all();
        $documents = Document::with('category')->get();

        if (auth()->user()->hasRole('Super Admin'))
            $roles = Role::all();
        else
            $roles = Role::where('name', '!=', 'Super Admin')->get();

        return view('pages.task.add', compact('categories', 'count', 'users', 'roles', 'documents'));
    }

    public function create(Request $request)
    {
        try {
            // Validate the incoming request
            $validatedData = $request->validate([
                'issue_date' => 'nullable|date',
                'poruchenie' => 'nullable|string',
                'planned_completion_date' => 'nullable|date',
                'note' => 'nullable|string',
                'short_name' => 'nullable',
                'document_id' => 'nullable', // If document ID is provided, ensure it exists
                'category_id' => 'nullable', // If category ID is provided, ensure it exists
                'users' => 'nullable', // Ensure 'users' is an array
                'users.*' => 'nullable', // Ensure each user ID is an integer and exists
            ]);

            // Create a new task
            $task = new Tasks();
            $task->category_id = $validatedData['category_id'] ?? null;
            $task->user_id = auth()->user()->id; // Assign logged-in user as the creator
            $task->poruchenie = $validatedData['poruchenie'] ?? null;
            $task->short_name = $validatedData['short_name'] ?? null;
            $task->issue_date = $validatedData['issue_date'] ?? null;
            $task->planned_completion_date = $validatedData['planned_completion_date'] ?? null;
            $task->note = $validatedData['note'] ?? null;
            $task->document_id = $validatedData['document_id'] ?? null;
            $task->assign_type = 'custom'; // Default assign type

            // Assign the assign_type based on the input
            $assignType = $request->input('assign_type');
            if ($assignType === 'role' || $assignType === 'custom') {
                $task->assign_type = $assignType;
            }

            $task->save(); // Save task first

            // Handle file uploads
            if ($request->hasFile('attached_file')) {
                foreach ($request->file('attached_file') as $file) {
                    $fileName = time() . '_' . $file->getClientOriginalName(); // Create a unique name
                    $file->move(public_path('porucheniya'), $fileName); // Move file to the directory

                    // Save file information to the database
                    File::create([
                        'user_id' => auth()->user()->id,
                        'task_id' => $task->id,
                        'name' => $file->getClientOriginalName(), // Store the original name
                        'file_name' => $fileName, // Store the unique name
                        'department' => null, // Set this as needed
                        'slug' => null, // Generate a slug if necessary
                    ]);
                }
            }

            // Assign roles or users based on selection
            if ($task->assign_type == 'role') {
                // If assign_type is 'role', assign roles to the task
                foreach ($validatedData['roles'] ?? [] as $roleName) {
                    $role = Role::where('name', $roleName)->first();
                    if ($role) {
                        RoleTask::create([
                            'task_id' => $task->id,
                            'role_id' => $role->id
                        ]);
                    }
                }
            } elseif ($task->assign_type == 'custom') {
                // If assign_type is 'custom', assign specific users to the task
                foreach ($validatedData['users'] ?? [] as $userId) {
                    // Ensure the user ID is valid and exists in the database
                    $user = User::find($userId); // Use find() to get user by ID
                    if ($user) {
                        TaskUser::create([
                            'task_id' => $task->id,
                            'user_id' => $user->id
                        ]);
                    }
                }
            }

            // Return success response
            return redirect()->route('monitoringIndex')->with('success', 'Task created successfully.');
        } catch (\Illuminate\Validation\ValidationException $e) {
            // Log the validation errors
            \Log::error('Validation errors: ', $e->errors());

            // Return to the form with validation errors
            return redirect()->back()->withErrors($e->validator)->withInput();
        } catch (\Exception $e) {
            // Catch any other exceptions (e.g., database errors)
            \Log::error('Error creating task: ', ['message' => $e->getMessage()]);

            return redirect()->back()->with('error', 'There was an error creating the task.');
        }
    }

    public function edit($id)
    {
        // Fetch the task and related data
        $task = Tasks::with(['roles', 'user', 'task_users'])->findOrFail($id);
        $categories = Category::all(); // Adjust as necessary
        $roles = Role::all();
        $users = User::all();
        $documents = Document::with('category')->get();


        return view('pages.task.edit', compact('task', 'categories', 'roles', 'users', 'documents'));
    }
    public function show($id)
    {
        // Fetch the task and related data
        $item = Tasks::where('id', $id)
            ->with(['roles', 'user', 'task_users', 'category', 'order', 'files', 'document']) // Load files relationship
            ->findOrFail($id);


        \Carbon\Carbon::setLocale('uz'); // Ensure locale is set
        $monthNames = [
            'yanvar',
            'fevral',
            'mart',
            'aprel',
            'may',
            'iyun',
            'iyul',
            'avgust',
            'sentabr',
            'oktabr',
            'noyabr',
            'dekabr'
        ];
        $categories = Category::all(); // Adjust as necessary
        $roles = Role::all();
        $users = User::all();
        $order = Order::withTrashed()->where('task_id', $id)->first();

        return view('pages.task.show', compact('item', 'categories', 'roles', 'users', 'order', 'monthNames'));
    }

    public function update(Request $request, $id)
    {
        try {
    //  dd($request);       // Find the task by ID
            $task = Tasks::findOrFail($id);

            // Validate the incoming request
            $validatedData = $request->validate([
                'issue_date' => 'nullable',
                'poruchenie' => 'nullable|string',
                'planned_completion_date' => 'nullable',
                'short_name' => 'nullable',

                'note' => 'nullable|string',
                'document_id' => 'nullable',
                'category_id' => 'nullable',
                'users' => 'nullable', // Ensure users is an array
                'users.*' => 'nullable', // Ensure each user ID is valid
            ]);

            // Update the task with the validated data
            $task->category_id = $validatedData['category_id'] ?? $task->category_id;
            $task->user_id = auth()->user()->id; // Update with the current user (can be changed as needed)
            $task->poruchenie = $validatedData['poruchenie'] ?? $task->poruchenie;
            $task->short_name = $validatedData['short_name'] ?? $task->short_name;
            
            $task->issue_date = $validatedData['issue_date'] ?? $task->issue_date;
            $task->planned_completion_date = $validatedData['planned_completion_date'] ?? $task->planned_completion_date;
            $task->note = $validatedData['note'] ?? $task->note;
            $task->document_id = $validatedData['document_id'] ?? $task->document_id;
            $task->assign_type = 'custom'; // Default assign type

            $task->save(); // Save the task with updated values

            // Handle file uploads (same as in the create method)
            if ($request->hasFile('attached_file')) {
                foreach ($request->file('attached_file') as $file) {
                    $fileName = time() . '_' . $file->getClientOriginalName(); // Generate unique name
                    $file->move(public_path('porucheniya'), $fileName); // Save to directory

                    // Save file to database
                    File::create([
                        'user_id' => auth()->user()->id,
                        'task_id' => $task->id,
                        'name' => $file->getClientOriginalName(),
                        'file_name' => $fileName,
                        'department' => null,
                        'slug' => null,
                    ]);
                }
            }

            $task->roles()->detach();
            $task->task_users()->detach(); // Also detach existing user assignments
            if ($task->assign_type == 'role') {
                foreach ($validatedData['roles'] as $roleName) {
                    $role = Role::where('name', $roleName)->first();
                    if ($role) {
                        RoleTask::create(['task_id' => $task->id, 'role_id' => $role->id]);
                    }
                }
            } elseif ($task->assign_type == 'custom') {
                foreach ($validatedData['users'] as $userId) {
                    $user = User::find($userId);
                    if ($user) {
                        TaskUser::create(['task_id' => $task->id, 'user_id' => $user->id]);
                    }
                }
            }


            return redirect()->route('monitoringIndex')->with('success', 'Task updated successfully.');
        } catch (\Illuminate\Validation\ValidationException $e) {
            // Log validation errors
            \Log::error('Validation errors: ', $e->errors());

            return redirect()->back()->withErrors($e->validator)->withInput();
        } catch (\Exception $e) {
            // Catch any other exceptions and log them
            \Log::error('Error updating task: ', ['message' => $e->getMessage()]);

            return redirect()->back()->with('error', 'There was an error updating the task.');
        }
    }




    public function deleteFile($fileId)
    {
        $file = File::findOrFail($fileId);

        // Attempt to build the file paths
        $filePath1 = public_path('porucheniya/' . $file->file_name);
        $filePath2 = public_path('porucheniya/reject/' . $file->file_name);

        // Determine which path to use
        $filePath = file_exists($filePath1) ? $filePath1 : $filePath2;

        // Check if the file exists and is a file, then delete it
        if (file_exists($filePath) && is_file($filePath)) {
            unlink($filePath); // Delete the file from storage
        }

        // Delete the file record from the database
        $file->delete();

        return redirect()->back()->with('success', 'File deleted successfully!');
    }



    public function destroy($id)
    {
        // dd('ads');
        $task = Tasks::find($id);

        if (!$task) {
            return redirect()->back()->with('error', 'Task not found.');
        }
        // dd($task);

        // Optional: Update the status instead of deleting
        $task->status_id = TaskStatus::DELETED;
        $task->user_id = auth()->user()->id;
        $task->save();

        return redirect()->back()->with('success', 'Task deleted successfully.');
    }

    public function adminConfirm(Request $request, $id)
    {
        // Find the task by its ID
        $task = Tasks::find($id);
    
        // Only approve if the task is not already approved
        if ($task->status_id != TaskStatus::SHEF_APPROVED) {
            $task->status_id = TaskStatus::SHEF_APPROVED; // Set to approved
            $task->save(); // Save the updated task status
        }
    
        // Redirect back with a success message
        return redirect()->back()->with('success', 'Task approved!');
    }
    
}
