'use strict';
     
const UpdateProcedures = function () {
    const form = $("#form_update_procedure");

    const initInputs= function () {};

    const initEvent = function () {

        $('#id_process').on('change', function () {
            if ($('#id_process').val() != '') {
                hiden_error_message($('#id_process'));
            } else {
                show_error_message($('#id_process'), 'Este campo es requerido');
            }
        });

        $('#id_name').on('change', function () {
            if ($('#id_name').val() != '') {
                hiden_error_message($('#id_name'));
            } else {
                show_error_message($('#id_name'), 'Este campo es requerido');
            }
        });

        $('#id_abbreviation').on('change', function () {
            if ($('#id_abbreviation').val() != '') {
                hiden_error_message($('#id_abbreviation'));
            } else {
                show_error_message($('#id_abbreviation'), 'Este campo es requerido');
            }
        });

        $('#id_responsible').on('change', function () {
            if ($('#id_responsible').val() != '') {
                hiden_error_message($('#id_responsible'));
            } else {
                show_error_message($('#id_responsible'), 'Este campo es requerido');
            }
        });

        $('#id_edition').on('change', function () {
            if ($('#id_edition').val() != '') {
                hiden_error_message($('#id_edition'));
            } else {
                show_error_message($('#id_edition'), 'Este campo es requerido');
            }
        });

        $('#id_revision').on('change', function () {
            if ($('#id_revision').val() != '') {
                hiden_error_message($('#id_revision'));
            } else {
                show_error_message($('#id_revision'), 'Este campo es requerido');
            }
        });

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_process').val() == ''){
                show_error_message($('#id_process'), 'Este campo es requerido');
                return;
            }

            if($('#id_name').val() == ''){
                show_error_message($('#id_name'), 'Este campo es requerido');
                return;
            }

            if($('#id_abbreviation').val() == ''){
                show_error_message($('#id_abbreviation'), 'Este campo es requerido');
                return;
            }

            if($('#id_responsible').val() == ''){
                show_error_message($('#id_responsible'), 'Este campo es requerido');
                return;
            }

            if($('#id_edition').val() == ''){
                show_error_message($('#id_edition'), 'Este campo es requerido');
                return;
            }

            if($('#id_revision').val() == ''){
                show_error_message($('#id_revision'), 'Este campo es requerido');
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
                        'El Procedimiento se ha modificado satisfactoriamente!', '', 'success'
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
    UpdateProcedures.init();
});