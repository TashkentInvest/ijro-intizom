@extends('layouts.admin')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="row inbox-wrapper">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <!-- Sidebar Section -->
                     
                        <!-- Main Content Section -->
                        <div class="col-lg-6 email-aside border-lg-right ">
                            <div class="email-head">
                                <div class="email-head-title d-flex align-items-center">
                                    <span data-feather="edit" class="icon-md mr-2"></span>
                                    Создать Новое Поручение
                                </div>
                            </div>

                            <form id="taskForm" action="{{ route('taskCreate') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="email-compose-fields">
                                    <div class="row">
                                        <!-- Document Selector -->
                                   
                                        
                                        <div class="col-md-12 mb-3">
                                            <label>Хужжат номи</label>
                                            <select name="document_id" class="js-example-basic-single w-100" required>
                                                @foreach ($documents as $doc)
                                                <option value="{{ $doc->id }}" @if(old('document_id') == $doc->id) selected @endif>
                                                    {{ $doc->title }} ({{ $doc->category ? $doc->category->name : 'Категория йўқ' }})
                                                </option>
                                            @endforeach
                                            </select>
                                        </div>

                                      

                                        <div class="col-md-12 mb-3">
                                            <label>Хужжат тури</label>
                                            <select name="category_id" class="js-example-basic-single w-100" required>
                                                @foreach ($categories as $category)
                                                <option value="{{ $category->id }}" @if(old('category_id') == $category->id) selected @endif>
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
                                                    <option value="{{ $user->id }}">
                                                        {{ $user->name }} ({{ $user->email }})
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Issue Date -->
                                        <div class="col-md-6 mb-3">
                                            <label>Берилган санаси</label>
                                            <input type="datetime-local" name="issue_date" class="form-control" value="{{ old('issue_date') }}" required>
                                        </div>

                                        <!-- Completion Date -->
                                        <div class="col-md-6 mb-3">
                                            <label>Бажариш муддати</label>
                                            <input type="datetime-local" name="planned_completion_date" class="form-control" value="{{ old('planned_completion_date') }}" required>
                                        </div>

                                        <!-- File Upload -->
                                        <div class="col-md-12 mb-3">
                                            <label>Файллар (ихтиёрий)</label>
                                            <input type="file" name="attached_file[]" class="form-control" multiple>
                                        </div>

                                        
                                        <!-- Qisqa nom -->
                                        <div class="col-md-12 mb-3">
                                            <label>Қисқа ном</label>
                                            <input name="short_name" class="form-control" value="{{ old('short_name') }}">
                                        </div>

                                        <!-- Notes -->
                                        <div class="col-md-12 mb-3">
                                            <label>Эслатма (Ихтиёрий)</label>
                                            <textarea name="note" rows="3" class="form-control">{{ old('note') }}</textarea>
                                        </div>
                                    </div>
                                </div>

                                <!-- Form Actions -->
                                <div class="email action-send">
                                    <button type="submit" class="btn btn-primary btn-space"><i class="icon s7-mail"></i> Сақлаш</button>
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
