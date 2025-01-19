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
                            <div class="email-head">
                                <div class="email-head-title d-flex align-items-center">
                                    <span data-feather="edit" class="icon-md mr-2"></span>
                                    Вазифани таҳрир қилиш
                                </div>
                            </div>
                            <form action="{{ route('ijro.update', $task->id) }}" method="post"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="email-compose-fields">
                                    <div class="row">
                                        <!-- Документ танлови -->
                                        <div class="col-md-12 col-lg-6 mb-3" id="documentField">
                                            <label>Документ номи</label>
                                            <select name="document_id" class="js-example-basic-single form-control w-100">
                                                @foreach ($documents as $doc)
                                                    <option value="{{ $doc->id }}"
                                                        @if ($task->document_id == $doc->id) selected @endif>
                                                        {{ $doc->title }}
                                                        ({{ $doc->category ? $doc->category->name : 'Категория мавжуд эмас' }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Вазифа тури -->
                                        <div class="col-md-12 col-lg-6 mb-3">
                                            <label>Вазифа тури</label>
                                            <select name="task_type" id="taskType" class="form-control" required>
                                                <option value="meeting" @if ($task->task_type == 'meeting') selected @endif>
                                                    Эслатмалар</option>
                                                <option value="hr_task" @if ($task->task_type == 'hr_task') selected @endif>
                                                    Ҳужжат алмашинуви</option>
                                                <option value="emp_task" @if ($task->task_type == 'emp_task') selected @endif>
                                                    Шахсий топшириқ</option>
                                            </select>
                                        </div>

                                        <!-- Фойдаланувчиларга топшириқни берганлик -->
                                        <div class="col-md-12 col-lg-6 mb-3">
                                            <label>Фойдаланувчиларга топшириқ бериш</label>
                                            <select name="users[]" class="form-control select2" multiple="multiple"
                                                required>
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}"
                                                        @if ($task->users && in_array($user->id, $task->users->pluck('id')->toArray())) selected @endif>
                                                        {{ $user->name }} ({{ $user->email }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-md-12 mb-3">
                                            <label>Назоратчи:</label>
                                            <select name="nazoratchi_id" class="js-example-basic-single w-100"  >
                                                <option value="">-- Йўқ --</option>
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}" {{ old('nazoratchi_id', $task->nazoratchi_id) == $user->id ? 'selected' : '' }}>
                                                        {{ $user->name }} ({{ $user->email }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Тамомланиш санаси -->
                                        <div class="col-md-6 col-lg-6 mb-3">
                                            <label>Тамомланиш санаси</label>
                                            <input type="datetime-local" name="end_date" class="form-control"
                                                value="{{ $task->end_date ? $task->end_date->format('Y-m-d\TH:i') : '' }}"
                                                required>
                                        </div>

                                        <!-- Файл юклаш -->
                                        <div class="col-md-12 col-lg-6 mb-3">
                                            <label>Файл (ихтиёрий)</label>
                                            <input type="file" name="attached_file[]" class="form-control" multiple>
                                        </div>

                                       

                                        <!-- Қисқа ном -->
                                        <div class="col-md-12 col-lg-6 mb-3">
                                            <label>Қисқа ном</label>
                                            <input name="short_name" class="form-control" value="{{ $task->short_name }}"
                                                required>
                                        </div>

                                        <!-- Изоҳ -->
                                        <div class="col-md-12 mb-3">
                                            <label>Изоҳ (ихтиёрий)</label>
                                            <textarea name="description" required rows="3" class="form-control">{{ $task->description }}</textarea>
                                        </div>

                                        @foreach ($task->files as $file)
                                        <div class="col-md-12 col-lg-4 col-xl-4 col-4">

                                            <div class="file-item">
                                                <label>
                                                    <input type="checkbox" name="delete_files[]"
                                                        value="{{ $file->id }}">
                                                    {{ $file->file_name }}
                                                </label>

                                                <a href="{{ asset('tasks/' . $task->id . '/' . $file->file_name) }}"
                                                    target="_blank">
                                                    <span data-feather="file"></span> {{ $file->file_name }}
                                                    <span
                                                        class="text-muted tx-11">({{ number_format($file->file_size / 1024, 2) }}
                                                        MB)</span>
                                                </a>
                                            </div>
                                        </div>
                                    @endforeach
                                        
                                    </div>
                                </div>

                                <!-- Формалар амаллари -->
                                <div class="email action-send">
                                    <button type="submit" class="btn btn-primary btn-space"><i class="icon s7-mail"></i>
                                        Сақлаш</button>
                                    <a href="{{ route('ijro.index') }}" class="btn btn-secondary btn-space"><i
                                            class="icon s7-close"></i>
                                        Бекор қилиш</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const taskType = document.getElementById('taskType');
            const documentField = document.getElementById('documentField');

            function toggleDocumentField() {
                if (taskType.value === 'hr_task') {
                    documentField.style.display = 'block';
                } else {
                    documentField.style.display = 'none';
                }
            }

            taskType.addEventListener('change', toggleDocumentField);
            toggleDocumentField(); // Initial check
        });
    </script>
@endsection
