<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Document;
use Illuminate\Http\Request;
use App\Models\User;
use Spatie\Permission\Models\Role;
class IjroController extends Controller
{
    public function index(){
        return view('pages.email.inbox');
    }
    public function read(){
        return view('pages.email.read');
    }
    public function compose(){

        abort_if_forbidden('left-request.add');
        $categories = Category::all();
        $count = 1;
        $users = User::get()->all();
        $documents = Document::with('category')->get();

        if (auth()->user()->hasRole('Super Admin'))
            $roles = Role::all();
        else
            $roles = Role::where('name', '!=', 'Super Admin')->get();

        return view('pages.email.compose', compact('categories', 'count', 'users', 'roles', 'documents'));
        // return view('pages.email.compose');
    }
}
