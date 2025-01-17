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
                            <div class="email-inbox-header">
                                <div class="row align-items-center">
                                    <div class="col-lg-6">
                                        <div class="email-title mb-2 mb-md-0">
                                            <span class="icon"><i data-feather="inbox"></i></span>
                                            Inbox
                                            <span class="new-messages">
                                                @if (request('status') == 'all')
                                                    ({{ $statusCounts['all'] }} хабарлар сони)
                                                @elseif(request('status') == 'in_progress')
                                                    ({{ $statusCounts['in_progress'] }} хабарлар сони)
                                                @elseif(request('status') == 'completed')
                                                    ({{ $statusCounts['completed'] }} хабарлар сони)
                                                @elseif(request('status') == 'rejected')
                                                    ({{ $statusCounts['rejected'] }} хабарлар сони)
                                                @elseif(request('status') == 'delayed')
                                                    ({{ $statusCounts['delayed'] }} хабарлар сони)
                                             
                                                @endif
                                            </span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="email-search">
                                            <div class="input-group input-search">
                                                <input class="form-control" type="text" placeholder="Search mail...">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-outline-secondary" type="button">
                                                        <i data-feather="search"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="email-list">
                                @foreach ($tasks as $task)
                                    <div class="email-list-item email-list-item--unread">
                                        <div class="email-list-actions">
                                            <div class="form-check form-check-flat form-check-primary">
                                                <label class="form-check-label">
                                                    <input type="checkbox" class="form-check-input">
                                                </label>
                                            </div>
                                            <a class="favorite active" href="#"><span><i
                                                        data-feather="star"></i></span></a>
                                        </div>
                                        <a href="{{ route('ijro.read', $task->id) }}" class="email-list-detail">
                                            <div>
                                                <span class="from">{{ $task->short_name }}</span>
                                                <p class="msg">{{ $task->description }}</p>
                                            </div>
                                            <span class="date">
                                                <span class="icon"><i data-feather="paperclip"></i> </span>
                                                {{ $task->start_date->format('d M') }}
                                            </span>
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
