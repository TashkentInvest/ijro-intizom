<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вазифалар тахтаси</title>
    <link href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        /* General Styling */


        .view-switcher {
            margin: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .view-switcher button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            font-weight: bold;
        }

        .view-switcher button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .kanban-board,
        .task-table {
            display: none;
            flex-wrap: wrap;
            gap: 15px;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            margin-bottom: 20px;
        }

        .active-view {
            display: flex;
        }

        /* Task Card Styling */
        .kanban-card {
            flex: 1 1 calc(33.333% - 10px);
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-left: 5px solid #007bff;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 15px;
        }

        .kanban-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .kanban-card-header {
            padding: 12px;
            background-color: #f8f9fa;
            font-weight: bold;
            font-size: 14px;
            color: #333;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .kanban-card-body {
            padding: 12px;
            flex: 1;
            color: #333;
        }

        .kanban-card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 12px;
            background-color: #f4f5f7;
            border-top: 1px solid #ddd;
        }

        .badge {
            display: inline-block;
            font-size: 12px;
            padding: 5px 10px;
            border-radius: 5px;
            color: #fff;
            margin-top: 5px;
            font-weight: bold;
        }

        .badge-primary {
            background-color: #007bff;
        }

        .badge-success {
            background-color: #28a745;
        }

        .badge-warning {
            background-color: #ffc107;
            color: #000;
        }

        .badge-danger {
            background-color: #dc3545;
        }

        .btn {
            font-size: 12px;
            padding: 6px 12px;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.3s;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #b21f2d;
            transform: translateY(-2px);
        }

        /* Background for Тугаш санаси */
        .date-background {
            background-color: #f0f0f0;
            padding: 5px;
            border-radius: 4px;
            font-weight: bold;
        }

        .date-danger {
            background-color: #ffe6e6;
        }

        .date-warning {
            background-color: #fff3cd;
        }

        .date-default {
            background-color: #e2e3e5;
        }

        .date-success {
            background-color: #d4edda;
        }

        /* Table Styling */
        .task-table-container {
            width: 100%;
            overflow-x: auto;
        }

        .task-table table {
            width: 100%;
            border-spacing: 0;
            border-collapse: collapse;
        }

        .task-table th,
        .task-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .task-table th {
            background-color: #f4f5f7;
            font-weight: bold;
        }

        .task-table td {
            background-color: #fff;
        }

        /* Responsive Adjustments */
        @media screen and (max-width: 1024px) {
            .kanban-card {
                flex: 1 1 calc(50% - 10px);
            }
        }

        @media screen and (max-width: 768px) {
            .kanban-card {
                flex: 1 1 100%;
            }

            .kanban-card-body {
                padding: 8px;
            }

            .kanban-card-header,
            .kanban-card-footer {
                padding: 8px;
            }

            .badge,
            .btn {
                font-size: 10px;
                padding: 4px 8px;
            }

            .view-switcher button {
                padding: 8px 16px;
                font-size: 14px;
            }
        }
    </style>
</head>

