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
                        <div class="col-lg-8 task-details-container">
                            <!-- Task Header -->
                            <div class="task-header mb-4">
                                <div class="d-flex justify-content-between">
                                    <div class="task-header-left d-flex align-items-center">
                                        <span class="task-status-icon">
                                            <i data-feather="star" class="text-warning"></i>
                                        </span>
                                        <h3 class="font-weight-bold">{{ $task->short_name }}</h3>
                                    </div>
                                    <div class="task-header-right text-muted">
                                        <small>Яратилган сана: {{ $task->created_at->format('d M, Y, H:i') }}</small>
                                    </div>
                                </div>
                            </div>

                            <!-- Task Description -->
                            <div class="task-description mb-4">
                                <h5 class="font-weight-bold">Вазифа Тасвири</h5>
                                <p class="lead text-justify">{{ $task->description }}</p>
                            </div>

                            <!-- Task Details -->
                            <div class="task-details mb-4">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <strong>Вазифа Тури:</strong>
                                        <span class="badge badge-info">{{ ucfirst($task->task_type) }}</span>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <strong>Якунланиш Санаси:</strong>
                                        <span>{{ $task->end_date ? $task->end_date->format('d M, Y H:i') : 'Белгиланган Эмас' }}</span>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <strong>Юборган Ҳодим:</strong>
                                        <ul class="list-unstyled">
                                            @foreach ($task->users as $user)
                                                <li><i data-feather="user" class="mr-2"></i>{{ $user->name }}
                                                    ({{ $user->email }})
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- Task Assignments -->
                            @if ($task->taskAssignments->count() > 0)
                                <div class="task-assignments mb-4">
                                    <h5><i data-feather="check-circle" class="mr-2 mb-2"></i>Вазифа Таъинланган Ҳодимлар
                                    </h5>
                                    <table class="table table-bordered table-striped">
                                        <thead class="table-dark">
                                            <tr>
                                                <th style="color: #fff;">Ҳодим</th>
                                                <th style="color: #fff;">Ҳолат</th>
                                                <th style="color: #fff;">Қабул Қилинган Санаси</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($task->taskAssignments as $assignment)
                                                <tr>
                                                    <td><i data-feather="user"
                                                            class="mr-2"></i>{{ $assignment->employee->name ?? 'Белгиланмаган' }}
                                                    </td>
                                                    <td>
                                                        <span
                                                            class="badge 
                                                            @if ($assignment->status == 'pending') bg-warning 
                                                            @elseif($assignment->status == 'in_progress') bg-primary
                                                            @elseif($assignment->status == 'completed') bg-success
                                                            @elseif($assignment->status == 'rejected') bg-danger
                                                            @else bg-secondary @endif">
                                                            {{ ucfirst($assignment->status) }}
                                                        </span>
                                                    </td>
                                                    <td>{{ $assignment->emp_accepted_at ? $assignment->emp_accepted_at->format('d M, Y H:i') : 'Қабул Қилинмаган' }}
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @endif

                            <!-- File Attachments -->
                            @if ($task->files->count() > 0)
                                <div class="file-attachments mb-4">
                                    <h5><i data-feather="paperclip" class="mr-2 mb-2"></i>Юкламалар</h5>
                                    <ul class="list-unstyled">
                                        @foreach ($task->files as $file)
                                            <li class="mb-3">
                                                <a href="{{ asset('tasks/' . $task->id . '/' . $file->file_name) }}"
                                                    target="_blank" class="text-decoration-none">
                                                    <i data-feather="file" class="mr-2"></i>{{ $file->file_name }}
                                                    <span class="text-muted">
                                                        @php
                                                            // Get the full path to the file
                                                            $filePath = public_path(
                                                                'tasks/' . $task->id . '/' . $file->file_name,
                                                            );
                                                            $fileSize = file_exists($filePath)
                                                                ? filesize($filePath) / 1024
                                                                : 0;
                                                        @endphp
                                                        ({{ number_format($fileSize, 2) }} KB)
                                                    </span>
                                                </a>
                                                <div class="text-muted">Юклади: {{ $file->user->name }}</div>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif


                            <!-- File Attachments -->
                            {{-- @if ($task->files->count() > 0)
                               <div class="file-attachments mb-4">
                                   <h5><i data-feather="paperclip" class="mr-2 mb-2"></i>Юкламалар</h5>
                                   <ul class="list-unstyled">
                                       @foreach ($task->files as $file)
                                           <li class="mb-3">
                                               <a href="{{ asset('storage/' . $file->file_path) }}" target="_blank" class="text-decoration-none">
                                                   <i data-feather="file" class="mr-2"></i>{{ $file->file_name }}
                                                   <span class="text-muted">
                                                     
                                                   </span>
                                               </a>
                                               <div class="text-muted">Юклади: {{ $file->user->name }}</div>
                                           </li>
                                       @endforeach
                                   </ul>
                               </div>
                           @endif --}}


                            <!-- Task Actions -->
                            @if ($task->users->contains('id', auth()->id()))
                                <div class="task-actions mt-4">
                                    @php
                                        $assignment = $task->taskAssignments->first();
                                    @endphp

                                    @if ($assignment && isset($assignment->emp_accepted_at))
                                        @if ($assignment->status !== 'pending')
                                            <button type="button" class="btn btn-success shadow-sm" data-bs-toggle="modal"
                                                data-bs-target="#completeTaskModal">
                                                <i data-feather="check-circle" class="mr-2"></i>Вазифани Якунлаш
                                            </button>
                                        @endif
                                    @else
                                        <form action="{{ route('ijro.emp_accept', $task->id) }}" method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-success shadow-sm"><i data-feather="check"
                                                    class="mr-2"></i>Қабул Қилиш</button>
                                        </form>
                                    @endif
                                </div>
                            @else
                                <div class="task-actions mt-4 d-flex justify-content-between">
                                    <a href="{{ route('ijro.index') }}" class="btn btn-secondary shadow-sm"><i
                                            data-feather="arrow-left" class="mr-2"></i>Ортга</a>
                                    <a href="{{ route('ijro.edit', $task->id) }}" class="btn btn-primary shadow-sm"><i
                                            data-feather="edit" class="mr-2"></i>Вазифани Таҳрирлаш</a>
                                </div>
                            @endif

                            <!-- Modal for Task Completion -->
                            <div class="modal fade" id="completeTaskModal" tabindex="-1"
                                aria-labelledby="completeTaskModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header bg-success text-white">
                                            <h5 class="modal-title" id="completeTaskModalLabel"><i
                                                    data-feather="check-circle" class="mr-2"></i>Вазифани Якунлаш</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <form action="{{ route('ijro.complete', $task->id) }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <label for="completion_description" class="form-label">Якунлаш
                                                        Тасвири</label>
                                                    <textarea class="form-control" id="completion_description" name="completion_description" required></textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="completion_files" class="form-label">Файл Юклаш</label>
                                                    <input type="file" class="form-control" id="completion_files"
                                                        name="completion_files[]" multiple>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal"><i data-feather="x-circle"
                                                        class="mr-2"></i>Бекор Қилиш</button>
                                                <button type="submit" class="btn btn-primary"><i
                                                        data-feather="check-circle" class="mr-2"></i>Якунлаш</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-lg-3">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Вазифа тарихи</h6>
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
