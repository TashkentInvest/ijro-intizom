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
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;

class IjroController extends Controller
{
    public function index(Request $request)
    {
        // Get the current authenticated user
        $user = Auth::user();
        $isSuperAdmin = $user->roles()->where('name', 'Super Admin')->exists();

        // Get filter parameters from the request
        $roleFilter = $request->input('role');
        $userFilter = $request->input('user');
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

        // If the user is not a super admin, restrict the query
        if (!$isSuperAdmin) {
            $query->where('status_id', '!=', true);  // Exclude completed or archived tasks
        }

        // Apply role and user filters if needed
        if (!$isSuperAdmin) {
            $roleIds = $user->roles()->pluck('id')->toArray();

            // Filter tasks by roles and assigned users
            $query->where(function ($q) use ($roleIds, $user) {
                $q->whereHas('user.roles', function ($q) use ($roleIds) {
                    $q->whereIn('roles.id', $roleIds);
                })
                    ->orWhereHas('users', function ($q) use ($user) {
                        $q->where('user_id', $user->id);
                    });
            });
        }

        // Apply Task Type Filter
        if ($taskTypeFilter) {
            $query->where('task_type', $taskTypeFilter);
        }

        // Apply Starred Filter
        if ($hasStarFilter !== null) {
            $query->where('has_star', $hasStarFilter);
        }

        // Apply Status Filter for Task Assignments (status column in task_assignments)
        if ($statusFilter && $statusFilter != 'all') {
            // Apply specific status filters (in_progress, completed, rejected, delayed)
            $query->whereHas('taskAssignments', function ($q) use ($statusFilter) {
                if ($statusFilter == 'in_progress') {
                    $q->where('status', 'in_progress');
                } elseif ($statusFilter == 'completed') {
                    $q->where('status', 'completed');
                } elseif ($statusFilter == 'rejected') {
                    $q->where('status', 'rejected');
                } elseif ($statusFilter == 'delayed') {
                    $q->where('status', 'delayed');
                }
            });
        }

        // Apply Date Range Filter
        if ($dateFrom) {
            $query->whereDate('start_date', '>=', $dateFrom);
        }

        if ($dateTo) {
            $query->whereDate('end_date', '<=', $dateTo);
        }

        // Apply Search Filter (search in `short_name` and `description`)
        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('short_name', 'like', '%' . $search . '%')
                    ->orWhere('description', 'like', '%' . $search . '%');
            });
        }

        // Fetch tasks
        $tasks = $query->get();

        return view('pages.email.inbox', compact('tasks'));
    }



    public function read($id)
    {
        $task = Task::find($id);
        $users = User::all(); // Retrieve all users
        return view('pages.email.read', compact('task', 'users'));
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

    public function accept(Task $task)
    {
        // Ensure the authenticated user is allowed to accept this task
        if ($task->users->contains('id', auth()->id())) {
            // Logic to mark the task as accepted, for example:
            $task->status = 'accepted'; // Update the task status
            $task->save();

            // Redirect or return a response
            return redirect()->route('ijro.index')->with('success', 'Task accepted successfully');
        }

        // If the user is not assigned to the task, show an error
        return redirect()->route('ijro.index')->with('error', 'You are not assigned to this task');
    }
}
