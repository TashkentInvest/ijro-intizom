@extends('layouts.admin')

@section('styles')
    <style>
        .btn {
            display: inline-block;
            padding: 5px 10px;
            text-decoration: none;
            font-size: 14px;
            color: #fff;
            border-radius: 4px;
            text-align: center;
            cursor: pointer;
        }

        .btn-sm {
            padding: 3px 8px;
            font-size: 12px;
        }

        .btn-info {
            background-color: #17a2b8;
            border: 1px solid #17a2b8;
        }

        .btn-warning {
            background-color: #ffc107;
            border: 1px solid #ffc107;
            color: #212529;
        }

        .btn-danger {
            background-color: #dc3545;
            border: 1px solid #dc3545;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
@endsection
@section('content')
    <h1 class="mb-4 text-center text-primary">Ҳужжатлар Рўйхати</h1>

    <div class="d-flex justify-content-between mb-3">
        <a href="{{ route('documents.create') }}" class="btn btn-success">
            <i class="fas fa-plus-circle"></i> Янги Ҳужжат Яратиш
        </a>
        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
    </div>

    <!-- Filter Section -->
    <form method="GET" action="{{ route('documents.index') }}" class="mb-3">
        <div class="input-group">
            <select name="status_type" class="form-select">
                <option value="">Ҳужжат Турини Танланг</option>
                <option value="kiruvchi" {{ request('status_type') == 'kiruvchi' ? 'selected' : '' }}>Кирувчи</option>
                <option value="chiquvchi" {{ request('status_type') == 'chiquvchi' ? 'selected' : '' }}>Чиқувчи</option>
            </select>
            <button type="submit" class="btn btn-primary">Филтрлаш</button>
        </div>
    </form>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ҳужжат Тури</th>
                            <th>Асосий Категория</th>
                            <th>Қўшимча Категория</th>
                            <th>Вазирлик</th>
                            <th>Хат №</th>
                            <th>Қабул Қилинган Санаси</th>
                            <th>Сарлавха</th>
                            <th>Амалиётлар</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($documents as $document)
                            <tr>
                                <td>{{ $document->id }}</td>
                                <td>{{ $document->status_type }}</td>
                                <td>
                                    {{ $document->category ? $document->category->parent->name ?? $document->category->name : 'Йўқ' }}
                                </td>
                                <td>
                                    {{ $document->category && $document->category->parent ? $document->category->name : 'Йўқ' }}
                                </td>
                                <td>
                                    {{ $document->ministry ? $document->ministry->name : 'Йўқ' }}
                                </td>
                                <td>{{ $document->letter_number }}</td>
                                <td>{{ $document->received_date->format('d.m.Y | H:i') }}</td>
                                <td class="truncate-text">{{ $document->title }}</td>
                                <style>
                                    .truncate-text {
                                        max-width: 150px;
                                        /* Set the max width */
                                        white-space: nowrap;
                                        /* Prevent text from wrapping */
                                        overflow: hidden;
                                        /* Hide text that overflows */
                                        text-overflow: ellipsis;
                                        /* Display ellipsis (...) when text overflows */
                                    }
                                </style>

                                <td class="actions">
                                    <a href="{{ route('documents.show', $document->id) }}"
                                        class="btn btn-sm btn-info">Кўрсатиш</a>
                                    <a href="{{ route('documents.edit', $document->id) }}"
                                        class="btn btn-sm btn-warning">Таҳрир Қилиш</a>
                                    <form action="{{ route('documents.destroy', $document->id) }}" method="POST"
                                        style="display:inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-sm btn-danger"
                                            onclick="return confirm('Ҳужжатни ўчиришга ишонч ҳосил қилдингизми?')">Ўчириш</button>
                                    </form>
                                </td>

                            </tr>
                        @empty
                            <tr>
                                <td colspan="9" class="text-center">Ҳужжатлар топилмади.</td>
                            </tr>
                        @endforelse
                    </tbody>

                </table>
            </div>
        </div>
    </div>
@endsection
