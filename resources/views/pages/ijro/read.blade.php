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


                            @if ($task->users->contains('id', auth()->id()))
                                <div class="email-actions mt-4">
                                    @if ($task->users->contains('id', auth()->id()))
                                        <div class="email-actions mt-4">
                                            @php
                                                $assignment = $task->taskAssignments->first();
                                            @endphp

                                            @if ($assignment && isset($assignment->emp_accepted_at))
                                                @if ($assignment->status !== 'pending')
                                                    <!-- Показываем "Вазифани Якунлаш", если задание принято и статус не "pending" -->
                                                    <button type="button" class="btn btn-primary shadow-sm"
                                                        data-bs-toggle="modal" data-bs-target="#completeTaskModal">
                                                        Вазифани Якунлаш
                                                    </button>
                                                @endif
                                            @else
                                                <!-- Показываем "Қабул қилиш", если задание не принято -->
                                                <form action="{{ route('ijro.emp_accept', $task->id) }}" method="POST">
                                                    @csrf
                                                    <button type="submit" class="btn btn-success shadow-sm">Қабул
                                                        қилиш</button>
                                                </form>
                                            @endif
                                        </div>
                                    @endif
                                </div>
                            @else
                                <!-- Show Back and Edit buttons if user is not assigned -->
                                <div class="email-actions mt-4 d-flex justify-content-between">
                                    <a href="{{ route('ijro.index') }}" class="btn btn-secondary shadow-sm">Ортга</a>
                                    <a href="{{ route('ijro.edit', $task->id) }}"
                                        class="btn btn-primary shadow-sm">Вазифани таҳрирлаш</a>
                                </div>
                            @endif

                            <!-- Modal Window for Task Completion -->
                            <div class="modal fade" id="completeTaskModal" tabindex="-1"
                                aria-labelledby="completeTaskModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="completeTaskModalLabel">Вазифани якунлаш</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <form action="{{ route('ijro.complete', $task->id) }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <label for="completion_description" class="form-label">Изоҳ</label>
                                                    <textarea class="form-control" id="completion_description" name="completion_description" required></textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="completion_files" class="form-label">Файл юклаш</label>
                                                    <input type="file" class="form-control" id="completion_files"
                                                        name="completion_files[]" multiple>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Бекор қилиш</button>
                                                <button type="submit" class="btn btn-primary">Якунлаш</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <hr class="mt-4">



                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-lg-3">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Таймлайн</h6>
                    <div id="content">
                        <ul class="timeline">
                            @foreach ($task->taskAssignments as $assignment)
                                @foreach ($assignment->history as $record)
                                    <li class="event">
                                        <h3>{{ ucfirst(str_replace('_', ' ', $record->action_type)) }}</h3>
                                        <p>
                                            <strong>{{ $record->user->name ?? 'Номаълум фойдаланувчи' }}</strong> бу амални
                                            бажарди.
                                            @if ($record->previous_status && $record->new_status)
                                                <br><span class="badge bg-secondary">{{ $record->previous_status }}</span>
                                                →
                                                <span class="badge bg-success">{{ $record->new_status }}</span>
                                            @endif
                                            <br>
                                            <span class="text-muted">{{ $record->created_at->format('d.m.Y H:i') }}</span>
                                        </p>
                                        @if ($record->description)
                                            <p>{{ $record->description }}</p>
                                        @endif
                                    </li>
                                @endforeach
                            @endforeach
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
                line-height: 1.4em;
                font-size: 14px !important;
                padding: 50px;
                list-style: none;
                text-align: left;
                max-width: 100% !important;
            }
        </style>
    </div>
@endsection
