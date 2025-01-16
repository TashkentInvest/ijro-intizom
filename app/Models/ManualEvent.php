<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ManualEvent extends Model
{
    use HasFactory;

    protected $table = 'manual_events';

    protected $fillable = [
        'title',
        'start_date',
        'end_date',
        'description',
    ];
}
