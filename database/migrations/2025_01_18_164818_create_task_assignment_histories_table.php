<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTaskAssignmentHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('task_assignment_histories', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('task_assignment_id'); // Reference to the task_assignment record
            $table->unsignedBigInteger('user_id'); // The user who performed the action
            $table->enum('action_type', ['created', 'updated', 'status_changed', 'assigned', 'rejected', 'confirmed', 'read']); // Type of action
            $table->text('description')->nullable(); // Optional description of the action
            $table->enum('previous_status', ['pending', 'in_progress', 'completed', 'rejected', 'delayed'])->nullable(); // Previous status (if applicable)
            $table->enum('new_status', ['pending', 'in_progress', 'completed', 'rejected', 'delayed'])->nullable(); // New status after the action
            $table->timestamps(); // Store the timestamp of the action
        
            // Foreign key references
            $table->foreign('task_assignment_id')->references('id')->on('task_assignments')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('task_assignment_histories');
    }
}
