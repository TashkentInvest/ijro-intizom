<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTaskAssignmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('task_assignments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('task_id');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('nazoratchi_id')->nullable();
            $table->unsignedBigInteger('employee_id');
            $table->enum('status', ['pending', 'in_progress', 'completed', 'rejected','delayed']);
            // $table->enum('status', ['кутилмоқда', 'бажарилаётган', 'бажарилган', 'бажарилмаган']);

            $table->boolean('is_expired')->default(false);

            $table->timestamp('emp_readed_at')->nullable();
            $table->timestamp('emp_accepted_at')->nullable();
            $table->timestamp('emp_confirmed_at')->nullable();
            $table->timestamp('emp_finished_at')->nullable();
            $table->timestamp('nazoratchi_readed_at')->nullable();
            $table->timestamp('nazoratchi_confirmed_at')->nullable();
            $table->timestamp('nazoratchi_rejected_at')->nullable();
            $table->timestamp('user_readed_at')->nullable();
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
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('task_assignments');
    }
}
