<?php

namespace App\Http\Controllers;

use App\Models\TaskHistory;
use Illuminate\Http\Request;

class TaskHistoryController extends Controller
{
    public function index()
    {
        $history = TaskHistory::all();
        return response()->json($history);
    }

    public function show(TaskHistory $taskHistory)
    {
        return response()->json($taskHistory);
    }
}
