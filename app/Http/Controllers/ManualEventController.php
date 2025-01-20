<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ManualEvent;
use App\Models\Task;
use Illuminate\Support\Facades\Cache;

class ManualEventController extends Controller
{
    /**
     * Show Calendar (Tasks + Manual Events).
     */
    public function clearCache()
    {
        Cache::forget('calendar_data');

        return response()->json(['status' => 'success', 'message' => 'Cache cleared successfully']);
    }

    public function index(Request $request)
    {
        // Get the authenticated user
        $user = auth()->user();

        // Check if the user is a Super Admin
        $isSuperAdmin = $user->roles()->where('name', 'Super Admin')->exists();

        // Get `task_type` filter from the request
        $taskTypeFilter = $request->input('task_type');

        // We'll cache the calendar data for 60 minutes (adjust as needed).
        $calendarData = Cache::remember('calendar_data', 60, function () use ($isSuperAdmin, $taskTypeFilter) {
            // 1. Fetch tasks with non-null issue_date, eager load relationships
            $query = Task::with('users', 'taskAssignments');

            // If the user is not a Super Admin, filter tasks by the user's own tasks
            if (!$isSuperAdmin) {
                $query->whereHas('users', function ($q) {
                    $q->where('user_id', auth()->id()); // Filter tasks assigned to the current user
                });
            }

            // Apply `task_type` filter if provided
            if ($taskTypeFilter) {
                $query->where('task_type', $taskTypeFilter);
            }

            $tasks = $query->get();

            // 2. Fetch all manual events (you can modify the logic based on user permissions)
            $manualEvents = ManualEvent::get();

            // 3. Build the calendar data array
            $calendarData = [];
            $currentDate = \Carbon\Carbon::now();

            // Loop through tasks and build calendar data for them
            foreach ($tasks as $task) {
                $empNames = [];
                $empAbouts = [];
                foreach ($task->users as $taskUser) {
                    if (isset($taskUser->name)) {
                        // Split full name and abbreviate middle/last names
                        $nameParts = explode(' ', $taskUser->name);
                        $shortName = $nameParts[0]; // Last name
                        if (isset($nameParts[1])) {
                            $shortName .= ' ' . mb_substr($nameParts[1], 0, 1) . '.'; // First name initial
                        }
                        if (isset($nameParts[2])) {
                            $shortName .= mb_substr($nameParts[2], 0, 1) . '.'; // Middle name initial
                        }
                        $empNames[] = $shortName;
                    }

                    if (isset($taskUser->about)) {
                        $empAbouts[] = $taskUser->about; // Collect "about" information
                    }
                }

                // Get the first task assignment status to determine the color class
                $assignment = $task->taskAssignments->first();
                $colorClass = 'date-default';

                if ($assignment) {
                    switch ($assignment->status) {
                        case 'completed':
                            $colorClass = 'date-success';
                            break;
                        case 'in_progress':
                            $colorClass = 'date-primary';
                            break;
                        case 'pending':
                            $colorClass = 'date-info';
                            break;
                        case 'rejected':
                            $colorClass = 'date-danger';
                            break;
                        case 'delayed':
                            $colorClass = 'date-warning';
                            break;
                    }
                }

                $calendarData[] = [
                    'id'         => 'task-' . $task->id,
                    'task_link'  => url('/task/' . $task->id),
                    'title'      => ($task->short_name ?? '-') . ' - ' .
                        ($task->end_date ? date('d/m/Y', strtotime($task->end_date)) : 'No End Date'),
                    'start'      => $task->start_date,
                    'end'        => $task->end_date,
                    'note'       => $task->description,
                    'emp_names'  => $empNames,
                    'emp_about'  => $empAbouts,
                    'color'      => $colorClass,
                    'type'       => 'task',
                    'status'     => $assignment ? $assignment->status : 'unknown',
                    'task_type'  => $task->task_type // Added task type to the event data
                ];
            }

            // Loop through manual events and build calendar data for them
            foreach ($manualEvents as $event) {
                $calendarData[] = [
                    'id'         => 'manual-' . $event->id,
                    'title'      => $event->title,
                    'start'      => $event->start_date,
                    'end'        => $event->end_date,
                    'description' => $event->description,
                    'color'      => 'date-default',
                    'type'       => 'manual'
                ];
            }

            return $calendarData;
        });

        // Return the view with the (cached) calendar data
        return view('pages.calendar.index', compact('calendarData'));
    }
}
