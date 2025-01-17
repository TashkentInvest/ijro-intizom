<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->enum('task_type', ['meeting', 'hr_task', 'emp_task']);
            $table->unsignedBigInteger('user_id');
            $table->string('short_name');
            $table->text('description');
            $table->timestamp('start_date')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('end_date')->nullable();
            $table->timestamps();
            $table->softDeletes(); // Adding the softDeletes column for deletion tracking

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
        Schema::dropIfExists('tasks');
    }
}
