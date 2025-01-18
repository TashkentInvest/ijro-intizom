<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaskAssignmentHistory extends Model
{
    use HasFactory;

    protected $table = 'task_assignment_histories';

    protected $primaryKey = 'id';

    protected $fillable = [
        'task_assignment_id',
        'user_id',
        'action_type',
        'description',
        'previous_status',
        'new_status',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'previous_status' => 'string',
        'new_status' => 'string',
    ];

     public function taskAssignment()
    {
        return $this->belongsTo(TaskAssignment::class);
    }

    /**
     * Relationship with the user who performed the action
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
