<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class File extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'file_name',
        'file_path',
        'file_type',
        'user_id',
        'task_id',
        'comment_id'
    ];

    protected $dates = ['deleted_at'];

    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function task()
    {
        return $this->belongsTo(Task::class);
    }

    public function comment()
    {
        return $this->belongsTo(TaskComment::class);
    }
}
