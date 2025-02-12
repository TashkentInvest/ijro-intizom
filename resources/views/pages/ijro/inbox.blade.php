@extends('layouts.admin')

@section('content')
    <div class="row inbox-wrapper">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 email-aside border-lg-right">
                            @include('pages.ijro.__aside')
                        </div>
                        <div class="col-lg-9 email-content">
                            <div class="email-inbox-header">
                                <div class="row align-items-center">
                                    <div class="col-lg-6">
                                        <div class="email-title mb-2 mb-md-0">
                                            <span class="icon"><i data-feather="inbox"></i></span>
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
                                                <form action="{{ route('ijro.index') }}" method="GET"
                                                    class="w-100 d-flex">
                                                    <input class="form-control" type="text" name="search"
                                                        value="{{ request('search') }}" placeholder="Қидириш...">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-outline-secondary" type="submit">
                                                            <i data-feather="search"></i>
                                                        </button>
                                                    </span>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="email-list">
                                @foreach ($tasks as $task)
                                    <div
                                        class="email-list-item {{ $task->short_name != 'azzz' ? 'email-list-item--unread' : '' }}">
                                        <div class="email-list-actions">

                                            @if (isset($task->taskAssignments) && $task->taskAssignments->isNotEmpty())
                                                <a class="success active" href="#">
                                                    <span class="check-icon">
                                                        <i class="fa-solid fa-check-double"></i>
                                                    </span>
                                                </a>
                                            @else
                                                <a class="success active" href="#">
                                                    <span class="check-icon">
                                                        <i class="fa-solid fa-check"></i>
                                                    </span>
                                                </a>
                                            @endif


                                            {{-- @dump($task->taskAssignments->first()->status ?? '') --}}


                                        </div>
                                        <a href="{{ route('ijro.read', $task->id) }}" class="email-list-detail">
                                            <div>
                                                <span class="from">{{ $task->short_name }}</span>
                                                <p class="msg" style="max-width:300px">{{ $task->description }}</p>
                                            </div>
                                            <ul class="list-unstyled">
                                                <b>Масул Ижрочи(лар): </b>
                                                @foreach ($task->users as $user)
                                                    <li>{{ $user->name }} ({{ $user->email }})</li>
                                                @endforeach
                                            </ul>
                                            <span class="date">
                                                <span class="icon"><i data-feather="paperclip"></i> </span>
                                                {{ $task->end_date->format('d M') }}
                                            </span>
                                        </a>
                                    </div>
                                @endforeach
                            </div>

                            <!-- Pagination -->
                            <div class="pagination-wrapper">
                                {{ $tasks->appends(request()->query())->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
