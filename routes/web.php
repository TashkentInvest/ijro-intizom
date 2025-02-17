<?php

use App\Http\Controllers\AuditController;
use App\Http\Controllers\IjroController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Blade\UserController;
use App\Http\Controllers\Blade\RoleController;
use App\Http\Controllers\Blade\PermissionController;
use App\Http\Controllers\Blade\HomeController;
use App\Http\Controllers\Blade\ApiUserController;
use App\Http\Controllers\Blade\CategoryController;
use App\Http\Controllers\Blade\DashboardController;
use App\Http\Controllers\Blade\MonitoringController;
use App\Http\Controllers\Blade\EmployeeController;
use App\Http\Controllers\Blade\LongTextController;
use App\Http\Controllers\Blade\TaskController;
use App\Http\Controllers\Blade\OrderController;
use App\Http\Controllers\CommentReadController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\DemoController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\FileDownloadController;
use App\Http\Controllers\FileController;
use App\Http\Controllers\ManualEventController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\QarorlarController;
use App\Http\Controllers\StatisticsController;
use App\Http\Controllers\TaskCommentController;
use App\Http\Controllers\TaskHistoryController;

/*
|--------------------------------------------------------------------------
| Blade (front-end) Routes
|--------------------------------------------------------------------------
|
| Here is we write all routes which are related to web pages
| like UserManagement interfaces, Diagrams and others
|
*/

Route::middleware(['auth'])->group(function () {
    // Route::resource('files', FileController::class); // Exclude show from resource
    Route::get('/files', [FileController::class, 'index'])->name('files.index');
    Route::get('/files/create', [FileController::class, 'create'])->name('files.create');
    Route::post('/files', [FileController::class, 'store'])->name('files.store');

    Route::get('/files/{slug}', [FileController::class, 'show'])->name('files.show');
});

// Default laravel auth routes
Auth::routes(['register' => false]);

// file start

// file end

// Welcome page
Route::get('/', function () {
    return view('welcome');
});


