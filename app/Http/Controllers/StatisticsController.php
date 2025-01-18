<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class StatisticsController extends Controller
{
    public function index(){

        $tasks = Task::get();
        return view('pages.statistics.index',compact('tasks'));
    }
}
