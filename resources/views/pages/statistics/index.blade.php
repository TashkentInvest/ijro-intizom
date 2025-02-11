@extends('layouts.admin')

@section('content')
    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0">Тахлил панелига хуш келибсиз</h4>
        </div>
        <div class="d-flex align-items-center flex-wrap text-nowrap">
            <div class="input-group date datepicker dashboard-date mr-2 mb-2 mb-md-0 d-md-none d-xl-flex" id="dashboardDate">
                <span class="input-group-addon bg-transparent"><i data-feather="calendar" class=" text-primary"></i></span>
                <input type="text" class="form-control">
            </div>
            <button type="button" class="btn btn-outline-info btn-icon-text mr-2 d-none d-md-block">
                <i class="btn-icon-prepend" data-feather="download"></i>
                Импорт қилиш
            </button>
            <button type="button" class="btn btn-outline-primary btn-icon-text mr-2 mb-2 mb-md-0">
                <i class="btn-icon-prepend" data-feather="printer"></i>
                Чоп этиш
            </button>
            <button type="button" class="btn btn-primary btn-icon-text mb-2 mb-md-0">
                <i class="btn-icon-prepend" data-feather="download-cloud"></i>
                Ҳисоботни юклаб олиш
            </button>
        </div>
    </div>

    <div class="row">
        @foreach (['all' => 'Барча топшириқлар', 'in_progress' => 'Ижрода', 'pending' => 'Кўрилмаганлар', 'completed' => 'Якунланган', 'rejected' => 'Муддати ўтган', 'delayed' => 'Муддати ўтиб якунланган'] as $status => $label)
            <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <a href="{{ route('ijro.index', ['status' => $status]) }}" class="text-decoration-none">
                            <div class="d-flex justify-content-between align-items-baseline">
                                <h6 class="card-title mb-0">{{ $label }}</h6>
                                <div class="dropdown mb-2">
                                    <button class="btn p-0" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <i class="icon-lg text-muted pb-3px" data-feather="more-horizontal"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item d-flex align-items-center" href="#"><i
                                                data-feather="eye" class="icon-sm mr-2"></i> <span>Кўриш</span></a>
                                        <a class="dropdown-item d-flex align-items-center" href="#"><i
                                                data-feather="edit-2" class="icon-sm mr-2"></i> <span>Таҳрирлаш</span></a>
                                        <a class="dropdown-item d-flex align-items-center" href="#"><i
                                                data-feather="trash" class="icon-sm mr-2"></i> <span>Ўчириш</span></a>
                                        <a class="dropdown-item d-flex align-items-center" href="#"><i
                                                data-feather="printer" class="icon-sm mr-2"></i> <span>Чоп этиш</span></a>
                                        <a class="dropdown-item d-flex align-items-center" href="#"><i
                                                data-feather="download" class="icon-sm mr-2"></i> <span>Юклаб
                                                олиш</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6 col-md-12 col-xl-5">
                                    <h3 class="mb-2">{{ $statusCounts[$status] ?? '' }}</h3>
                                    <div class="d-flex align-items-baseline">
                                        <p class="text-success">
                                            <span>+{{ $percentageGrowth[$status] ?? '' }}%</span>
                                            <i data-feather="arrow-up" class="icon-sm mb-1"></i>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        @endforeach
    </div> <!-- row -->

    <div class="row mb-4">
        <div class="col-12">
            <form method="GET" action="{{ route('ijro.index') }}">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="date_from">Сана бошидан</label>
                        <input type="date" class="form-control" id="date_from" name="date_from"
                            value="{{ request('date_from') }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="date_to">Санагача</label>
                        <input type="date" class="form-control" id="date_to" name="date_to"
                            value="{{ request('date_to') }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="search">Қидириш</label>
                        <input type="text" class="form-control" id="search" name="search"
                            value="{{ request('search') }}">
                    </div>
                    <div class="form-group col-md-3 align-self-end">
                        <button type="submit" class="btn btn-primary">Филтр</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-xl-8 stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-baseline mb-2">
                        <h6 class="card-title mb-0">Топшириқлар</h6>
                        <div class="dropdown mb-2">
                            <button class="btn p-0" type="button" id="dropdownMenuButton7" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="icon-lg text-muted pb-3px" data-feather="more-horizontal"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton7">
                                <a class="dropdown-item d-flex align-items-center" href="#"><i data-feather="eye"
                                        class="icon-sm mr-2"></i> <span>Кўриш</span></a>
                                <a class="dropdown-item d-flex align-items-center" href="#"><i
                                        data-feather="edit-2" class="icon-sm mr-2"></i> <span>Таҳрирлаш</span></a>
                                <a class="dropdown-item d-flex align-items-center" href="#"><i data-feather="trash"
                                        class="icon-sm mr-2"></i> <span>Ўчириш</span></a>
                                <a class="dropdown-item d-flex align-items-center" href="#"><i
                                        data-feather="printer" class="icon-sm mr-2"></i> <span>Чоп этиш</span></a>
                                <a class="dropdown-item d-flex align-items-center" href="#"><i
                                        data-feather="download" class="icon-sm mr-2"></i> <span>Юклаб олиш</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead>
                                <tr>
                                    <th class="pt-0">№</th>
                                    <th class="pt-0">Топшириқ мазмуни</th>
                                    <th class="pt-0">Бошланиш санаси</th>
                                    <th class="pt-0">Тугаш санаси</th>
                                    <th class="pt-0">Ҳолат</th>
                                    <th class="pt-0">Масул Ижрочи</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($tasks ?? [] as $task)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $task->short_name }}</td>
                                        <td>{{ \Carbon\Carbon::parse($task->start_date)->format('d/m/Y') }}</td>
                                        <td>{{ \Carbon\Carbon::parse($task->end_date)->format('d/m/Y') }}</td>
<td></td>                                        {{-- <td>
                                            @if ($task->taskAssignments->first()->status == 'completed')
                                                <span class="badge badge-success">Якунланган</span>
                                            @elseif ($task->taskAssignments->first()->status == 'in_progress')
                                                <span class="badge badge-primary">Ижрода</span>
                                            @elseif ($task->taskAssignments->first()->status == 'pending')
                                                <span class="badge badge-info-muted">Кутмоқда</span>
                                            @elseif ($task->taskAssignments->first()->status == 'rejected')
                                                <span class="badge badge-danger">Рад этилган</span>
                                            @elseif ($task->taskAssignments->first()->status == 'delayed')
                                                <span class="badge badge-warning">Кечиктирилган</span>
                                            @endif
                                        </td> --}}
                                        <td>
                                            @foreach ($task->users as $user)
                                                {{ $user->name }}
                                            @endforeach
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6">Ҳозирча топшириқлар мавжуд эмас.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-3">
                        @if (isset($tasks))
                            {{ $tasks->links() }}
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
