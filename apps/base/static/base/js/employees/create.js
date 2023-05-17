'use strict';
     
const CreateEmployee = function () {
    const form = $("#form_create_employee");

    const initInputs= function () {

        $('input[name="init_date_reserve"]').daterangepicker({
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
        $('input[name="finish_date_reserve"]').daterangepicker({
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

        $('input[name="init_date_executive"]').daterangepicker({
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
        $('input[name="finish_date_executive"]').daterangepicker({
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
    };

    const initEvent = function () {

        $('#id_first_name').on('change', function () {
            if ($('#id_first_name').val() != '') {
                hiden_error_message($('#id_first_name'));

                if($('#id_first_name').val().match(/^[A-Za-z ]+$/)) {
                    hiden_error_message($('#id_first_name'));
                } else {
                    show_error_message($('#id_first_name'), 'Este campo solo admite letras');
                }
            } else {
                show_error_message($('#id_first_name'), 'Este campo es requerido');
            }
        });

        $('#id_last_name').on('change', function () {
            if ($('#id_last_name').val() != '') {
                hiden_error_message($('#id_last_name'));

                if($('#id_last_name').val().match(/^[A-Za-z ]+$/)) {
                    hiden_error_message($('#id_last_name'));
                } else {
                    show_error_message($('#id_last_name'), 'Este campo solo admite letras');
                }
            } else {
                show_error_message($('#id_last_name'), 'Este campo es requerido');
            }
        });

        $('#id_identification').on('change', function () {
            if ($('#id_identification').val() != '') {
                hiden_error_message($('#id_identification'));
            } else {
                show_error_message($('#id_identification'), 'Este campo es requerido');
            }
        });

        $('#id_position').on('change', function () {
            if ($('#id_position').val() != '') {
                hiden_error_message($('#id_position'));
            } else {
                show_error_message($('#id_position'), 'Este campo es requerido');
            }
        });
        
        $('#id_init_date_reserve').on('change', function () {
            if ($('#id_init_date_reserve').val() != '') {
                hiden_error_message($('#id_init_date_reserve'));

                var i_rever_date = moment($('#id_init_date_reserve').val());
                var f_rever_date = moment($('#id_finish_date_reserve').val());

                if (i_rever_date >= f_rever_date) {
                    show_error_message($('#id_finish_date_reserve'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
                }else{
                    hiden_error_message($('#id_finish_date_reserve'));
                }
            }
        });

        $('#id_finish_date_reserve').on('change', function () {
            if ($('#id_finish_date_reserve').val() != '') {
                hiden_error_message($('#id_finish_date_reserve'));

                var gra_date = moment($('#id_init_date_reserve').val());
                var exp_date = moment($('#id_finish_date_reserve').val());

                if (gra_date >= exp_date) {
                    show_error_message($('#id_finish_date_reserve'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
                }else{
                    hiden_error_message($('#id_finish_date_reserve'));
                }

            }
        });

        $('#id_init_date_executive').on('change', function () {
            if ($('#id_init_date_executive').val() != '') {
                hiden_error_message($('#id_init_date_executive'));

                var i_exec_date = moment($('#id_init_date_executive').val());
                var f_exec_date = moment($('#id_finish_date_executive').val());

                if (i_exec_date >= f_exec_date) {
                    show_error_message($('#id_finish_date_executive'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
                } else {
                    hiden_error_message($('#id_finish_date_executive'));
                }
            }
        });

        $('#id_finish_date_executive').on('change', function () {
            if ($('#id_finish_date_executive').val() != '') {
                hiden_error_message($('#id_finish_date_executive'));

                var i_exec_date = moment($('#id_init_date_executive').val());
                var f_exec_date = moment($('#id_finish_date_executive').val());

                if (i_exec_date >= f_exec_date) {
                    show_error_message($('#id_finish_date_executive'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
                } else {
                    hiden_error_message($('#id_finish_date_executive'));
                }

            }
        });

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_first_name').val() == ''){
                show_error_message($('#id_first_name'), 'Este campo es requerido');
                return;
            }

            if(!$('#id_first_name').val().match(/^[A-Za-z ]+$/)) {
                show_error_message($('#id_first_name'), 'Este campo solo admite letras');
                return;
            }

            if($('#id_last_name').val() == ''){
                show_error_message($('#id_last_name'), 'Este campo es requerido');
                return;
            }

            if(!$('#id_last_name').val().match(/^[A-Za-z ]+$/)) {
                show_error_message($('#id_last_name'), 'Este campo solo admite letras');
                return;
            }

            if($('#id_identification').val() == ''){
                show_error_message($('#id_identification'), 'Este campo es requerido');
                return;
            }

            if($('#id_position').val() == ''){
                show_error_message($('#id_position'), 'Este campo es requerido');
                return;
            }

            var i_rever_date = moment($('#id_init_date_reserve').val());
            var f_rever_date = moment($('#id_finish_date_reserve').val());

            if (i_rever_date >= f_rever_date) {
                show_error_message($('#id_finish_date_reserve'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
            }

            var i_exec_date = moment($('#id_init_date_executive').val());
            var f_exec_date = moment($('#id_finish_date_executive').val());

            if (i_exec_date >= f_exec_date) {
                show_error_message($('#id_finish_date_executive'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
            }

            var formData = new FormData(form[0]);

            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    Swal.fire(
                        'El Empleado se ha registrado satisfactoriamente!', '', 'success'
                    ).then((result) => {
                        setTimeout(function() {
                            $(location).attr('href', data.results.url);
                        }, 1250);
                    });
                }
            });
        });

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
        }
    };
}();

$(document).ready(function() {
    CreateEmployee.init();
});