// Web pages
Route::group(['middleware' => 'auth'], function () {

    // there should be graphics, diagrams about total conditions
    Route::get('/home', [HomeController::class, 'index'])->name('home');

    // Users
    Route::get('/users', [UserController::class, 'index'])->name('userIndex');
    Route::get('/user/add', [UserController::class, 'add'])->name('userAdd');
    Route::post('/user/create', [UserController::class, 'create'])->name('userCreate');
    Route::get('/user/{id}/edit', [UserController::class, 'edit'])->name('userEdit');
    Route::post('/user/update/{id}', [UserController::class, 'update'])->name('userUpdate');
    Route::delete('/user/delete/{id}', [UserController::class, 'destroy'])->name('userDestroy');
    Route::get('/user/theme-set/{id}', [UserController::class, 'setTheme'])->name('userSetTheme');
    Route::post('/user/toggle-status/{id}', [UserController::class, 'toggleUserActivation'])->name('userActivation');
    Route::get('/profile', [UserController::class, 'userProfile'])->name('userProfile');

    // Permissions
    Route::get('/permissions', [PermissionController::class, 'index'])->name('permissionIndex');
    Route::get('/permission/add', [PermissionController::class, 'add'])->name('permissionAdd');
    Route::post('/permission/create', [PermissionController::class, 'create'])->name('permissionCreate');
    Route::get('/permission/{id}/edit', [PermissionController::class, 'edit'])->name('permissionEdit');
    Route::post('/permission/update/{id}', [PermissionController::class, 'update'])->name('permissionUpdate');
    Route::delete('/permission/delete/{id}', [PermissionController::class, 'destroy'])->name('permissionDestroy');

    // Roles
    Route::get('/roles', [RoleController::class, 'index'])->name('roleIndex');
    Route::get('/role/add', [RoleController::class, 'add'])->name('roleAdd');
    Route::post('/role/create', [RoleController::class, 'create'])->name('roleCreate');
    Route::get('/role/{role_id}/edit', [RoleController::class, 'edit'])->name('roleEdit');
    Route::post('/role/update/{role_id}', [RoleController::class, 'update'])->name('roleUpdate');
    Route::delete('/role/delete/{id}', [RoleController::class, 'destroy'])->name('roleDestroy');

    // ApiUsers
    Route::get('/api-users', [ApiUserController::class, 'index'])->name('api-userIndex');
    Route::get('/api-user/add', [ApiUserController::class, 'add'])->name('api-userAdd');
    Route::post('/api-user/create', [ApiUserController::class, 'create'])->name('api-userCreate');
    Route::get('/api-user/show/{id}', [ApiUserController::class, 'show'])->name('api-userShow');
    Route::get('/api-user/{id}/edit', [ApiUserController::class, 'edit'])->name('api-userEdit');
    Route::post('/api-user/update/{id}', [ApiUserController::class, 'update'])->name('api-userUpdate');
    Route::delete('/api-user/delete/{id}', [ApiUserController::class, 'destroy'])->name('api-userDestroy');
    Route::delete('/api-user-token/delete/{id}', [ApiUserController::class, 'destroyToken'])->name('api-tokenDestroy');

    // Category
    Route::get('/category', [CategoryController::class, 'index'])->name('categoryIndex');
    Route::get('/category/add', [CategoryController::class, 'add'])->name('categoryAdd');
    Route::post('/category/create', [CategoryController::class, 'create'])->name('categoryCreate');
    Route::get('/category/{id}/edit', [CategoryController::class, 'edit'])->name('categoryEdit');
    Route::post('/category/update/{category_id}', [CategoryController::class, 'update'])->name('categoryUpdate');
    Route::delete('/category/delete/{id}', [CategoryController::class, 'destroy'])->name('categoryDestroy');





    // qarorlarIndex
    Route::get('/qarorlar', [QarorlarController::class, 'index'])->name('qarorlarIndex');
    Route::get('/qarorlar/add', [QarorlarController::class, 'add'])->name('qarorlarAdd');
    Route::post('/qarorlar/store', [QarorlarController::class, 'store'])->name('qarorlarStore');
    Route::get('/qarorlar/{id}', [QarorlarController::class, 'show'])->name('qarorlarShow');
    Route::get('/qarorlar/{id}/edit', [QarorlarController::class, 'edit'])->name('qarorlarEdit');
    Route::post('/qarorlar/update/{id}', [QarorlarController::class, 'update'])->name('qarorlarUpdate');
    Route::delete('/qarorlar/delete/{id}', [QarorlarController::class, 'destroy'])->name('qarorlarDestroy');

    // Order controller
    Route::post('/orders', [OrderController::class, 'store'])->name('orders.store');
    Route::post('/orders/reject', [OrderController::class, 'reject'])->name('orders.reject');
    Route::post('/orders/complete', [OrderController::class, 'complete'])->name('orders.complete');
    Route::post('/orders/admin_confirm', [OrderController::class, 'adminConfirm'])->name('orders.admin_confirm');
    Route::post('/orders/admin_reject', [OrderController::class, 'adminReject'])->name('orders.admin_reject');



    // Monitoring


    // Employee
    Route::get('/employees', [EmployeeController::class, 'index'])->name('employeeIndex');
    Route::get('/employee/add', [EmployeeController::class, 'add'])->name('employeeAdd');
    Route::post('/employee/create', [EmployeeController::class, 'create'])->name('employeeCreate');
    Route::get('/employee/{id}/edit', [EmployeeController::class, 'edit'])->name('employeeEdit');
    Route::post('/employee/update/{user_id}', [EmployeeController::class, 'update'])->name('employeeUpdate');
    Route::delete('/employee/delete/{id}', [EmployeeController::class, 'destroy'])->name('employeeDestroy');
    Route::post('/employee/toggle-status/{id}', [EmployeeController::class, 'toggleProductActivation'])->name('productActivation');



    // Long text
    Route::get('/long-texts', [LongTextController::class, 'index'])->name('longTextIndex');
    Route::get('/long-text/add', [LongTextController::class, 'add'])->name('longTextAdd');
    Route::post('/long-text/create', [LongTextController::class, 'create'])->name('longTextCreate');
    Route::get('/long-text/{id}/edit', [LongTextController::class, 'edit'])->name('longTextEdit');
    Route::post('/long-text/update/{longText_id}', [LongTextController::class, 'update'])->name('longTextUpdate');
    Route::delete('/long-text/delete/{id}', [LongTextController::class, 'destroy'])->name('longTextDestroy');

    // Document

    Route::get('/cheque', [ReportController::class, 'cheque'])->name('chequeIndex');

    // COMMAND CONTROLLER
    Route::any('/toggle-command', [DemoController::class, 'toggleCommand'])->name('toggleCommand');
    Route::get('/get-status', [DemoController::class, 'getStatus'])->name('getStatus');


    // filedonloader

    Route::delete('/files/{id}', [TaskController::class, 'deleteFile'])->name('file.delete');


    Route::get('download-pdf', [FileDownloadController::class, 'downloadPdf']);
    Route::get('download-excel', [FileDownloadController::class, 'downloadExcel']);
    Route::get('download-csv', [FileDownloadController::class, 'downloadCsv']);



    // edo template routes -------------------------------------------------------------
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboardIndex');
    // Route::get('/monitoring', [ProductController::class, 'index'])->name('monitoringIndex');
    // Task
    Route::get('/monitoring/fishka/{id}', [ProductController::class, 'fishka'])->name('monitoringFishka');
    Route::get('/task/add', [TaskController::class, 'add'])->name('taskAdd');
    Route::post('/task/create', [TaskController::class, 'create'])->name('taskCreate');
    Route::get('/task/{id}', [TaskController::class, 'show'])->name('taskShow');
    Route::get('/task/{id}/edit', [TaskController::class, 'edit'])->name('taskEdit');
    Route::post('/task/update/{task_id}', [TaskController::class, 'update'])->name('taskUpdate');
    Route::delete('/task/delete/{id}', [TaskController::class, 'destroy'])->name('taskDestroy');

    Route::post('/task/admin_confirm/{id}', [TaskController::class, 'adminConfirm'])->name('tasks.admin_confirm');



    Route::get('/documents', [DocumentController::class, 'index'])->name('documents.index'); // List all documents
    Route::get('/documents/create', [DocumentController::class, 'create'])->name('documents.create'); // Show form to create a new document
    Route::post('/documents', [DocumentController::class, 'store'])->name('documents.store'); // Store a new document
    Route::get('/documents/{document}', [DocumentController::class, 'show'])->name('documents.show'); // Show details of a single document
    Route::get('/documents/{document}/edit', [DocumentController::class, 'edit'])->name('documents.edit'); // Show form to edit an existing document
    Route::put('/documents/{document}', [DocumentController::class, 'update'])->name('documents.update'); // Update an existing document
    Route::delete('/documents/{document}', [DocumentController::class, 'destroy'])->name('documents.destroy'); // Delete a document


    Route::post('/clear-cache', [ManualEventController::class, 'clearCache'])->name('clearCache');


    Route::get('/calendar', [ManualEventController::class, 'index'])->name('calendar.index');
    Route::post('/manual-events/store', [ManualEventController::class, 'store'])->name('manual-events.store');

    // Update manual event
    Route::put('/calendar/update/{id}', [ManualEventController::class, 'update'])->name('calendar.update');

    // Delete manual event
    Route::delete('/calendar/destroy/{id}', [ManualEventController::class, 'destroy'])->name('calendar.destroy');
});

