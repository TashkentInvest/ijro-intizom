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
    public function index()
    {
        // Get the authenticated user
        $user = auth()->user();

        // Check if the user is a Super Admin
        $isSuperAdmin = $user->roles()->where('name', 'Super Admin')->exists();

        // We'll cache the calendar data for 60 minutes (adjust as needed).
        $calendarData = Cache::remember('calendar_data', 60, function () use ($isSuperAdmin) {
            // 1. Fetch tasks with non-null issue_date, eager load relationships
            $query = Task::where('status_id', '!=', true)->with('task_users', 'status');
            // $query = Task::where('status_id', '!=', TaskStatus::DELETED)->with('task_users', 'status');

            // If the user is not a Super Admin, filter tasks by the user's own tasks
            if (!$isSuperAdmin) {
                $query->whereHas('task_users', function ($q) {
                    $q->where('user_id', auth()->id()); // Filter tasks assigned to the current user
                });
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
                foreach ($task->task_users as $taskUser) {
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

                // Determine color class based on status and planned completion date
                $plannedDate = $task->planned_completion_date;
                $colorClass = 'white';

                if ($plannedDate) {
                    $daysDifference = $plannedDate->diffInDays($currentDate, false);
                    if ($task->status->name == 'Completed') {
                        $colorClass = 'lightgreen';
                    } elseif ($currentDate->gt($plannedDate)) {
                        $colorClass = 'red';
                    } elseif ($daysDifference <= 2 && $daysDifference >= 0) {
                        $colorClass = 'yellow';
                    } else {
                        $colorClass = 'white';
                    }
                }

                $calendarData[] = [
                    'id'         => 'task-' . $task->id,
                    'task_link'  => url('/task/' . $task->id),
                    'title'      => $task->short_name ?? '-' . ' - ' .
                        ($task->planned_completion_date ? date('d/m/Y', strtotime($task->planned_completion_date)) : 'No End Date'),
                    'start'      => $task->issue_date,
                    'end'        => $task->planned_completion_date,
                    'note'       => $task->note,
                    'emp_names'  => $empNames,
                    'emp_about'  => $empAbouts,
                    'color'      => $colorClass,
                    'type'       => 'task'
                ];
            }

            // Loop through manual events and build calendar data for them
            foreach ($manualEvents as $event) {
                $calendarData[] = [
                    'id'          => 'manual-' . $event->id,
                    'title'       => ($event->start_date ? date('H:i:s', strtotime($event->start_date)) : 'No Start Time') . ' - ' . $event->title,
                    'start'       => $event->start_date,
                    'end'         => $event->end_date,
                    'description' => $event->description,
                    'color'       => 'gold',
                    'type'        => 'manual'
                ];
            }

            return $calendarData;
        });

        // Return the view with the (cached) calendar data
        return view('pages.calendar.index', compact('calendarData'));
    }


    /**
     * Store a new manual event (via Ajax).
     */
    public function store(Request $request)
    {
        $manualEvent = ManualEvent::create($request->only(['title', 'start_date', 'end_date', 'description']));

        return response()->json([
            'status' => 'success',
            'data' => $manualEvent
        ]);
    }

    /**
     * Update an existing manual event (Ajax).
     */
    public function update(Request $request, $id)
    {
        // Remove the 'manual-' prefix to get the actual ID
        $pureId = str_replace('manual-', '', $id);
        $event = ManualEvent::findOrFail($pureId);

        $event->update([
            'title'       => $request->title,
            'start_date'  => $request->start_date,
            'end_date'    => $request->end_date,
            'description' => $request->description,
        ]);

        return response()->json([
            'status'  => 'success',
            'message' => 'Ҳодиса муваффақиятли тахрирланди!',
            'data'    => $event
        ]);
    }

    /**
     * Delete a manual event (Ajax).
     */
    public function destroy($id)
    {
        $pureId = str_replace('manual-', '', $id);
        $event = ManualEvent::findOrFail($pureId);

        $event->delete();

        return response()->json([
            'status'  => 'success',
            'message' => 'Ҳодиса муваффақиятли ўчирилди!'
        ]);
    }
}
