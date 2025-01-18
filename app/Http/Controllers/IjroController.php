<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Document;
use App\Models\File;
use App\Models\RoleTask;
use App\Models\Task;
use App\Models\TaskAssignment;
use App\Models\TaskUser;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Models\Role;

class IjroController extends Controller
{
    public function index(Request $request)
    {
        // dd('te');
        // Get the current authenticated user
        $user = Auth::user();
        $isSuperAdmin = $user->roles()->where('name', 'Super Admin')->exists();
        $isSpecificUser = $user->email == 'shakirov@gmail.com';

        // Get filter parameters from the request
        $statusFilter = $request->input('status');
        $taskTypeFilter = $request->input('task_type');
        $hasStarFilter = $request->input('has_star');
        $dateFrom = $request->input('date_from');
        $dateTo = $request->input('date_to');
        $search = $request->input('search');

        // Initialize the query to fetch tasks
        $query = Task::query()
            ->orderBy('id', 'desc')
            ->with(['user', 'users', 'taskAssignments', 'taskComments', 'files']);

        // Check if the user is neither super admin nor the specific user, and restrict tasks to only those assigned to the user
        if (!$isSuperAdmin && !$isSpecificUser) {
            $query->whereHas('users', function ($q) {
                $q->where('users.id', auth()->id()); // Specify 'users.id' to avoid ambiguity
            });
        }

        // If the user is not a super admin, restrict the query to exclude completed or archived tasks
        if (!$isSuperAdmin) {
            $query->where('status_id', '!=', true);  // Exclude completed or archived tasks
        }

        // Apply filters (task type, starred, status, date range, etc.)
        if ($taskTypeFilter) {
            $query->where('task_type', $taskTypeFilter);
        }

        if ($hasStarFilter !== null) {
            $query->where('has_star', $hasStarFilter);
        }

        if ($statusFilter && $statusFilter !== 'all') {
            $query->whereHas('taskAssignments', function ($q) use ($statusFilter) {
                $q->where('status', $statusFilter);
            });
        }

        if ($dateFrom) {
            $query->whereDate('start_date', '>=', $dateFrom);
        }

        if ($dateTo) {
            $query->whereDate('end_date', '<=', $dateTo);
        }

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('short_name', 'like', '%' . $search . '%')
                    ->orWhere('description', 'like', '%' . $search . '%');
            });
        }

        // Fetch filtered tasks with pagination (10 tasks per page)
        $tasks = $query->paginate(10);

        // Initialize a new query for counting tasks with the same filters
        $countQuery = Task::query();

        if (!$isSuperAdmin) {
            $countQuery->where('status_id', '!=', true); // Exclude completed or archived tasks
        }

        // Apply filters to the count query
        if ($taskTypeFilter) {
            $countQuery->where('task_type', $taskTypeFilter);
        }

        if ($hasStarFilter !== null) {
            $countQuery->where('has_star', $hasStarFilter);
        }

        if ($statusFilter && $statusFilter !== 'all') {
            $countQuery->whereHas('taskAssignments', function ($q) use ($statusFilter) {
                $q->where('status', $statusFilter);
            });
        }

        if ($dateFrom) {
            $countQuery->whereDate('start_date', '>=', $dateFrom);
        }

        if ($dateTo) {
            $countQuery->whereDate('end_date', '<=', $dateTo);
        }

        if ($search) {
            $countQuery->where(function ($q) use ($search) {
                $q->where('short_name', 'like', '%' . $search . '%')
                    ->orWhere('description', 'like', '%' . $search . '%');
            });
        }

        // Calculate the task counts based on status
        $statusCounts = [
            'all' => $countQuery->count(),
            'in_progress' => $countQuery->whereHas('taskAssignments', function ($query) {
                $query->where('status', 'in_progress');
            })->count(),
            'completed' => $countQuery->whereHas('taskAssignments', function ($query) {
                $query->where('status', 'completed');
            })->count(),
            'rejected' => $countQuery->whereHas('taskAssignments', function ($query) {
                $query->where('status', 'rejected');
            })->count(),
            'delayed' => $countQuery->whereHas('taskAssignments', function ($query) {
                $query->where('status', 'delayed');
            })->count(),
        ];

        // Return view with tasks and counts
        return view('pages.ijro.inbox', compact('tasks', 'statusCounts'));
    }

    public function read($id)
    {
        $task = Task::find($id);
        $users = User::all(); // Retrieve all users
        return view('pages.ijro.read', compact('task', 'users'));
    }
    public function compose()
    {

        // abort_if_forbidden('left-request.add');
        $categories = Category::all();
        $count = 1;
        $users = User::get()->all();
        $documents = Document::with('category')->get();

        if (auth()->user()->hasRole('Super Admin'))
            $roles = Role::all();
        else
            $roles = Role::where('name', '!=', 'Super Admin')->get();

        return view('pages.ijro.compose', compact('categories', 'count', 'users', 'roles', 'documents'));
        // return view('pages.ijro.compose');
    }


    public function create(Request $request)
    {
        // Validate the request
        $validatedData = $request->validate([
            'task_type' => 'nullable',

            'users' => 'nullable|array', // Ensure users is an array
            'users.*' => 'nullable',
            'short_name' => 'nullable',
            'description' => 'nullable',
            'end_date' => 'nullable',
            'document_id' => 'nullable',
            'attached_file.*' => 'nullable'
        ]);

        // dd($request);
        // Start transaction
        DB::beginTransaction();

        try {
            // Create the task
            $task = Task::create([
                'task_type' => $validatedData['task_type'],
                'user_id' => auth()->user()->id, // Assuming the currently authenticated user is the creator
                'short_name' => $validatedData['short_name'],
                'description' => $validatedData['description'],
                'end_date' => $validatedData['end_date'],
                'document_id' => $validatedData['document_id'] ?? null
            ]);

            // Check and associate users with the task
            if (isset($validatedData['users']) && is_array($validatedData['users'])) {
                foreach ($validatedData['users'] as $userId) {
                    // dd('request');
                    $user = User::find($userId);
                    if ($user) {
                        TaskUser::create([
                            'task_id' => $task->id,
                            'user_id' => $user->id
                        ]);
                    }
                }
            }

            // Handle file uploads
            if ($request->hasFile('attached_file')) {
                foreach ($request->file('attached_file') as $file) {
                    // Define the directory for saving files directly in the public folder
                    $fileDirectory = public_path('tasks/' . $task->id);

                    // Create the directory if it doesn't exist
                    if (!file_exists($fileDirectory)) {
                        mkdir($fileDirectory, 0777, true);
                    }

                    // Move the file to the public folder
                    $filePath = $file->move($fileDirectory, $file->getClientOriginalName());

                    // Store the file path relative to the public folder in the database
                    File::create([
                        'file_name' => $file->getClientOriginalName(),
                        'file_path' => 'tasks/' . $task->id . '/' . $file->getClientOriginalName(), // Path relative to public
                        'file_type' => $file->getClientMimeType(),
                        'user_id' => auth()->user()->id,
                        'task_id' => $task->id
                    ]);
                }
            }
            // Commit transaction
            DB::commit();

            return redirect()->route('ijro.index')->with('success', 'Task created successfully!');
        } catch (\Exception $e) {
            // Rollback transaction on error
            DB::rollBack();
            \Log::info($e);

            return redirect()->back()->with('error', 'Failed to create task: ' . $e->getMessage());
        }
    }

    public function edit($id)
    {
        $task = Task::with('users')->findOrFail($id);
        $users = User::all();
        $documents = Document::with('category')->get();

        return view('pages.ijro.edit', compact('task', 'users', 'documents'));
    }

    // Handle the update of a task
    public function update(Request $request, $id)
    {
        // Validate the request
        $validatedData = $request->validate([
            'task_type' => 'required|in:meeting,hr_task,emp_task',
            'users' => 'nullable|array',
            'users.*' => 'nullable|exists:users,id',
            'short_name' => 'required|string|max:255',
            'description' => 'required|string',
            'end_date' => 'nullable|date',
            'document_id' => 'nullable|exists:documents,id',
            'attached_file.*' => 'nullable|file|mimes:jpg,jpeg,png,pdf,doc,docx,zip|max:2048',
            'delete_files' => 'nullable|array',
            'delete_files.*' => 'nullable|exists:files,id' // Ensure each selected file exists in the DB
        ]);

        // Start transaction
        DB::beginTransaction();

        try {
            // Find the task and update it
            $task = Task::findOrFail($id);
            $task->update([
                'task_type' => $validatedData['task_type'],
                'short_name' => $validatedData['short_name'],
                'description' => $validatedData['description'],
                'end_date' => $validatedData['end_date'],
                'document_id' => $validatedData['document_id'] ?? null
            ]);

            // Update associated users
            TaskUser::where('task_id', $task->id)->delete();
            if (isset($validatedData['users']) && is_array($validatedData['users'])) {
                foreach ($validatedData['users'] as $userId) {
                    $user = User::find($userId);
                    if ($user) {
                        TaskUser::create([
                            'task_id' => $task->id,
                            'user_id' => $user->id
                        ]);
                    }
                }
            }

            // Handle file deletions
            if (isset($validatedData['delete_files']) && is_array($validatedData['delete_files'])) {
                foreach ($validatedData['delete_files'] as $fileId) {
                    $file = File::find($fileId);

                    if ($file) {
                        // Delete the file from the filesystem
                        $filePath = public_path($file->file_path);
                        if (file_exists($filePath)) {
                            unlink($filePath); // Delete the file from the public folder
                        }

                        // Delete the file record from the database
                        $file->delete();
                    }
                }
            }

            // Handle file uploads
            if ($request->hasFile('attached_file')) {
                foreach ($request->file('attached_file') as $file) {
                    // Define the directory for saving files directly in the public folder
                    $fileDirectory = public_path('tasks/' . $task->id);

                    // Create the directory if it doesn't exist
                    if (!file_exists($fileDirectory)) {
                        mkdir($fileDirectory, 0777, true);
                    }

                    // Move the file to the public folder
                    $filePath = $file->move($fileDirectory, $file->getClientOriginalName());

                    // Store the file path relative to the public folder in the database
                    File::create([
                        'file_name' => $file->getClientOriginalName(),
                        'file_path' => 'tasks/' . $task->id . '/' . $file->getClientOriginalName(), // Path relative to public
                        'file_type' => $file->getClientMimeType(),
                        'user_id' => auth()->user()->id,
                        'task_id' => $task->id
                    ]);
                }
            }

            // Commit transaction
            DB::commit();

            return redirect()->route('ijro.index')->with('success', 'Task updated successfully!');
        } catch (\Exception $e) {
            // Rollback transaction on error
            DB::rollBack();
            \Log::info($e);

            return redirect()->back()->with('error', 'Failed to update task: ' . $e->getMessage());
        }
    }


    public function accept(Task $task)
    {
        // Ensure the authenticated user is allowed to accept this task
        if ($task->users->contains('id', auth()->id())) {

            // Check if a task assignment exists for the current task and the authenticated user
            $taskAssignment = TaskAssignment::where('task_id', $task->id)
                ->where('employee_id', auth()->id())
                ->first();

            // If no assignment exists, create a new one
            if (!$taskAssignment) {
                $taskAssignment = TaskAssignment::create([
                    'task_id' => $task->id,
                    'user_id' => $task->user_id, // Assuming this is the manager or creator of the task
                    'nazoratchi_id' => $task->nazoratchi_id ?? $task->user_id, // Assuming this is the supervisor
                    'employee_id' => auth()->user()->id, // The employee accepting the task
                    'status' => 'pending', // Initial status
                    'emp_readed_at' => now(), // Current timestamp
                    'emp_accepted_at' => now(), // Current timestamp
                ]);
            } else {
                // If the task assignment exists, just update the timestamps
                $taskAssignment->emp_readed_at = now();
                $taskAssignment->emp_accepted_at = now();
                $taskAssignment->save();
            }

            // Update the task status
            // $task->status = 'accepted'; // Mark the task as accepted
            $task->save();

            // Redirect or return a response
            return redirect()->route('ijro.index')->with('success', 'Task accepted successfully');
        }

        // If the user is not assigned to the task, show an error
        return redirect()->route('ijro.index')->with('error', 'You are not assigned to this task');
    }
}
