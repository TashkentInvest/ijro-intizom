<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserSessionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_sessions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade'); // Relating to the users table
            $table->string('ip_address');
            $table->string('mac_address')->nullable(); // Optional, as not all devices may have this info available
            $table->timestamp('login_at')->useCurrent(); // Timestamp of when the user logged in
            $table->timestamp('last_activity')->nullable(); // Last time the user was active
            $table->enum('session_type', ['web', 'mobile', 'api'])->default('web'); // Identifying the platform used to log in
            $table->string('user_agent')->nullable(); // To store browser info
            $table->string('location')->nullable(); // Optional, you could store the location based on IP or user input
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
        Schema::dropIfExists('user_sessions');
    }
}
