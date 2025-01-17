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
                            <div class="email-head">
                                <div class="email-head-subject">
                                    <div class="title d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <a class="active" href="#">
                                                <span class="icon">
                                                    <i data-feather="star" class="text-primary-muted"></i>
                                                </span>
                                            </a>
                                            <span>{{ $task->short_name }}</span>
                                        </div>
                                        <div class="date">{{ $task->created_at->format('d M, H:i') }}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="email-body">
                                <p>{{ $task->description }}</p>
                            </div>
                            @if ($task->files->count() > 0)
                                <div class="email-attachments">
                                    <div class="title">Ilovalar <span>({{ $task->files->count() }} файллар)</span></div>
                                    <ul>
                                        @foreach ($task->files as $file)
                                            <li>
                                                <a href="{{ asset('storage/' . $file->file_path) }}" target="_blank">
                                                    <span data-feather="file"></span> {{ $file->file_name }}
                                                    <span class="text-muted tx-11">({{ number_format($file->file_size / 1024, 2) }} MB)</span>
                                                </a>
                                                <div class="text-muted tx-11">Файл қўшган: {{ $file->user->name }}</div>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                            <div class="email-actions mt-4">
                                <a href="{{ route('ijro.index') }}" class="btn btn-secondary">Кириш жўнатмаларига қайтиш</a>
                                <a href="{{ route('ijro.edit', $task->id) }}" class="btn btn-primary">Топшириқни таҳрирлаш</a>
                            </div>
                            <hr>

                         

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

