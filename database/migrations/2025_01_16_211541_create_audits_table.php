<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAuditsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('audits', function (Blueprint $table) {
            $table->id();
            $table->morphs('auditable'); // This stores the ID and type of the model that was changed
            $table->unsignedBigInteger('user_id'); // The user who made the change
            $table->string('event'); // The event type (created, updated, deleted)
            $table->text('old_values')->nullable(); // The old values before the change
            $table->text('new_values')->nullable(); // The new values after the change
            $table->timestamp('created_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('audits');
    }
}
