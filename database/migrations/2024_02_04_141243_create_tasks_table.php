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
            $table->unsignedBigInteger('nazoratchi_id')->nullable();
            $table->boolean('has_star')->default(false);
            $table->string('short_name');
            $table->text('description');
            $table->timestamp('start_date')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('end_date')->nullable();
            $table->timestamps();
            $table->softDeletes();
            
            $table->unsignedBigInteger('document_id')->nullable();
            $table->foreign('document_id')->references('id')->on('documents');

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('nazoratchi_id')->references('id')->on('users')->onDelete('cascade');
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
