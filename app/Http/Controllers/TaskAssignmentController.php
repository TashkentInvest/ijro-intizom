<?php

use App\Http\Controllers\Controller;
use App\Models\TaskAssignment;
use Illuminate\Support\Facades\Request;

class TaskAssignmentController extends Controller
{
    public function index()
    {
        $assignments = TaskAssignment::all();
        return response()->json($assignments);
    }

    public function store(Request $request)
    {
        $request->validate([
            'task_id' => 'required|exists:tasks,id',
            'user_id' => 'required|exists:users,id',
            'nazoratchi_id' => 'required|exists:users,id',
            'employee_id' => 'required|exists:users,id',
            'status' => 'required|in:pending,in_progress,completed,rejected',
        ]);

        $assignment = TaskAssignment::create($request->all());
        return response()->json($assignment, 201);
    }

    public function show(TaskAssignment $taskAssignment)
    {
        return response()->json($taskAssignment);
    }

    public function update(Request $request, TaskAssignment $taskAssignment)
    {
        $taskAssignment->update($request->all());
        return response()->json($taskAssignment);
    }

    public function destroy(TaskAssignment $taskAssignment)
    {
        $taskAssignment->delete();
        return response()->json(['message' => 'Task assignment deleted successfully']);
    }

    public function accept(TaskAssignment $taskAssignment)
    {
        $taskAssignment->update(['status' => 'in_progress']);
        return response()->json(['message' => 'Task accepted']);
    }

    public function reject(TaskAssignment $taskAssignment)
    {
        $taskAssignment->update(['status' => 'rejected']);
        return response()->json(['message' => 'Task rejected']);
    }

    public function complete(TaskAssignment $taskAssignment)
    {
        $taskAssignment->update(['status' => 'completed']);
        return response()->json(['message' => 'Task completed']);
    }
}