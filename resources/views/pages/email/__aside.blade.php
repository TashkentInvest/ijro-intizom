<div class="aside-content">
    <div class="aside-header">
        <button class="navbar-toggle" data-target=".aside-nav" data-toggle="collapse" type="button">
            <span class="icon"><i data-feather="chevron-down"></i></span>
        </button>
        <span class="title text-muted font-weight-bold">Почта хизмати</span>
        <p class="text-muted">{{ auth()->user()->email }}</p>
    </div>
    <div class="aside-compose">
        <a class="btn btn-primary btn-block" href="{{ route('ijro.compose') }}">Топшириқ яратиш</a>
    </div>
    <div class="aside-nav collapse">
        <ul class="nav">
            <li>
                <a href="{{ route('ijro.index', ['status' => 'all']) }}">
                    <span class="icon"><i data-feather="inbox"></i></span>Барча топшириқлар
                    <span class="badge badge-danger-muted text-white font-weight-bold float-right">2</span>
                </a>
            </li>
            <li class="active">
                <a href="{{ route('ijro.index', ['status' => 'in_progress']) }}">
                    <span class="icon"><i data-feather="clock"></i></span>Бажарилмоқда
                </a>
            </li>
            <li>
                <a href="{{ route('ijro.index', ['status' => 'completed']) }}">
                    <span class="icon"><i data-feather="check"></i></span>Бажарилган
                </a>
            </li>
            <li>
                <a href="{{ route('ijro.index', ['status' => 'rejected']) }}">
                    <span class="icon"><i data-feather="alert-circle"></i></span>Бажарилмаган
                </a>
            </li>
            <li>
                <a href="{{ route('ijro.index', ['status' => 'delayed']) }}">
                    <span class="icon"><i data-feather="alert-triangle"></i></span>Муддатидан кеч бажарилган
                </a>
            </li>
        </ul>
    </div>
</div>