// Change language session condition
Route::get('/language/{lang}', function ($lang) {
    $lang = strtolower($lang);
    if ($lang == 'ru' || $lang == 'uz') {
        session([
            'locale' => $lang
        ]);
    }
    return redirect()->back();
})->name('changelang');

/*
|--------------------------------------------------------------------------
| This is the end of Blade (front-end) Routes
|-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\
*/

Route::middleware('auth')->group(function () {

    // Task Routes
    Route::get('tasks', [TaskController::class, 'index']); // List all tasks
    Route::post('tasks', [TaskController::class, 'store']); // Create a new task
    Route::get('tasks/{task}', [TaskController::class, 'show']); // Show a task
    Route::put('tasks/{task}', [TaskController::class, 'update']); // Update task
    Route::delete('tasks/{task}', [TaskController::class, 'destroy']); // Delete task
    Route::get('tasks/{task}/history', [TaskController::class, 'history']); // View task history

    // Task Assignment Routes
    Route::get('task-assignments', [TaskAssignmentController::class, 'index']); // List all task assignments
    Route::post('task-assignments', [TaskAssignmentController::class, 'store']); // Assign a task
    Route::get('task-assignments/{taskAssignment}', [TaskAssignmentController::class, 'show']); // Show a specific task assignment
    Route::put('task-assignments/{taskAssignment}', [TaskAssignmentController::class, 'update']); // Update task assignment
    Route::delete('task-assignments/{taskAssignment}', [TaskAssignmentController::class, 'destroy']); // Delete task assignment
    Route::patch('task-assignments/{taskAssignment}/accept', [TaskAssignmentController::class, 'accept']); // Accept task
    Route::patch('task-assignments/{taskAssignment}/reject', [TaskAssignmentController::class, 'reject']); // Reject task
    Route::patch('task-assignments/{taskAssignment}/complete', [TaskAssignmentController::class, 'complete']); // Complete task

    // Task Comment Routes
    Route::get('task-comments', [TaskCommentController::class, 'index']); // List all task comments
    Route::post('task-comments', [TaskCommentController::class, 'store']); // Create a new comment
    Route::get('task-comments/{taskComment}', [TaskCommentController::class, 'show']); // Show a specific comment
    Route::put('task-comments/{taskComment}', [TaskCommentController::class, 'update']); // Update comment
    Route::delete('task-comments/{taskComment}', [TaskCommentController::class, 'destroy']); // Delete comment
    Route::post('task-comments/{taskComment}/reply', [TaskCommentController::class, 'reply']); // Reply to comment

    // Comment Read Routes
    Route::get('comment-reads', [CommentReadController::class, 'index']); // List all comment reads
    Route::post('comment-reads', [CommentReadController::class, 'store']); // Mark comment as read
    Route::post('comment-reads/{commentRead}/mark-as-read', [CommentReadController::class, 'markAsRead']); // Mark specific comment as read

    // Notification Routes
    Route::get('notifications', [NotificationController::class, 'index']); // List all notifications
    Route::get('notifications/{notification}', [NotificationController::class, 'show']); // Show a specific notification
    Route::post('notifications/{notification}/mark-as-read', [NotificationController::class, 'markAsRead']); // Mark notification as read

    // File Routes
    Route::get('files', [FileController::class, 'index']); // List all files
    Route::post('files', [FileController::class, 'store']); // Upload a file
    Route::get('files/{file}', [FileController::class, 'show']); // Show a specific file
    Route::delete('files/{file}', [FileController::class, 'destroy']); // Delete a file
    Route::get('files/{file}/download', [FileController::class, 'download']); // Download a file

    // Audit Routes
    Route::get('audits', [AuditController::class, 'index']); // List all audits
    Route::get('audits/{audit}', [AuditController::class, 'show']); // Show a specific audit

    // Task History Routes
    Route::get('task-histories', [TaskHistoryController::class, 'index']); // List all task histories
    Route::get('task-histories/{taskHistory}', [TaskHistoryController::class, 'show']); // Show specific task history

    Route::get('ijro/index', [IjroController::class, 'index'])->name('ijro.index');
    Route::get('ijro/read/{id}', [IjroController::class, 'read'])->name('ijro.read');
    Route::get('ijro/compose', [IjroController::class, 'compose'])->name('ijro.compose');
    Route::post('/ijro/create', [IjroController::class, 'create'])->name('ijroCreate');
    Route::get('ijro/edit/{id}', [IjroController::class, 'edit'])->name('ijro.edit');
    Route::post('ijro/update/{id}', [IjroController::class, 'update'])->name('ijro.update');

    Route::post('/task_assignments', [TaskAssignmentController::class, 'store'])->name('task_assignments.store');
    Route::post('/task_comments', [TaskCommentController::class, 'store'])->name('task_comments.store');
    Route::post('/files', [FileController::class, 'store'])->name('files.store');

    Route::post('/tasks/{task}/accept', [IjroController::class, 'emp_accept'])->name('ijro.emp_accept');
    Route::post('/tasks/{task}/complete', [IjroController::class, 'completeTask'])->name('ijro.complete');


    Route::post('/tasks/{task}/confirm-by-admin', [IjroController::class, 'confirmByAdmin'])->name('ijro.confirmByAdmin');
    Route::post('/tasks/{task}/reject-by-admin', [IjroController::class, 'rejectByAdmin'])->name('ijro.rejectByAdmin');


    Route::get('statistics', [StatisticsController::class, 'index'])->name('statistics.index');

    Route::get('/export-tasks', [IjroController::class, 'exportTasks'])->name('exportTasks');

});
