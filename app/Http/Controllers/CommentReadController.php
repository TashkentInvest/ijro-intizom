<?php

namespace App\Http\Controllers;

use App\Models\CommentRead;
use Illuminate\Http\Request;

class CommentReadController extends Controller
{
    public function index()
    {
        $reads = CommentRead::all();
        return response()->json($reads);
    }

    public function store(Request $request)
    {
        $request->validate([
            'comment_id' => 'required|exists:task_comments,id',
            'user_id' => 'required|exists:users,id',
        ]);

        $read = CommentRead::create($request->all());
        return response()->json($read, 201);
    }

    public function markAsRead(CommentRead $commentRead)
    {
        $commentRead->update(['read_at' => now()]);
        return response()->json(['message' => 'Comment marked as read']);
    }
}
