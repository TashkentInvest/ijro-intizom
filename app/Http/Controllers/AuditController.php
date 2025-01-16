<?php

namespace App\Http\Controllers;

use App\Models\Audit;
use Illuminate\Http\Request;

class AuditController extends Controller
{
    public function index()
    {
        $audits = Audit::all();
        return response()->json($audits);
    }

    public function show(Audit $audit)
    {
        return response()->json($audit);
    }
}
