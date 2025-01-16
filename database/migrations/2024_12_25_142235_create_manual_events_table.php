<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateManualEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('manual_events', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();          // Event title
            $table->dateTime('start_date')->nullable();   // Start
            $table->dateTime('end_date')->nullable(); // End
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('manual_events');
    }
}
