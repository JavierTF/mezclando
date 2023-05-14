'use strict';
     
const UpdateLicenses = function () {
    const form = $("#form_update_licenses");

    const initInputs= function () {
        $('input[name="grant_date"]').daterangepicker({
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
        $('input[name="expiration_date"]').daterangepicker({
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
               'Dentro de dos años': [moment().add(2, 'year')],
               'Permanente': [moment().add(100, 'year')]
            }
        });

        $('#id_process').select2({
            ajax: {
                url: get_process_path,
                data: function (params) {
                    var query = {
                        search: params.term,
                        excludes: [$('#id_associated_process').val() != '' ? $('#id_associated_process').val() : 0]
                    };
                    return query;
                },
                placeholder: 'Seleccione un proceso'
            }
        });
        $('#id_associated_process').select2({
            ajax: {
                url: get_process_path,
                data: function (params) {
                    var query = {
                        search: params.term,
                        excludes: [$('#id_process').val() != '' ? $('#id_process').val() : 0]
                    };
                    return query;
                },
                placeholder: 'Seleccione un proceso'
            }
        });
    };

    const initEvent = function () {

        $('#id_name').on('change', function () {
            if ($('#id_name').val() != '') {
                hiden_error_message($('#id_name'));

                if($('#id_name').val().match(/^[a-zA-Z 0-9 áÁéÉíÍóÓúÚñÑ.]+$/)) {
                    hiden_error_message($('#id_name'));
                } else {
                    show_error_message($('#id_name'), 'Este campo solo admite letras');
                }
            } else {
                show_error_message($('#id_name'), 'Este campo es requerido');
            }
        });

        $('#id_entity').on('change', function () {
            if ($('#id_entity').val() != '') {
                hiden_error_message($('#id_entity'));
            } else {
                show_error_message($('#id_entity'), 'Este campo es requerido');
            }
        });

        $('#id_grant_date').on('change', function () {
            if ($('#id_grant_date').val() != '') {
                hiden_error_message($('#id_grant_date'));

                var gra_date = moment($('#id_grant_date').val());
                var exp_date = moment($('#id_expiration_date').val());

                if (gra_date >= exp_date) {
                    show_error_message($('#id_expiration_date'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
                }else{
                    hiden_error_message($('#id_expiration_date'));
                }
            } else {
                show_error_message($('#id_grant_date'), 'Este campo es requerido');
            }
        });

        $('#id_expiration_date').on('change', function () {
            if ($('#id_expiration_date').val() != '') {
                hiden_error_message($('#id_expiration_date'));

                var gra_date = moment($('#id_grant_date').val());
                var exp_date = moment($('#id_expiration_date').val());

                if (gra_date >= exp_date) {
                    show_error_message($('#id_expiration_date'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
                }else{
                    hiden_error_message($('#id_expiration_date'));
                }

            } else {
                show_error_message($('#id_expiration_date'), 'Este campo es requerido');
            }
        });

        $('#id_process').on('change', function () {
            if ($('#id_process').val() != '') {
                hiden_error_message($('#id_process'));
            } else {
                show_error_message($('#id_process'), 'Este campo es requerido');
            }
        });

        $('#id_responsible').on('change', function () {
            if ($('#id_responsible').val() != '') {
                hiden_error_message($('#id_responsible'));
            } else {
                show_error_message($('#id_responsible'), 'Este campo es requerido');
            }
        });

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_name').val() == ''){
                show_error_message($('#id_name'), 'Este campo es requerido');
                return;
            }

            if(!$('#id_name').val().match(/^[a-zA-Z 0-9 áÁéÉíÍóÓúÚñÑ.]+$/)) {
                show_error_message($('#id_name'), 'Este campo solo admite letras');
                return;
            }

            if($('#id_entity').val() == ''){
                show_error_message($('#id_entity'), 'Este campo es requerido');
                return;
            }

            if($('#id_grant_date').val() == ''){
                show_error_message($('#id_grant_date'), 'Este campo es requerido');
                return;
            }

            if($('#id_expiration_date').val() == ''){
                show_error_message($('#id_expiration_date'), 'Este campo es requerido');
                return;
            }

            if($('#id_process').val() == ''){
                show_error_message($('#id_process'), 'Este campo es requerido');
                return;
            }

            if($('#id_responsible').val() == ''){
                show_error_message($('#id_responsible'), 'Este campo es requerido');
                return;
            }

            var gra_date = moment($('#id_grant_date').val());
            var exp_date = moment($('#id_expiration_date').val());

            if (gra_date >= exp_date) {
                show_error_message($('#id_expiration_date'), 'Asegurese que la fecha no sea menor o igual a la fecha de otorgamiento');
                return;
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
                        'La licencia se ha modificado satisfactoriamente!', '', 'success'
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
    UpdateLicenses.init();
});