@extends('layouts.admin')

@section('content')
    <div class="row inbox-wrapper">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 email-aside border-lg-right">
                            <div class="aside-content">
                                <div class="aside-header">
                                    <button class="navbar-toggle" data-target=".aside-nav" data-toggle="collapse" type="button">
                                        <span class="icon"><i data-feather="chevron-down"></i></span>
                                    </button>
                                    <span class="title text-muted font-weight-bold">Mail Service</span>
                                    <p class="text-muted">amiahburton@gmail.com</p>
                                </div>
                                <div class="aside-compose">
                                    <a class="btn btn-primary btn-block" href="../../../demo_1/pages/email/compose.html">Compose Email</a>
                                </div>
                                <div class="aside-nav collapse">
                                    <ul class="nav">
                                        <li><a href="../../../demo_1/pages/email/inbox.html"><span class="icon"><i data-feather="inbox"></i></span>Inbox<span class="badge badge-danger-muted text-white font-weight-bold float-right">2</span></a></li>
                                        <li class="active"><a href="#"><span class="icon"><i data-feather="mail"></i></span>Sent Mail</a></li>
                                        <li><a href="#"><span class="icon"><i data-feather="briefcase"></i></span>Important<span class="badge badge-info-muted text-white font-weight-bold float-right">4</span></a></li>
                                        <li><a href="#"><span class="icon"><i data-feather="file"></i></span>Drafts</a></li>
                                        <li><a href="#"><span class="icon"><i data-feather="star"></i></span>Tags</a></li>
                                        <li><a href="#"><span class="icon"><i data-feather="trash"></i></span>Trash</a></li>
                                    </ul>
                                    <span class="title">Labels</span>
                                    <ul class="nav nav-pills nav-stacked">
                                        <li><a href="#"><i data-feather="tag" class="text-warning"></i> Important </a></li>
                                        <li><a href="#"><i data-feather="tag" class="text-primary"></i> Business </a></li>
                                        <li><a href="#"><i data-feather="tag" class="text-info"></i> Inspiration </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 email-content">
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

                                               <!-- Task Type Selector -->
                                               <div class="col-md-12 mb-3">
                                                <label>Топшириқ тури</label>
                                                <select name="task_type" class="form-control" required>
                                                    <option value="meeting" @if(old('task_type') == 'meeting') selected @endif>Учрашув</option>
                                                    <option value="hr_task" @if(old('task_type') == 'hr_task') selected @endif>HR вазифаси</option>
                                                    <option value="emp_task" @if(old('task_type') == 'emp_task') selected @endif>Ходим вазифаси</option>
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

                                        <!-- Qisqa ном -->
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