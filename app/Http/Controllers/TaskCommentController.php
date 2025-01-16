<?php

namespace App\Http\Controllers;

use App\Models\TaskComment;
use Illuminate\Http\Request;

class TaskCommentController extends Controller
{
    public function index()
    {
        $comments = TaskComment::all();
        return response()->json($comments);
    }

    public function store(Request $request)
    {
        $request->validate([
            'task_id' => 'required|exists:tasks,id',
            'user_id' => 'required|exists:users,id',
            'comment' => 'required|string',
        ]);

        $comment = TaskComment::create($request->all());
        return response()->json($comment, 201);
    }

    public function show(TaskComment $taskComment)
    {
        return response()->json($taskComment);
    }

    public function update(Request $request, TaskComment $taskComment)
    {
        $taskComment->update($request->all());
        return response()->json($taskComment);
    }

    public function destroy(TaskComment $taskComment)
    {
        $taskComment->delete();
        return response()->json(['message' => 'Comment deleted successfully']);
    }

    public function reply(Request $request, TaskComment $taskComment)
    {
        $request->validate(['comment' => 'required|string']);

        $reply = TaskComment::create([
            'task_id' => $taskComment->task_id,
            'user_id' => $request->user_id,
            'parent_id' => $taskComment->id,
            'comment' => $request->comment,
        ]);
        
        return response()->json($reply, 201);
    }
}
