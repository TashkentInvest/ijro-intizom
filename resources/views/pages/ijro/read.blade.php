@extends('layouts.admin')

@section('content')
    <div class="row inbox-wrapper">
        <div class="col-lg-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4 email-aside border-lg-right">
                            @include('pages.ijro.__aside')
                        </div>
                        <div class="col-lg-8 email-content">
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
                                    <form action="{{ route('ijro.accept', $task->id) }}" method="POST">
                                        @csrf
                                        @method('POST') <!-- Use POST method -->
                                        <button type="submit" class="btn btn-success shadow-sm">Қабул қилиш</button>
                                    </form>
                                </div>
                            @else
                                <!-- Show Back to Inbox and Edit Task buttons if user is not assigned -->
                                <div class="email-actions mt-4 d-flex justify-content-between">
                                    <a href="{{ route('ijro.index') }}" class="btn btn-secondary shadow-sm">Ортга</a>
                                    <a href="{{ route('ijro.edit', $task->id) }}"
                                        class="btn btn-primary shadow-sm">Вазифани таҳрирлаш</a>
                                </div>
                            @endif
                            <hr class="mt-4">
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-lg-3">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Timeline</h6>
                    <div id="content">
                        <ul class="timeline">
                            <li class="event" >
                                <h3>Registration</h3>
                                <p>Get here on time, it's first come first serve. Be late, get turned away.
                                </p>

                                <span class="mt-2 text-sm text-small text-bold">
                                    
                                    <span class="icon">
                                        <i data-feather="clock" class="text-primary-muted"></i>
                                    </span>
                                    12:30 - 1:00pm</span>
                            </li>
                            <li class="event">
                                <h3>Opening Ceremony</h3>
                                <p>Get ready for an exciting event, this will kick off in amazing fashion
                                    with MOP & Busta Rhymes as an opening show.</p>
                            </li>
                            <li class="event" >
                                <h3>Main Event</h3>
                                <p>This is where it all goes down. You will compete head to head with your
                                    friends and rivals. Get ready!</p>
                            </li>
                     
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .timeline {
                border-left: 3px solid #727cf5;
                border-bottom-right-radius: 4px;
                border-top-right-radius: 4px;
                background: rgba(114, 124, 245, 0.09);
                margin: 0 auto;
                letter-spacing: 0.2px;
                position: relative;
                line-height: 1.4em ;
                font-size: 14px !important;
                padding: 50px;
                list-style: none;
                text-align: left;
                max-width: 100% !important;
            }
        </style>
    </div>
@endsection
