<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Task extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'task_type',
        'user_id',
        'nazoratchi_id',
        'short_name',
        'description',
        'start_date',
        'end_date',
        'document_id',
        'has_star'
    ];

    protected $dates = ['start_date', 'end_date', 'deleted_at'];

    public function users()
    {
        return $this->belongsToMany(User::class, 'task_user');
    }
    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function taskAssignments()
    {
        return $this->hasMany(TaskAssignment::class);
    }

    public function taskComments()
    {
        return $this->hasMany(TaskComment::class);
    }

    public function files()
    {
        return $this->hasMany(File::class);
    }
}
