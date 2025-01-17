@extends('layouts.admin')

@section('content')
    <div class="row inbox-wrapper">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 email-aside border-lg-right">
                            @include('pages.email.__aside')
                        </div>
                        <div class="col-lg-9 email-content">
                            <!-- Task Header -->
                            <div class="email-head">
                                <div class="email-head-subject">
                                    <div class="title d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <a class="active" href="#">
                                                <span class="icon">
                                                    <i data-feather="star" class="text-primary-muted"></i>
                                                </span>
                                            </a>
                                            <span class="font-weight-bold">{{ $task->short_name }}</span>
                                        </div>
                                        <div class="date text-muted">{{ $task->created_at->format('d M, H:i') }}</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Task Body -->
                            <div class="email-body">
                                <p>{{ $task->description }}</p>
                            </div>

                            <!-- Task Details -->
                            <div class="task-details mt-3">
                                <div class="row">
                                    <!-- Task Type -->
                                    <div class="col-md-6">
                                        <strong>Vazifa turi:</strong>
                                        <span class="badge badge-info">{{ ucfirst($task->task_type) }}</span>
                                    </div>

                                    <!-- Assigned Users -->
                                    <div class="col-md-6 mt-2">
                                        <strong>Vazifani topshirgan foydalanuvchilar:</strong>
                                        <ul class="list-unstyled">
                                            @foreach ($task->users as $user)
                                                <li>{{ $user->name }} ({{ $user->email }})</li>
                                            @endforeach
                                        </ul>
                                    </div>

                                    <!-- Completion Date -->
                                    <div class="col-md-6 mt-2">
                                        <strong>Yakunlanish sanasi:</strong>
                                        <span>{{ $task->end_date ? $task->end_date->format('d M, Y H:i') : 'Belgilangan emas' }}</span>
                                    </div>
                                </div>
                            </div>

                            <!-- File Attachments -->
                            @if ($task->files->count() > 0)
                                <div class="email-attachments mt-4">
                                    <div class="title">Yuklamalar <span>({{ $task->files->count() }} fayl(lar))</span>
                                    </div>
                                    <ul class="list-unstyled">
                                        @foreach ($task->files as $file)
                                            <li>
                                                <!-- Updated file path to match public path -->
                                                <a href="{{ asset('tasks/' . $task->id . '/' . $file->file_name) }}"
                                                    target="_blank">
                                                    <span data-feather="file"></span> {{ $file->file_name }}
                                                    <span
                                                        class="text-muted tx-11">({{ number_format($file->file_size / 1024, 2) }}
                                                        MB)</span>
                                                </a>
                                                <div class="text-muted tx-11">Yuklagan: {{ $file->user->name }}</div>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif


                            <!-- Task Actions -->
                            @if ($task->users->contains('id', auth()->id()))
                                <!-- Show Qabul qilish button if user is assigned -->
                                <div class="email-actions mt-4">
                                    <a href="{{ route('ijro.accept', $task->id) }}" class="btn btn-success shadow-sm">Qabul
                                        qilish</a>
                                </div>
                            @else
                                <!-- Show Back to Inbox and Edit Task buttons if user is not assigned -->
                                <div class="email-actions mt-4 d-flex justify-content-between">
                                    <a href="{{ route('ijro.index') }}" class="btn btn-secondary shadow-sm">Qabul qilish
                                        qutisiga qaytish</a>
                                    <a href="{{ route('ijro.edit', $task->id) }}"
                                        class="btn btn-primary shadow-sm">Vazifani tahrirlash</a>
                                </div>
                            @endif
                            <hr class="mt-4">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
