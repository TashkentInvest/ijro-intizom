<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentReadsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comment_reads', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('comment_id');
            $table->unsignedBigInteger('user_id');
            $table->timestamp('read_at')->useCurrent();

            $table->foreign('comment_id')->references('id')->on('task_comments')->onDelete('cascade');
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
        Schema::dropIfExists('comment_reads');
    }
}
