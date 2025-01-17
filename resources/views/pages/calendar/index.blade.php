<!DOCTYPE html>
<html lang="uz">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Календарь</title>

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="{{ asset('edo_template/assets/vendors/core/core.css') }}">
    <link rel="stylesheet" href="{{ asset('edo_template/assets/vendors/fullcalendar/fullcalendar.min.css') }}">
    <link rel="stylesheet" href="{{ asset('edo_template/assets/css/demo_1/style.css') }}">
    <link rel="stylesheet" href="{{ asset('edo_template/assets/fonts/feather-font/css/iconfont.css') }}">
    <link rel="stylesheet" href="{{ asset('edo_template/assets/vendors/flag-icon-css/css/flag-icon.min.css') }}">
    <link rel="shortcut icon" href="{{ asset('edo_template/assets/images/favicon.png') }}" />

    <link rel="stylesheet" href="https://edo.ijro.uz/styles.04475aa9e38b0bd3.css">

    <style>
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
    </style>

    <script src="{{ asset('edo_template/assets/vendors/core/core.js') }}"></script>
    <script src="{{ asset('edo_template/assets/vendors/feather-icons/feather.min.js') }}"></script>
</head>

<body>
    <div class="main-wrapper">
        @include('layouts.edo_sidebar')
        {{-- @include('layouts.edo-setting_nav') --}}

        <div class="page-wrapper">
            <div class="page-content">
                <h4>Календарь</h4>

                <button id="clearCacheButton" class="btn btn-danger btn-sm my-2">Кэшни тозалаш</button>
                <script>
                    $(document).ready(function() {
                        // Existing fullcalendar initialization and other scripts
                        
                        // Clear Cache Button Click Handler
                        $('#clearCacheButton').on('click', function() {
                            $.ajax({
                                url: '{{ route('clearCache') }}', // The route to clear cache
                                type: 'POST',
                                data: {
                                    _token: '{{ csrf_token() }}' // Include CSRF token
                                },
                                success: function(response) {
                                    alert('Кэш муваффақиятли тозаланди!');
                                    location.reload(); // Optionally refresh the page to reload calendar data
                                },
                                error: function() {
                                    alert('Кэшни тозалашда хатолик юз берди!');
                                }
                            });
                        });
                    });
                </script>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="calendarFilter" class="mr-2">Фильтр:</label>
                        <select id="calendarFilter" class="form-control">
                            <option value="all">Барчаси</option>
                            <option value="task">Фақат топшириқлар</option>
                            <option value="manual">Фақат учрашувлар</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div id="fullcalendar"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="viewEventModal" class="modal fade">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 id="viewEventTitle" class="modal-title"></h5>
                                <button type="button" class="btn-close" data-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div id="viewEventBody" class="modal-body"></div>
                            <div class="modal-footer" id="viewEventFooter">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Ёпиш</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="createEventModal" class="modal fade">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Янги Ҳодиса Қўшиш</h5>
                                <button type="button" class="btn-close" data-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="createEventForm">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label for="eventTitle" class="form-label">Сарлавҳа</label>
                                        <input type="text" class="form-control" id="eventTitle" name="title" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="eventStart" class="form-label">Бошланиш санаси</label>
                                        <input type="datetime-local" class="form-control" id="eventStart" name="start_date" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="eventEnd" class="form-label">Тугаш санаси</label>
                                        <input type="datetime-local" class="form-control" id="eventEnd" name="end_date">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="eventDescription" class="form-label">Изоҳ</label>
                                        <textarea id="eventDescription" name="description" class="form-control" rows="3"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Бекор қилиш</button>
                                <button type="button" id="saveEvent" class="btn btn-primary">Сақлаш</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="editEventModal" class="modal fade">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Ҳодисани Таҳрирлаш</h5>
                                <button type="button" class="btn-close" data-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="editEventForm">
                                    @csrf
                                    <input type="hidden" id="editEventId" name="event_id">
                                    <div class="form-group mb-3">
                                        <label for="editEventTitle" class="form-label">Сарлавҳа</label>
                                        <input type="text" class="form-control" id="editEventTitle" name="title" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="editEventStart" class="form-label">Бошланиш санаси</label>
                                        <input type="datetime-local" class="form-control" id="editEventStart" name="start_date" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="editEventEnd" class="form-label">Тугаш санаси</label>
                                        <input type="datetime-local" class="form-control" id="editEventEnd" name="end_date">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="editEventDescription" class="form-label">Изоҳ</label>
                                        <textarea id="editEventDescription" name="description" class="form-control" rows="3"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer" id="editEventFooter">
                                <button type="button" class="btn btn-danger" id="deleteEventBtn">Ўчириш</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Бекор қилиш</button>
                                <button type="button" id="updateEventBtn" class="btn btn-primary">Сақлаш</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="{{ asset('edo_template/assets/vendors/jquery-ui/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('edo_template/assets/vendors/moment/moment.min.js') }}"></script>
    <script src="{{ asset('edo_template/assets/vendors/fullcalendar/fullcalendar.min.js') }}"></script>
    <script src="{{ asset('edo_template/assets/js/template.js') }}"></script>

    <script>
        var originalEvents = @json($calendarData);

        originalEvents.forEach(function(e) {
            if (e.type === 'manual' || e.end) {
                e.realStart = e.start;
                e.realEnd = e.end;
                e.start = e.end;
            }
        });

        $(document).ready(function() {
            $('#fullcalendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: false,
                events: originalEvents,
                displayEventTime: false,
                locale: 'uz',
                eventRender: function(event, element) {
                    const colorClass = getColorClass(event);
                    element.addClass(colorClass);
                },
                eventClick: function(event) {
                    $('#viewEventTitle').text(event.title);
                    let startTxt = event.realStart ? moment(event.realStart).format('DD/MM/YYYY HH:mm:ss') : 'Йўқ';
                    let endTxt = event.realEnd ? moment(event.realEnd).format('DD/MM/YYYY HH:mm:ss') : 'Йўқ';
                    let desc = event.description ?? event.note ?? '';

                    let emp_names = event.emp_names ? event.emp_names.join(', ') : '';
                    let emp_about = event.emp_about ? event.emp_about.join('; ') : '';

                    let htmlContent = `
                        <p> ${emp_about}</p><br/>
                        <p>${desc}</p><br/>
                        <p><strong>Бошланиши:</strong> ${startTxt}</p>
                        <p><strong>Тугаши:</strong> ${endTxt}</p> <br/>
                        <p><a href="${event.task_link ?? ''}">Кўриш</a></p>
                    `;
                    $('#viewEventBody').html(htmlContent);

                    $('#viewEventFooter').find('.manual-btns').remove();

                    if (event.id && event.id.startsWith('manual-')) {
                        let buttonsHtml = `
                            <div class="manual-btns">
                                <button type="button" class="btn btn-info" id="btnEditManual" data-eid="${event.id}">Таҳрирлаш</button>
                            </div>
                        `;
                        $('#viewEventFooter').prepend(buttonsHtml);

                        $('#btnEditManual').on('click', function() {
                            let eid = $(this).data('eid');
                            let found = $('#fullcalendar').fullCalendar('clientEvents', eid);
                            if (found.length > 0) {
                                let evt = found[0];
                                $('#editEventId').val(eid);
                                $('#editEventTitle').val(evt.title);
                                $('#editEventStart').val(moment(evt.realStart).format('YYYY-MM-DDTHH:mm:ss'));
                                if (evt.realEnd) {
                                    $('#editEventEnd').val(moment(evt.realEnd).format('YYYY-MM-DDTHH:mm:ss'));
                                } else {
                                    $('#editEventEnd').val('');
                                }
                                $('#editEventDescription').val(evt.description ?? '');
                                $('#viewEventModal').modal('hide');
                                $('#editEventModal').modal('show');
                            }
                        });
                    }

                    $('#viewEventModal').modal('show');
                },
                dayClick: function(date) {
                    $('#eventStart').val(moment(date).format('YYYY-MM-DDTHH:mm:ss'));
                    $('#createEventModal').modal('show');
                }
            });

            function getColorClass(event) {
                const plannedDate = moment(event.end);
                const currentDate = moment();
                let colorClass = 'date-default';

                if (plannedDate.isValid()) {
                    const daysDifference = plannedDate.diff(currentDate, 'days');
                    if (event.status === 'Completed') {
                        colorClass = 'date-success';
                    } else if (currentDate.isAfter(plannedDate)) {
                        colorClass = 'date-danger';
                    } else if (daysDifference <= 2 && daysDifference >= 0) {
                        colorClass = 'date-warning';
                    } else {
                        colorClass = 'date-default';
                    }
                }

                return colorClass;
            }

            $('#calendarFilter').on('change', function() {
                let val = $(this).val();
                applyFilter(val);
            });

            $('#saveEvent').on('click', function() {
                var formData = {
                    title: $('#eventTitle').val(),
                    start_date: $('#eventStart').val(),
                    end_date: $('#eventEnd').val(),
                    description: $('#eventDescription').val(),
                    _token: $('meta[name="csrf-token"]').attr('content')
                };

                $.post("{{ route('manual-events.store') }}", formData, function(response) {
                    if (response.status === 'success') {
                        let newEvt = {
                            id: 'manual-' + response.data.id,
                            title: response.data.title,
                            start: response.data.start_date,
                            end: response.data.end_date,
                            description: response.data.description,
                            color: '#f39c12',
                            type: 'manual'
                        };
                        $('#fullcalendar').fullCalendar('renderEvent', newEvt, true);
                        originalEvents.push(newEvt);
                        $('#createEventForm')[0].reset();
                        $('#createEventModal').modal('hide');
                    } else {
                        alert('Хатолик: Ҳодиса сақланмади!');
                    }
                });
            });

            $('#updateEventBtn').on('click', function() {
                let eventId = $('#editEventId').val();
                let putData = {
                    title: $('#editEventTitle').val(),
                    start_date: $('#editEventStart').val(),
                    end_date: $('#editEventEnd').val(),
                    description: $('#editEventDescription').val(),
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    _method: 'PUT'
                };

                $.ajax({
                    url: '/calendar/update/' + eventId,
                    type: 'POST',
                    data: putData,
                    success: function(resp) {
                        if (resp.status === 'success') {
                            alert(resp.message);
                            let evts = $('#fullcalendar').fullCalendar('clientEvents', eventId);
                            if (evts.length > 0) {
                                let e = evts[0];
                                e.title = resp.data.title;
                                e.start = resp.data.start_date;
                                e.end = resp.data.end_date;
                                e.description = resp.data.description;
                                $('#fullcalendar').fullCalendar('updateEvent', e);
                            }
                            $('#editEventModal').modal('hide');
                        }
                    },
                    error: function() {
                        alert('Хатолик: Таҳрирлаш муваффақиятсиз!');
                    }
                });
            });

            $('#deleteEventBtn').on('click', function() {
                if (!confirm('Ростдан ҳам ушбу ҳодисани ўчирмоқчимисиз?')) return;
                let eventId = $('#editEventId').val();
                $.ajax({
                    url: '/calendar/destroy/' + eventId,
                    type: 'DELETE',
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(resp) {
                        if (resp.status === 'success') {
                            alert(resp.message);
                            $('#fullcalendar').fullCalendar('removeEvents', eventId);
                            $('#editEventModal').modal('hide');
                            originalEvents = originalEvents.filter(e => e.id !== eventId);
                        }
                    },
                    error: function() {
                        alert('Хатолик: Ўчириш муваффақиятсиз!');
                    }
                });
            });
        });

        function applyFilter(filterVal) {
            $('#fullcalendar').fullCalendar('removeEvents');
            let filteredEvents = [];
            if (filterVal === 'all') {
                filteredEvents = originalEvents;
            } else if (filterVal === 'task') {
                filteredEvents = originalEvents.filter(e => e.type === 'task');
            } else if (filterVal === 'manual') {
                filteredEvents = originalEvents.filter(e => e.type === 'manual');
            }
            $('#fullcalendar').fullCalendar('addEventSource', filteredEvents);
        }
    </script>
</body>

</html>