<?php

namespace App\Models\Traits;

use App\Models\Audit;
use Illuminate\Support\Facades\Auth;

trait Auditable
{
    /**
     * Boot the Auditable trait for a model.
     */
    public static function bootAuditable()
    {
        static::created(function ($model) {
            $model->logAudit('created');
        });

        static::updated(function ($model) {
            $model->logAudit('updated');
        });

        static::deleted(function ($model) {
            $model->logAudit('deleted');
        });
    }

    /**
     * Log the audit for the model.
     *
     * @param string $event
     * @return void
     */
    protected function logAudit(string $event)
    {
        $user = Auth::user(); // Get the current user performing the action

        // Create the audit record
        Audit::create([
            'auditable_type' => get_class($this),
            'auditable_id' => $this->id,
            'user_id' => $user ? $user->id : null,
            'event' => $event,
            'old_values' => $event === 'updated' ? $this->getOriginal() : null, // Only store old values on update
            'new_values' => $event === 'updated' || $event === 'created' ? $this->getAttributes() : null, // Store new values for create and update
        ]);
    }
}
