@extends('layouts.admin')

@section('styles')
    <style>
        .custom-nav {
            display: flex;
            flex-wrap: wrap;
            list-style: none;
            padding: 0;
            margin: 0;
            border-bottom: 2px solid #ccc;
        }

        .nav-item {
            margin-right: 20px;
        }

        .tab-link {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            text-decoration: none;
            color: #6c757d;
            font-size: 16px;
            border: 1px solid transparent;
            border-radius: 4px 4px 0 0;
            background-color: #f8f9fa;
            transition: background-color 0.3s ease, color 0.3s ease;
            white-space: nowrap; /* Prevent text wrapping */
        }

        /* Tab link hover effect */
        .tab-link:hover {
            background-color: #007bff;
            color: #fff;
        }

        /* Active tab style */
        .tab-link.active {
            background-color: #007bff;
            color: #fff;
            border-color: #007bff;
        }

        /* Badge style */
        .badge {
            font-size: 0.8em;
            border-radius: 10px;
            font-weight: 500;
            margin-left: 10px;
        }

        /* Custom icon style */
        .tab-link i {
            margin-right: 5px;
        }

        /* Tab content area - ensure the tab content doesn't overlap */
        .tab-content {
            padding: 20px;
            border-top: 2px solid #ccc;
        }

        /* Hide inactive tab content */
        .tab-pane {
            display: none;
        }

        /* Display active tab content */
        .tab-pane.show {
            display: block;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .nav-item {
                margin-right: 10px;
                flex: 1 1 auto;
            }

            .tab-link {
                font-size: 14px;
                padding: 8px 12px;
            }

            .tab-content {
                padding: 10px;
            }
        }
    </style>
@endsection

