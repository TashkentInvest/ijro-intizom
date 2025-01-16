<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Audit extends Model
{
    protected $fillable = [
        'auditable_type',    // The type of model being audited
        'auditable_id',      // The ID of the model being audited
        'user_id',           // The user who performed the change
        'event',             // The event type: created, updated, deleted
        'old_values',        // The values before the change (for updates and deletes)
        'new_values',        // The values after the change (for updates and creates)
    ];

    protected $casts = [
        'old_values' => 'array',  // Casting old and new values to array
        'new_values' => 'array',
    ];

    /**
     * Get the auditable entity (task, comment, etc.)
     */
    public function auditable()
    {
        return $this->morphTo();
    }

    /**
     * Get the user that performed the audit.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
