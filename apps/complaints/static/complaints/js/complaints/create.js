'use strict';
     
const CreateComplaint = function () {
    var list_actions = [];
    const form = $("#form_create_complaint");

    const initInputs= function () {
        $('input[name="reception_date"]').daterangepicker({
            singleDatePicker: true,
            maxDate: moment(),
            locale: {
                format: 'Y-M-DD',
                separator: ' - ',
                applyLabel: 'Aplicar',
                cancelLabel: 'Cancelar',
                weekLabel: 'W',
                customRangeLabel: 'Personalizado',
                daysOfWeek: moment.weekdaysMin(),
                monthNames: moment.monthsShort()
            },
            ranges: {
               'Hoy': [moment()],
               'Hace una semana': [moment().subtract(1, 'week')],
               'Hace un mes': [moment().subtract(1, 'month')]
            }
        });
        $('input[name="deadline"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'Y-M-DD',
                separator: ' - ',
                applyLabel: 'Aplicar',
                cancelLabel: 'Cancelar',
                weekLabel: 'W',
                customRangeLabel: 'Personalizado',
                daysOfWeek: moment.weekdaysMin(),
                monthNames: moment.monthsShort()
            },
            ranges: {
               'Hoy': [moment()],
               'Dentro de un año': [moment().add(1, 'year')],
               'Dentro de dos años': [moment().add(2, 'year')]
            }
        });
        $('#id_deadline').val('');

        $('input[name="date"]').daterangepicker({
            singleDatePicker: true,
            locale: {
                format: 'Y-M-DD',
                separator: ' - ',
                applyLabel: 'Aplicar',
                cancelLabel: 'Cancelar',
                weekLabel: 'W',
                customRangeLabel: 'Personalizado',
                daysOfWeek: moment.weekdaysMin(),
                monthNames: moment.monthsShort()
            },
            ranges: {
               'Hoy': [moment()],
               'Ayer': [moment().subtract(1, 'day')],
               'Hace una semana': [moment().subtract(1, 'week')],
               'Hace un mes': [moment().subtract(1, 'month')]
            }
        });
        $('#id_date').val('');
    };

    const initEvent = function () {

        $('#id_reception_date').on('change', function () {
            if ($('#id_reception_date').val() != '') {
                hiden_error_message($('#id_reception_date'));

                var recep_date = moment($('#id_reception_date').val());
                var deadline_date = moment($('#id_deadline').val());

                if (recep_date >= deadline_date) {
                    show_error_message($('#id_deadline'), 'Asegurese que la fecha no sea menor o igual a la fecha de cierre');
                }else{
                    hiden_error_message($('#id_deadline'));
                }
            } else {
                show_error_message($('#id_reception_date'), 'Este campo es requerido');
            }
        });

        $('#id_deadline').on('change', function () {
            if ($('#id_deadline').val() != '') {
                hiden_error_message($('#id_deadline'));

                var recep_date = moment($('#id_reception_date').val());
                var deadline_date = moment($('#id_deadline').val());

                if (recep_date >= deadline_date) {
                    show_error_message($('#id_deadline'), 'Asegurese que la fecha no sea menor o igual a la fecha de cierre');
                }else{
                    hiden_error_message($('#id_deadline'));
                }

            }
        });

        $('#id_client').on('change', function () {
            if($('#id_client').val() != ''){
                hiden_error_message($('#id_client'));
            } else {
                show_error_message($('#id_client'), 'Este campo es requerido');
            }
        });

        $('#id_process').on('change', function () {
            if($('#id_process').val() != ''){
                hiden_error_message($('#id_process'));
            } else {
                show_error_message($('#id_process'), 'Este campo es requerido');
            }
        });

        $('#id_way_of_reception').on('change', function () {
            if($('#id_way_of_reception').val() != ''){
                hiden_error_message($('#id_way_of_reception'));
            } else {
                show_error_message($('#id_way_of_reception'), 'Este campo es requerido');
            }
        });

        $('#id_reason').on('change', function () {
            if ($('#id_reason').val() != '') {
                hiden_error_message($('#id_reason'));
            } else {
                show_error_message($('#id_reason'), 'Este campo es requerido');
            }
        });

        $('#id_date').on('change', function () {
            if ($('#id_date').val() == '') {
                hiden_error_message($('#id_date'));
            }
        });

        $('#id_action').on('change', function () {
            if ($('#id_action').val() == '') {
                hiden_error_message($('#id_action'));
            }
        });

        $('#add_action').on('click', function () {
            if ($('#id_date').val() == ''){
                show_error_message($('#id_date'), 'Este campo es requerido');
                return;
            }
            if ($('#id_action').val() == ''){
                show_error_message($('#id_action'), 'Este campo es requerido');
                return;
            }
            const date = $('#id_date');
            const action = $('#id_action');

            addAction({"date": date.val(), "action": action.val()});

            var html = '<tr>';
            html += '<td>' + (list_actions.length) + '</td><td>' + date.val() + '</td><td>' + action.val() + '</td><td><a class="btn btn-sm btn-default" onclick="CreateComplaint.editAction(\'' + date.val() + '\', \'' + action.val() + '\')"><i class="fa fa-edit"></i></a> <a class="btn btn-sm btn-default" onclick="CreateComplaint.removeAction(\'' + action.val() + '\')"><i class="fa fa-trash"></i></a></td>';
            html += '</tr>';

            $('#table-action').append(html);

            date.val('');
            hiden_error_message(date);
            action.val('');
            hiden_error_message(action);

        });

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            var recep_date = moment($('#id_reception_date').val());
            var deadline_date = moment($('#id_deadline').val());

            if (recep_date >= deadline_date) {
                show_error_message($('#id_deadline'), 'Asegurese que la fecha no sea menor o igual a la fecha de cierre');
                return;
            }

            if($('#id_client').val() == ''){
                show_error_message($('#id_client'), 'Este campo es requerido');
                return;
            }

            if($('#id_process').val() == ''){
                show_error_message($('#id_process'), 'Este campo es requerido');
                return;
            }

            if($('#id_way_of_reception').val() == ''){
                show_error_message($('#id_way_of_reception'), 'Este campo es requerido');
                return;
            }

            if($('#id_reason').val() == ''){
                show_error_message($('#id_reason'), 'Este campo es requerido');
                return;
            }

            var formData = new FormData(form[0]);
            for (var i = 0; i < list_actions.length; i++){
                formData.append('actions[]', JSON.stringify({"date": list_actions[i].date, "action": list_actions[i].action}));
            }

            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    Swal.fire(
                        'La Queja se ha registrado satisfactoriamente!', '', 'success'
                    ).then((result) => {
                        setTimeout(function() {
                            $(location).attr('href', data.results.url);
                        }, 1250);
                    });
                }
            });
        });

    };

    const addAction = function (action) {
        list_actions.push(action);
    };

    const editAction = function (elem, date, action) {
        const x = list_actions.filter((item) => item.action != action );
        list_actions = x;

        var tr = elem.parentNode.closest('tr');
        tr.remove();

        $('#id_date').val(date);
        $('#id_action').val(action);
    };

    const removeAction = function (elem, index) {
        const x = list_actions.filter((item) => item.action != index );
        list_actions = x;

        var tr = elem.parentNode.closest('tr');
        tr.remove();
    };

    const show_error_message = function (element, message) {
        var x = element.closest('.input-content')[0].querySelector('small');
        x.innerHTML = message;
    };

    const hiden_error_message = function (element) {
        var x = element.closest('.input-content')[0].querySelector('small');
        x.innerHTML = '';
    };

    return {
        init: function () {
            initInputs();
            initEvent();
            submitForm();
        },
        editAction: function (date, action) {
          editAction(event.target, date, action);
        },
        removeAction: function (index) {
          removeAction(event.target, index);
        }
    };
}();

$(document).ready(function() {
    CreateComplaint.init();
});