@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="row inbox-wrapper">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <!-- Main Content Section -->
                        <div class="col-lg-6 email-aside border-lg-right">
                            <div class="email-head">
                                <div class="email-head-title d-flex align-items-center">
                                    <span data-feather="edit" class="icon-md mr-2"></span>
                                    Редактировать Поручение
                                </div>
                            </div>

                            <form id="taskEditForm" action="{{ route('taskUpdate', $task->id) }}" method="post" enctype="multipart/form-data">
                                @csrf
                                @method('POST') <!-- Use PUT for update -->

                                <input type="hidden" name="user_id" value="{{ old('user_id', $task->user_id) }}">

                                <div class="email-compose-fields">
                                    <div class="row">
                                        <!-- Document Selector -->
                                        <div class="col-md-12 mb-3">
                                            <label>Хужжат номи:</label>
                                            <select name="document_id" class="js-example-basic-single w-100" required>
                                                <option value="">-- Ҳужжат Йўқ --</option>
                                                @foreach ($documents as $doc)
                                                    <option value="{{ $doc->id }}" {{ old('document_id', $task->document_id) == $doc->id ? 'selected' : '' }}>
                                                        {{ $doc->title }} ({{ $doc->category ? $doc->category->name : 'Категория Йўқ' }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>


                                 
                               
                                        <div class="col-md-12 mb-3">
                                            <label>Хужжат тури</label>
                                            <select name="category_id" class="js-example-basic-single w-100" required>
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}" {{ old('category_id', $task->category_id) == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>


                                        <!-- Assign Users -->
                                        <div class="col-md-12 mb-3">
                                            <label>Фойдаланувчиларга</label>
                                            <select name="users[]" class="form-control select2" multiple="multiple" required>
                                                @foreach ($users as $user)
                                                    <option value="{{ $user->id }}" {{ in_array($user->id, old('users', $task->task_users->pluck('id')->toArray())) ? 'selected' : '' }}>
                                                        {{ $user->name }} ({{ $user->email }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Issue Date -->
                                        <div class="col-md-6 mb-3">
                                            <label>Берилган санаси</label>
                                            <input type="datetime-local" name="issue_date" class="form-control" value="{{ old('issue_date', $task->issue_date) }}" required>
                                        </div>

                                        <!-- Completion Date -->
                                        <div class="col-md-6 mb-3">
                                            <label>Бажариш муддати</label>
                                            <input type="datetime-local" name="planned_completion_date" class="form-control" value="{{ old('planned_completion_date', $task->planned_completion_date) }}" required>
                                        </div>

                                        <!-- File Upload -->
                                        <div class="col-md-12 mb-3">
                                            <label>Файллар (ихтиёрий)</label>
                                            <input type="file" name="attached_file[]" class="form-control" multiple>
                                        </div>

                                        @if ($task->files && $task->files->count() > 0)
                                            <div class="col-md-12 mb-3">
                                                <h5>Бириктирилган файллар</h5>
                                                <ul class="list-group">
                                                    @foreach ($task->files as $file)
                                                        @php
                                                            $filePath = public_path('porucheniya/' . $file->file_name);
                                                        @endphp

                                                        @if (file_exists($filePath))
                                                            <li class="list-group-item">
                                                                <a href="{{ asset('porucheniya/' . $file->file_name) }}" target="_blank">{{ $file->name }}</a>
                                                            </li>
                                                        @endif
                                                    @endforeach
                                                </ul>
                                            </div>
                                        @endif

                                               <!-- Qisqa nom -->
                                        <div class="col-md-12 mb-3">
                                            <label>Қисқа ном</label>
                                            <input name="short_name" class="form-control" value="{{ old('short_name', $task->short_name) }}">
                                        </div>

                                        <!-- Notes -->
                                        <div class="col-md-12 mb-3">
                                            <label>Эслатма (Ихтиёрий)</label>
                                            <textarea name="note" rows="3" class="form-control">{{ old('note', $task->note) }}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <!-- Form Actions -->
                                <div class="email action-send">
                                    <button type="submit" class="btn btn-primary btn-space"><i class="icon s7-mail"></i> Янгилаш</button>
                                    <a href="{{ route('monitoringIndex') }}" class="btn btn-secondary btn-space"><i class="icon s7-close"></i> Бекор қилиш</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
