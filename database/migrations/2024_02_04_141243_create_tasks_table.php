    <?php

    use Illuminate\Database\Migrations\Migration;
    use Illuminate\Database\Schema\Blueprint;
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
    
                          
                $table->unsignedBigInteger('user_id'); //user_id
                $table->foreign('user_id')->references('id')->on('users');
    
                $table->unsignedBigInteger('nazoratchi_id'); //nazoratchi_id
                $table->foreign('nazoratchi_id')->references('id')->on('users');
    
                $table->unsignedBigInteger('employee_id'); //employee_id
                $table->foreign('employee_id')->references('id')->on('users');

                $table->unsignedBigInteger('finished_user_id')->nullable(); // finished employee id
                $table->foreign('finished_user_id')->references('id')->on('users');
    
                $table->unsignedBigInteger('task_id');
                $table->foreign('task_id')->references('id')->on('tasks');

                $table->enum('task_type', ['meeting', 'employee_task', 'hr_task']);
                
                $table->unsignedBigInteger('status_id')->default(1);
                $table->foreign('status_id')->references('id')->on('task_status');
    
         
                // Additional columns
                $table->string('poruchenie')->nullable();                
                $table->dateTime('issue_date')->nullable();             
                $table->dateTime('planned_completion_date')->nullable(); 
                
                $table->string('attached_file')->nullable(); 
                $table->string('attached_file_employee')->nullable(); 
                $table->string('short_name')->nullable(); 
                $table->text('note')->nullable(); 
                $table->string('assign_type')->nullable(); 
                $table->text('reject_comment')->nullable(); 
                $table->dateTime('reject_time')->nullable(); 
    
                $table->foreignId('document_id')->nullable()->constrained('documents')->nullOnDelete();

                $table->integer('completed_time')->nullable();
                
                $table->integer('checked_status')->default(0);
                $table->text('checked_comment')->nullable(); 
                $table->dateTime('checked_time')->nullable(); 
    
                // Optional role relationship
                $table->unsignedBigInteger('role_id')->nullable();
                $table->foreign('role_id')->references('id')->on('roles')->onDelete('cascade');

                $table->softDeletes();
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
            Schema::dropIfExists('tasks');
        }
    }
