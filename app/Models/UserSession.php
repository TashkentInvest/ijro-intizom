<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserSession extends Model
{
    use HasFactory;

    // Table name (optional if it's the default plural form)
    protected $table = 'user_sessions';

    // The attributes that are mass assignable
    protected $fillable = [
        'user_id',
        'ip_address',
        'mac_address',
        'login_at',
        'last_activity',
        'session_type',
        'user_agent',
        'location',
    ];

    // Optionally, you can define date casting for timestamps
    protected $casts = [
        'login_at' => 'datetime',
        'last_activity' => 'datetime',
    ];

    // Relationship: A session belongs to a user
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // You can also add methods for specific behaviors, like updating the last activity timestamp
    public function updateLastActivity()
    {
        $this->update([
            'last_activity' => now(),
        ]);
    }


}
