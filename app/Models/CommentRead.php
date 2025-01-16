<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentRead extends Model
{
    use HasFactory;

    protected $fillable = [
        'comment_id',
        'user_id',
        'read_at'
    ];

    // Relationships
    public function comment()
    {
        return $this->belongsTo(TaskComment::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
