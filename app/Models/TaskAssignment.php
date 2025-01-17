<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TaskAssignment extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'task_id',
        'user_id',
        'nazoratchi_id',
        'employee_id',
        'status',
        'emp_accepted_at',
        'emp_confirmed_at',
        'emp_finished_at',
        'nazoratchi_confirmed_at',
        'nazoratchi_rejected_at',
        'user_accepted_at',
        'user_confirmed_at',
        'user_rejected_at',
        'emp_readed_at',
        'nazoratchi_readed_at',
        'user_readed_at'
    ];

    protected $dates = [
        'emp_accepted_at',
        'emp_confirmed_at',
        'emp_finished_at',
        'nazoratchi_confirmed_at',
        'nazoratchi_rejected_at',
        'user_accepted_at',
        'user_confirmed_at',
        'user_rejected_at',
        'deleted_at',
        'emp_readed_at',
        'nazoratchi_readed_at',
        'user_readed_at'
    ];

    // Relationships
    public function task()
    {
        return $this->belongsTo(Task::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function nazoratchi()
    {
        return $this->belongsTo(User::class, 'nazoratchi_id');
    }

    public function employee()
    {
        return $this->belongsTo(User::class, 'employee_id');
    }
}
