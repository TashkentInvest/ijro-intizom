<div class="aside-content">
    <div class="aside-header">
        <button class="navbar-toggle" data-target=".aside-nav" data-toggle="collapse" type="button">
            <span class="icon"><i data-feather="chevron-down"></i></span>
        </button>
        <span class="title text-muted font-weight-bold">Топшириқлар</span>
        <p class="text-muted">{{ auth()->user()->email }}</p>
    </div>
    @if(@auth()->user()->roles->first()->name == 'Super Admin')
    <div class="aside-compose">
        <a class="btn btn-primary btn-block" href="{{ route('ijro.compose') }}">Топшириқ яратиш</a>
    </div>
    @endif
    <div class="aside-nav collapse">
        <ul class="nav">
            <li class="{{ request('status') == 'all' ? 'active' : '' }}">
                <a href="{{ route('ijro.index', ['status' => 'all']) }}">
                    <span class="icon"><i data-feather="inbox"></i></span>Барча топшириқлар
                    {{-- <span class="badge badge-danger-muted text-white font-weight-bold float-right">{{ $statusCounts['all'] }}</span> --}}
                </a>
            </li>
            <li class="{{ request('status') == 'in_progress' ? 'active' : '' }}">
                <a href="{{ route('ijro.index', ['status' => 'in_progress']) }}">
                    <span class="icon"><i data-feather="clock"></i></span>Бажарилмоқда
                    {{-- <span class="badge badge-danger-muted text-white font-weight-bold float-right">{{ $statusCounts['in_progress'] }}</span> --}}
                </a>
            </li>

            <li class="{{ request('status') == 'pending' ? 'active' : '' }}">
                <a href="{{ route('ijro.index', ['status' => 'pending']) }}">
                    <span class="icon"><i data-feather="clock"></i></span>Корилмаганлар
                    {{-- <span class="badge badge-danger-muted text-white font-weight-bold float-right">{{ $statusCounts['in_progress'] }}</span> --}}
                </a>
            </li>
            {{-- @dump($statusCounts) --}}
            <li class="{{ request('status') == 'completed' ? 'active' : '' }}">
                <a href="{{ route('ijro.index', ['status' => 'completed']) }}">
                    <span class="icon"><i data-feather="check"></i></span>Бажарилган
                    {{-- <span class="badge badge-danger-muted text-white font-weight-bold float-right">{{ $statusCounts['completed'] }}</span> --}}
                </a>
            </li>
            <li class="{{ request('status') == 'rejected' ? 'active' : '' }}">
                <a href="{{ route('ijro.index', ['status' => 'rejected']) }}">
                    <span class="icon"><i data-feather="alert-circle"></i></span>Бажарилмаган
                    {{-- <span class="badge badge-danger-muted text-white font-weight-bold float-right">{{ $statusCounts['rejected'] }}</span> --}}
                </a>
            </li>
            <li class="{{ request('status') == 'delayed' ? 'active' : '' }}">
                <a href="{{ route('ijro.index', ['status' => 'delayed']) }}">
                    <span class="icon"><i data-feather="alert-triangle"></i></span>Муддатидан кеч бажарилган
                    {{-- <span class="badge badge-danger-muted text-white font-weight-bold float-right">{{ $statusCounts['delayed'] }}</span> --}}
                </a>
            </li>
        </ul>
    </div>

    
</div>
