<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Document;
use App\Models\File;
use App\Models\RoleTask;
use App\Models\Task;
use App\Models\TaskUser;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;

class IjroController extends Controller
{
    public function index()
    {
        $tasks = Task::get();
        return view('pages.email.inbox', compact('tasks'));
    }
    public function read($id)
    {
        $task = Task::find($id);
        return view('pages.email.read', compact('task'));
    }
    public function compose()
    {

        abort_if_forbidden('left-request.add');
        $categories = Category::all();
        $count = 1;
        $users = User::get()->all();
        $documents = Document::with('category')->get();

        if (auth()->user()->hasRole('Super Admin'))
            $roles = Role::all();
        else
            $roles = Role::where('name', '!=', 'Super Admin')->get();

        return view('pages.email.compose', compact('categories', 'count', 'users', 'roles', 'documents'));
        // return view('pages.email.compose');
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
                    $path = $file->store('files');

                    File::create([
                        'file_name' => $file->getClientOriginalName(),
                        'file_path' => $path,
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
    
        return view('pages.email.edit', compact('task', 'users', 'documents'));
    }

    // Handle the update of a task
    public function update(Request $request, $id)
    {
        // Validate the request
        $validatedData = $request->validate([
            'task_type' => 'required|in:meeting,hr_task,emp_task',
            'users' => 'nullable|array', // Ensure users is an array
            'users.*' => 'nullable|exists:users,id',
            'short_name' => 'required|string|max:255',
            'description' => 'required|string',
            'end_date' => 'nullable|date',
            'document_id' => 'nullable|exists:documents,id',
            'attached_file.*' => 'nullable|file|mimes:jpg,jpeg,png,pdf,doc,docx,zip|max:2048'
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

            // Handle file uploads
            if ($request->hasFile('attached_file')) {
                foreach ($request->file('attached_file') as $file) {
                    $path = $file->store('files');

                    File::create([
                        'file_name' => $file->getClientOriginalName(),
                        'file_path' => $path,
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
}
