<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IjroController extends Controller
{
    public function index(){
        return view('pages.email.inbox');
    }
    public function read(){
        return view('pages.email.read');
    }
    public function compose(){
        return view('pages.email.compose');
    }
}