<body>

    <div class="view-switcher">
        <button onclick="switchView('kanban')">Канбан кўриниши</button>
        <button onclick="switchView('table')">Жадвал кўриниши</button>
    </div>

    <div class="kanban-board active-view" id="kanban-view">
        @foreach ($tasks as $item)
            <div class="kanban-card">
                <div class="kanban-card-header">
                    @if (auth()->user()->email == 'baxrom.shakirov@toshkentinevst.uz' ||
                            auth()->user()->roles->first()->name == 'Super Admin')
                        <form id="adminConfirmForm" action="{{ route('tasks.admin_confirm', $item->id) }}"
                            method="POST">
                            @csrf
                            @method('POST')
                            @if ($item->status->id == 10)
                                <button class="btn btn-sm btn-success" type="button" disabled>
                                    <i class="fas fa-check-double"></i> Тасдиқланди
                                </button>
                            @else
                                <button class="btn btn-sm btn-success" id="btn_approve" type="submit">
                                    <i class="fas fa-check"></i> Тасдиқлаш
                                </button>
                            @endif
                        </form>
                    @endif
                </div>
                <div class="kanban-card-body">
                    <p class="mb-2"><strong>Қисқа ном:</strong> {{ $item->short_name ?? 'Не указана' }}</p>
                    <p>
                        <b>Маъсуллар:</b>
                        @if ($item->task_users->isNotEmpty())
                            <ul>
                                @foreach ($item->task_users as $i)
                                    <li><b>{{ $i->name ?? '' }}</b></li>
                                @endforeach
                            </ul>
                        @endif
                    </p>

                    @php
                        $plannedDate = $item->planned_completion_date;
                        $currentDate = \Carbon\Carbon::now();
                        $colorClass = 'date-default';

                        if ($plannedDate) {
                            $daysDifference = $plannedDate->diffInDays($currentDate, false);
                            if ($item->status->name == 'Completed') {
                                $colorClass = 'date-success';
                            } elseif ($currentDate->gt($plannedDate)) {
                                $colorClass = 'date-danger';
                            } elseif ($daysDifference <= 2 && $daysDifference >= 0) {
                                $colorClass = 'date-warning';
                            } else {
                                $colorClass = 'date-default';
                            }
                        }
                    @endphp

                    <p><strong>Тугаш санаси:</strong>
                        <span class="date-background {{ $colorClass }}">
                            {{ $plannedDate ? $plannedDate->format('d.m.Y H:i:s') : 'Не указана' }}
                        </span>
                    </p>
                    <p>
                        <strong>Топшириқ ҳолати:</strong>
                        <span
                            class="badge 
                            @if ($item->status->name == 'Active') badge-success
                            @elseif($item->status->name == 'Canceled') badge-danger
                            @elseif($item->status->name == 'Accepted') badge-primary
                            @elseif($item->status->name == 'Completed') badge-success
                            @elseif($item->status->name == 'Deleted') badge-dark
                            @elseif($item->status->name == 'ORDER_ACTIVE') badge-info
                            @elseif($item->status->name == 'TIME_IS_OVER') badge-warning
                            @elseif($item->status->name == 'ADMIN_REJECT') badge-warning
                            @elseif($item->status->name == 'XODIM_REJECT') badge-warning
                            @else badge-dark @endif">
                            {{ $item->status->name }}
                        </span>
                    </p>
                    <p><strong>Изоҳ:</strong> {{ $item->note }}</p>
                </div>
                <div class="kanban-card-footer">
                    <a href="{{ route('taskShow', $item->id) }}" class="btn btn-primary">
                        <i class="bx bx-show"></i>
                    </a>
                    <a href="{{ route('monitoringFishka', $item->id) }}" class="btn btn-primary">
                        <i class="bx bx-coin"></i>
                    </a>
                    @if (auth()->user()->roles->first()->name == 'Super Admin')
                        <a href="{{ route('taskEdit', $item->id) }}" class="btn btn-primary">
                            <i class="bx bx-edit"></i>
                        </a>
                        <form action="{{ route('taskDestroy', $item->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">
                                <i class="bx bx-trash"></i>
                            </button>
                        </form>
                    @endif
                </div>
            </div>
        @endforeach
    </div>

    <div class="task-table active-view" id="table-view">
        <div class="task-table-container">
            <table>
                <thead>
                    <tr>
                        <th>Қисқа ном</th>
                        <th>Маъсуллар</th>
                        <th>Тугаш санаси</th>
                        <th>Топшириқ ҳолати</th>
                        <th>Изоҳ</th>
                        <th>Амаллар</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($tasks as $item)
                        <tr>
                            <td>{{ $item->short_name ?? 'Не указана' }}</td>
                            <td>
                                @if ($item->task_users->isNotEmpty())
                                    <ul>
                                        @foreach ($item->task_users as $i)
                                            <li><b>{{ $i->name ?? '' }}</b></li>
                                        @endforeach
                                    </ul>
                                @endif
                            </td>
                            <td>
                                @php
                                    $plannedDate = $item->planned_completion_date;
                                    $currentDate = \Carbon\Carbon::now();
                                    $colorClass = 'date-default';

                                    if ($plannedDate) {
                                        $daysDifference = $plannedDate->diffInDays($currentDate, false);
                                        if ($item->status->name == 'Completed') {
                                            $colorClass = 'date-success';
                                        } elseif ($currentDate->gt($plannedDate)) {
                                            $colorClass = 'date-danger';
                                        } elseif ($daysDifference <= 2 && $daysDifference >= 0) {
                                            $colorClass = 'date-warning';
                                        } else {
                                            $colorClass = 'date-default';
                                        }
                                    }
                                @endphp

                                <span class="date-background {{ $colorClass }}">
                                    {{ $plannedDate ? $plannedDate->format('d.m.Y H:i:s') : 'Не указана' }}
                                </span>
                            </td>
                            <td>
                                <span
                                    class="badge 
                                    @if ($item->status->name == 'Active') badge-success
                                    @elseif($item->status->name == 'Canceled') badge-danger
                                    @elseif($item->status->name == 'Accepted') badge-primary
                                    @elseif($item->status->name == 'Completed') badge-success
                                    @elseif($item->status->name == 'Deleted') badge-dark
                                    @elseif($item->status->name == 'ORDER_ACTIVE') badge-info
                                    @elseif($item->status->name == 'TIME_IS_OVER') badge-warning
                                    @elseif($item->status->name == 'ADMIN_REJECT') badge-warning
                                    @elseif($item->status->name == 'XODIM_REJECT') badge-warning
                                    @else badge-dark @endif">
                                    {{ $item->status->name }}
                                </span>
                            </td>
                            <td>{{ $item->note }}</td>
                            <td>
                                <a href="{{ route('taskShow', $item->id) }}" class="btn btn-primary">
                                    <i class="bx bx-show"></i>
                                </a>
                                <a href="{{ route('monitoringFishka', $item->id) }}" class="btn btn-primary">
                                    <i class="bx bx-coin"></i>
                                </a>
                                @if (auth()->user()->roles->first()->name == 'Super Admin')
                                    <a href="{{ route('taskEdit', $item->id) }}" class="btn btn-primary">
                                        <i class="bx bx-edit"></i>
                                    </a>
                                    <form action="{{ route('taskDestroy', $item->id) }}" method="POST"
                                        style="display:inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger">
                                            <i class="bx bx-trash"></i>
                                        </button>
                                    </form>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function switchView(view) {
            document.getElementById('kanban-view').classList.remove('active-view');
            document.getElementById('table-view').classList.remove('active-view');

            if (view === 'kanban') {
                document.getElementById('kanban-view').classList.add('active-view');
            } else if (view === 'table') {
                document.getElementById('table-view').classList.add('active-view');
            }
        }

        // Set the default view to Kanban
        switchView('kanban');
    </script>

</body>

</html>
