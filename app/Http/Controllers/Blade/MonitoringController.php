<?php

namespace App\Http\Controllers\Blade;

use App\Http\Controllers\Controller;
use App\Models\TaskStatus;
use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Models\Role;

class MonitoringController extends Controller
{
    public function index(Request $request)
    {
        abort_if_forbidden('monitoring.show');

        $user = Auth::user();
        $isSuperAdmin = $user->roles()->where('name', 'Super Admin')->exists();

        // Get filter parameters from the request
        $roleFilter = $request->input('role');
        $userFilter = $request->input('user');
        $statusFilter = $request->input('status');
        $dateFrom = $request->input('date_from');
        $dateTo = $request->input('date_to');
        $search = $request->input('search');

        // Initialize the query to fetch task
        if (auth()->user()->email == 'baxrom.shakirov@toshkentinevst.uz' || auth()->user()->email == 'superadmin@example.com') {
            $query = Task::query()
                ->orderBy('id', 'desc')

                ->with(['roles', 'category', 'task_users', 'user']);

        } else {
            $query = Task::query()
                ->orderBy('id', 'desc')
                ->where('status_id', '!=', true)

                ->with(['roles', 'category', 'task_users', 'user']);

        }

        // If not super admin, apply role and user filters
        if (!$isSuperAdmin) {
            // dd('d');
            $roleIds = $user->roles()->pluck('id')->toArray();

            // Filter tasks by roles and assigned users
            $query->where(function ($q) use ($roleIds, $user) {
                $q->whereHas('roles', function ($q) use ($roleIds) {
                    $q->whereIn('roles.id', $roleIds);
                })
                    ->orWhereHas('task_users', function ($q) use ($user) {
                        $q->where('user_id', $user->id);
                    });
            });
        }

        // Apply Role Filter
        if ($roleFilter) {
            $query->whereHas('roles', function ($q) use ($roleFilter) {
                $q->where('roles.id', $roleFilter);
            });
        }

        // Apply User Filter
        if ($userFilter) {
            $query->whereHas('task_users', function ($q) use ($userFilter) {
                $q->where('user_id', $userFilter);
            });
        }

        // Apply Status Filter
        if ($statusFilter) {
            $query->where('status_id', $statusFilter);
        }

        // Apply Date Range Filter
        if ($dateFrom) {
            $query->whereDate('created_at', '>=', $dateFrom);
        }

        if ($dateTo) {
            $query->whereDate('created_at', '<=', $dateTo);
        }

        // Apply Search Filter
        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('note', 'like', '%' . $search . '%');
                // Add more fields to search if needed
            });
        }

        // Fetch tasks
        $allTasks = $query->where('status_id', '!=', 5)->get();

        // Separate tasks by status
        $inProgressTasks = $allTasks->where('status_id', true);
        $pendingTasks = $allTasks->where('status_id', true);
        $completedTasks = $allTasks->where('status_id', true);
        $employeeRejectedTasks = $allTasks->where('status_id', true);

        // Prepare role names by task
        $roleNamesByTask = $allTasks->mapWithKeys(function ($task) {
            return [$task->id => $task->roles->pluck('name')];
        });

        // Get data for filter dropdowns
        $roles = Role::all();
        $users = User::all();
        // $statuses = TaskStatus::all();

        return view('pages.monitoring.index', [
            'allTasks'                => $allTasks,
            'inProgressTasks'         => $inProgressTasks,
            'pendingTasks'            => $pendingTasks,
            'completedTasks'          => $completedTasks,
            'employeeRejectedTasks'   => $employeeRejectedTasks,
            'trashedTasks'            => Task::onlyTrashed()->get(),
            'roleNamesByTask'         => $roleNamesByTask,
            'roles'                   => $roles,
            'users'                   => $users,
        ]);
    }
}
