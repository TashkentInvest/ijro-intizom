<?php
namespace App\Http\Controllers;

use App\Models\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class FileController extends Controller
{
    public function index()
    {
        $files = File::all();
        return response()->json($files);
    }

    public function store(Request $request)
    {
        $request->validate([
            'file_name' => 'required|string',
            'file' => 'required|file',
            'user_id' => 'required|exists:users,id',
            'task_id' => 'nullable|exists:tasks,id',
            'comment_id' => 'nullable|exists:task_comments,id',
        ]);

        $filePath = $request->file('file')->store('task_files');

        $file = File::create([
            'file_name' => $request->file_name,
            'file_path' => $filePath,
            'file_type' => $request->file->getClientMimeType(),
            'user_id' => $request->user_id,
            'task_id' => $request->task_id,
            'comment_id' => $request->comment_id,
        ]);

        return response()->json($file, 201);
    }

    public function show(File $file)
    {
        return response()->json($file);
    }

    public function destroy(File $file)
    {
        Storage::delete($file->file_path);
        $file->delete();
        return response()->json(['message' => 'File deleted successfully']);
    }

    public function download(File $file)
    {
        return response()->download(storage_path('app/' . $file->file_path));
    }
}