@section('content')
    <div class="row mb-4">
        <div class="col-lg-12 col-12">
            <div class="card shadow-sm border-0 rounded">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="text-black text-5">Қолган топшириқлар</h3>
                    <div>
                        <!-- Filter Button -->
                        <button type="button" class="btn btn-primary me-2" id="filterBtn">
                            <i class="fas fa-filter"></i> Фильтр
                        </button>
                        @can('left-request.add')
                            <a href="{{ route('taskAdd') }}" class="btn btn-success">
                                <span class="fas fa-plus-circle"></span> Қўшиш
                            </a>
                        @endcan
                    </div>
                </div>

                <!-- Filter Modal Start -->
                <div class="modal" id="filterModal">
                    <div class="modal-dialog modal-lg">
                        <form method="GET" action="{{ route('monitoringIndex') }}">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Фильтр</h5>
                                    <button type="button" class="btn-close" id="closeModal" aria-label="Закрыть"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <!-- Role Filter -->
                                        <div class="col-md-6">
                                            <label for="role" class="form-label">Роль</label>
                                            <select name="role" id="role" class="form-select">
                                                <option value="">Ҳаммаси</option>
                                                @foreach ($roles as $role)
                                                    <option value="{{ $role->id }}"
                                                        {{ request('role') == $role->id ? 'selected' : '' }}>
                                                        {{ $role->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <!-- User Filter -->
                                        <div class="col-md-6">
                                            <label for="user" class="form-label">Фойдаланувчи</label>
                                            <select name="user" id="user" class="form-select">
                                                <option value="">Ҳаммаси</option>
                                                @foreach ($users as $filterUser)
                                                    <option value="{{ $filterUser->id }}"
                                                        {{ request('user') == $filterUser->id ? 'selected' : '' }}>
                                                        {{ $filterUser->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <!-- Status Filter -->
                                        <div class="col-md-6">
                                            <label for="status" class="form-label">Статус</label>
                                            <select name="status" id="status" class="form-select">
                                                <option value="">Ҳаммаси</option>
                                                @foreach ($taskStatuses as $status)
                                                    <option value="{{ $status->id }}"
                                                        {{ request('status') == $status->id ? 'selected' : '' }}>
                                                        {{ $status->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <!-- Date From Filter -->
                                        <div class="col-md-3">
                                            <label for="date_from" class="form-label">Санасидан:</label>
                                            <input type="date" name="date_from" id="date_from" class="form-control"
                                                value="{{ request('date_from') }}">
                                        </div>
                                        <!-- Date To Filter -->
                                        <div class="col-md-3">
                                            <label for="date_to" class="form-label">Санасигача:</label>
                                            <input type="date" name="date_to" id="date_to" class="form-control"
                                                value="{{ request('date_to') }}">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <!-- Search Filter -->
                                        <div class="col-md-12">
                                            <label for="search" class="form-label">Қидириш</label>
                                            <input type="text" name="search" id="search" class="form-control"
                                                value="{{ request('search') }}" placeholder="Қидириш...">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Фильтрларни қўллаш</button>
                                    <a href="{{ route('monitoringIndex') }}" class="btn btn-secondary">Олиб ташлаш</a>
                                    <button type="button" class="btn btn-light" id="closeModalBtn">Ёпиш</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Filter Modal End -->

                <div class="common-space project-tabs">
                    <ul class="custom-nav" id="top-tab" role="tablist">
                        <!-- All Tasks Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="tab-link active" href="#top-home" data-tab-target="top-home" role="tab">
                                <i class="fa-solid fa-bullseye"></i> Ҳаммаси
                                <span class="badge bg-primary text-white ms-2">{{ $allTasks->count() ?? '' }}</span>
                            </a>
                        </li>
                        <!-- New Tasks Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="tab-link" href="#top-progress" data-tab-target="top-progress" role="tab">
                                <i class="fa-solid fa-bars-progress"></i> Янгилари
                                <span
                                    class="badge bg-secondary text-white ms-2">{{ $inProgressTasks->count() ?? '' }}</span>
                            </a>
                        </li>
                        <!-- Pending Tasks Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="tab-link" href="#top-pending" data-tab-target="top-pending" role="tab">
                                <i class="fa-regular fa-hourglass-half"></i> Жараён
                                <span class="badge bg-warning text-dark ms-2">{{ $pendingTasks->count() ?? '' }}</span>
                            </a>
                        </li>
                        <!-- Completed Tasks Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="tab-link" href="#top-completed" data-tab-target="top-completed" role="tab">
                                <i class="fa-solid fa-circle-check"></i> Бажарилган
                                <span class="badge bg-success text-white ms-2">{{ $completedTasks->count() ?? '' }}</span>
                            </a>
                        </li>
                        <!-- Rejected Tasks Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="tab-link" href="#top-employeeRejectedTasks"
                                data-tab-target="top-employeeRejectedTasks" role="tab">
                                <i class="fa-solid fa-circle-xmark"></i> Тугалланмаган
                                <span
                                    class="badge bg-danger text-white ms-2">{{ $employeeRejectedTasks->count() ?? '' }}</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="tab-content" id="top-tabContent">
                    <!-- All Tasks Content -->
                    <div class="tab-pane fade show active" id="top-home" role="tabpanel"
                        aria-labelledby="top-home-tab">
                        @include('pages.monitoring.partials.task-table', ['tasks' => $allTasks])
                    </div>
                    <!-- New Tasks Content -->
                    <div class="tab-pane fade" id="top-progress" role="tabpanel" aria-labelledby="progress-top-tab">
                        @include('pages.monitoring.partials.task-table', ['tasks' => $inProgressTasks])
                    </div>
                    <!-- Pending Tasks Content -->
                    <div class="tab-pane fade" id="top-pending" role="tabpanel" aria-labelledby="pending-top-tab">
                        @include('pages.monitoring.partials.task-table', ['tasks' => $pendingTasks])
                    </div>
                    <!-- Completed Tasks Content -->
                    <div class="tab-pane fade" id="top-completed" role="tabpanel" aria-labelledby="completed-top-tab">
                        @include('pages.monitoring.partials.task-table', ['tasks' => $completedTasks])
                    </div>
                    <!-- Rejected Tasks Content -->
                    <div class="tab-pane fade" id="top-employeeRejectedTasks" role="tabpanel"
                        aria-labelledby="employeeRejectedTasks-top-tab">
                        @include('pages.monitoring.partials.task-table', [
                            'tasks' => $employeeRejectedTasks,
                        ])
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        // Modal functionality (show and hide)
        const filterBtn = document.getElementById('filterBtn');
        const filterModal = document.getElementById('filterModal');
        const closeModalBtn = document.getElementById('closeModal');
        const closeModal = document.getElementById('closeModalBtn');

        filterBtn.addEventListener('click', function() {
            filterModal.style.display = 'block';
        });

        closeModalBtn.addEventListener('click', function() {
            filterModal.style.display = 'none';
        });

        closeModal.addEventListener('click', function() {
            filterModal.style.display = 'none';
        });

        // Custom Tab functionality
        const tabLinks = document.querySelectorAll('.tab-link');
        const tabPanes = document.querySelectorAll('.tab-pane');

        tabLinks.forEach(tab => {
            tab.addEventListener('click', function(e) {
                e.preventDefault();

                // Remove active class from all tabs and hide all tab panes
                tabLinks.forEach(link => link.classList.remove('active'));
                tabPanes.forEach(pane => pane.classList.remove('show', 'active'));

                // Add active class to the clicked tab and corresponding content
                tab.classList.add('active');
                const targetContent = document.querySelector(`#${tab.getAttribute('data-tab-target')}`);
                targetContent.classList.add('show', 'active');
            });
        });
    </script>
@endsection