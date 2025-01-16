## About Template

This is ready admin panel template with
- [Laravel 8](https://laravel.com/docs/8.x)
- [Laravel-permissions (Spatie.be)](https://spatie.be/docs/laravel-permission/v3/introduction)
- [Authorization laravel/ui](https://github.com/laravel/ui)

Laravel is accessible, powerful, and provides tools required for large, robust applications.



composer require barryvdh/laravel-dompdf maatwebsite/excel


```
    Schema::create('tasks', function (Blueprint $table) {
        $table->id();
        $table->enum('task_type', ['meeting', 'ht_task', 'emp_task']);
        $table->unsignedBigInteger('user_id');
        $table->string('short_name');
        $table->text('description');
        $table->timestamp('start_date')->default(DB::raw('CURRENT_TIMESTAMP'));
        $table->timestamp('end_date')->nullable();
        $table->timestamps();
        $table->softDeletes(); // Adding the softDeletes column for deletion tracking

        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    });

    Schema::create('task_assignments', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('task_id');
        $table->unsignedBigInteger('user_id');
        $table->unsignedBigInteger('nazoratchi_id');
        $table->unsignedBigInteger('employee_id');
        $table->enum('status', ['pending', 'in_progress', 'completed', 'rejected']);
        $table->timestamp('emp_accepted_at')->nullable();
        $table->timestamp('emp_confirmed_at')->nullable();
        $table->timestamp('emp_finished_at')->nullable();
        $table->timestamp('nazoratchi_confirmed_at')->nullable();
        $table->timestamp('nazoratchi_rejected_at')->nullable();
        $table->timestamp('user_accepted_at')->nullable();
        $table->timestamp('user_confirmed_at')->nullable();
        $table->timestamp('user_rejected_at')->nullable();
        $table->timestamps();
        $table->softDeletes(); // Adding softDeletes for this table

        $table->foreign('task_id')->references('id')->on('tasks')->onDelete('cascade');
        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        $table->foreign('nazoratchi_id')->references('id')->on('users')->onDelete('cascade');
        $table->foreign('employee_id')->references('id')->on('users')->onDelete('cascade');
    });

    Schema::create('task_comments', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('task_id');
        $table->unsignedBigInteger('user_id');
        $table->unsignedBigInteger('parent_id')->nullable();
        $table->text('comment');
        $table->timestamps();
        $table->softDeletes(); // Adding softDeletes for this table

        $table->foreign('task_id')->references('id')->on('tasks')->onDelete('cascade');
        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        $table->foreign('parent_id')->references('id')->on('task_comments')->onDelete('cascade');
    });



    Schema::create('comment_reads', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('comment_id');
        $table->unsignedBigInteger('user_id');
        $table->timestamp('read_at')->useCurrent();

        $table->foreign('comment_id')->references('id')->on('task_comments')->onDelete('cascade');
        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    });

    Schema::create('notifications', function (Blueprint $table) {
        $table->uuid('id')->primary();
        $table->string('type');
        $table->morphs('notifiable'); // Stores notifiable_id and notifiable_type
        $table->json('data');
        $table->timestamp('read_at')->nullable();
        $table->timestamps();
    });

    Schema::create('files', function (Blueprint $table) {
        $table->id();
        $table->string('file_name');
        $table->string('file_path');
        $table->string('file_type');
        $table->unsignedBigInteger('user_id');
        $table->unsignedBigInteger('task_id')->nullable();
        $table->unsignedBigInteger('comment_id')->nullable();
        $table->timestamps();
        $table->softDeletes(); // Adding softDeletes for this table

        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        $table->foreign('task_id')->references('id')->on('tasks')->onDelete('cascade');
        $table->foreign('comment_id')->references('id')->on('task_comments')->onDelete('cascade');
    });

    Schema::create('audits', function (Blueprint $table) {
        $table->id();
        $table->morphs('auditable'); // This stores the ID and type of the model that was changed
        $table->unsignedBigInteger('user_id'); // The user who made the change
        $table->string('event'); // The event type (created, updated, deleted)
        $table->text('old_values')->nullable(); // The old values before the change
        $table->text('new_values')->nullable(); // The new values after the change
        $table->timestamp('created_at')->useCurrent();
    });

    Schema::create('task_history', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('task_id');
        $table->text('change_description'); // Describe what changed
        $table->unsignedBigInteger('user_id'); // Who made the change
        $table->enum('change_type', ['created', 'updated', 'deleted']); // Type of change
        $table->timestamps();

        $table->foreign('task_id')->references('id')->on('tasks')->onDelete('cascade');
        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    });

```

```
* * * * * cd /c/Users/user/Desktop/logistic-new && php artisan schedule:run >> /dev/null 2>&1
    
sudo update-alternatives --config php
```

// slujebniy zapiska br qancha fayl

composer require barryvdh/laravel-dompdf

```
    composer require owen-it/laravel-auditing

    use OwenIt\Auditing\Contracts\Auditable;

    class Task extends Model implements Auditable
    {
        use \OwenIt\Auditing\Auditable;

        // Your other task model code here
    }

     TaskHistory::create([
        'task_id' => $taskId,
        'change_description' => 'Task status updated from pending to in_progress.',
        'user_id' => auth()->id(),
        'change_type' => 'updated',
    ]);

    public function deleteTask($taskId)
    {
        $task = Task::find($taskId);

        if ($task) {
            // Log task deletion
            TaskHistory::create([
                'task_id' => $task->id,
                'change_description' => 'Task was soft-deleted.',
                'user_id' => auth()->id(),
                'change_type' => 'deleted',
            ]);

            $task->delete();
        }

        return response()->json(['message' => 'Task deleted successfully!'], 200);
    }
```
