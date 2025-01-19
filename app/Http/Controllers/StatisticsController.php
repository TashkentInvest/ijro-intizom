<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StatisticsController extends Controller
{
    public function index(Request $request)
    {
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

        // Fetch counts for different statuses
        $statusCounts = [
            'all' => Task::count(),
            'in_progress' => Task::whereHas('taskAssignments', function ($query) {
                $query->where('status', 'in_progress');
            })->count(),
            'completed' => Task::whereHas('taskAssignments', function ($query) {
                $query->where('status', 'completed');
            })->count(),
            'rejected' => Task::whereHas('taskAssignments', function ($query) {
                $query->where('status', 'rejected');
            })->count(),
            'pending' => Task::whereHas('taskAssignments', function ($query) {
                $query->where('status', 'pending');
            })->count(),
            'delayed' => Task::whereHas('taskAssignments', function ($query) {
                $query->where('status', 'delayed');
            })->count(),
        ];

        // Fetch counts for different statuses from yesterday
        $yesterday = Carbon::yesterday();
        $yesterdayCounts = [
            'all' => Task::whereDate('created_at', $yesterday)->count(),
            'in_progress' => Task::whereHas('taskAssignments', function ($query) use ($yesterday) {
                $query->where('status', 'in_progress')->whereDate('created_at', $yesterday);
            })->count(),
            'completed' => Task::whereHas('taskAssignments', function ($query) use ($yesterday) {
                $query->where('status', 'completed')->whereDate('created_at', $yesterday);
            })->count(),
            'rejected' => Task::whereHas('taskAssignments', function ($query) use ($yesterday) {
                $query->where('status', 'rejected')->whereDate('created_at', $yesterday);
            })->count(),
            'pending' => Task::whereHas('taskAssignments', function ($query) use ($yesterday) {
                $query->where('status', 'pending')->whereDate('created_at', $yesterday);
            })->count(),
            'delayed' => Task::whereHas('taskAssignments', function ($query) use ($yesterday) {
                $query->where('status', 'delayed')->whereDate('created_at', $yesterday);
            })->count(),
        ];

        // Calculate percentage growth
        $percentageGrowth = [];
        foreach ($statusCounts as $status => $count) {
            $previousCount = $yesterdayCounts[$status] ?? 0;
            $growth = $previousCount > 0 ? (($count - $previousCount) / $previousCount) * 100 : 0;
            $percentageGrowth[$status] = round($growth, 2);
        }

        // Return view with tasks and counts
        return view('pages.statistics.index', compact('tasks', 'statusCounts', 'percentageGrowth', 'statusFilter', 'taskTypeFilter', 'hasStarFilter', 'dateFrom', 'dateTo', 'search'));
    }
}
