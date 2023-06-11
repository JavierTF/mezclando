'use strict';
     
const CreateProcesses = function () {
    const form = $("#form_create_process");

    const initInputs= function () {};

    const initEvent = function () {

        $('#id_numero').on('change', function () {
            if ($('#id_numero').val() != '') {
                hiden_error_message($('#id_numero'));
            } else {
                show_error_message($('#id_numero'), 'Este campo es requerido');
            }
        });

        $('#id_fecha_recepcion').on('change', function () {
            if ($('#id_fecha_recepcion').val() != '') {
                hiden_error_message($('#id_fecha_recepcion'));
            } else {
                show_error_message($('#id_fecha_recepcion'), 'Este campo es requerido');
            }
        });

        $('#id_propuesto').on('change', function () {
            if ($('#id_propuesto').val() != '') {
                hiden_error_message($('#id_propuesto'));
            } else {
                show_error_message($('#id_propuesto'), 'Este campo es requerido');
            }
        });

        $('#id_responsable').on('change', function () {
            if ($('#id_responsable').val() != '') {
                hiden_error_message($('#id_responsable'));
            } else {
                show_error_message($('#id_responsable'), 'Este campo es requerido');
            }
        });

        $('#id_mesplaneado').on('change', function () {
            if ($('#id_mesplaneado').val() != '') {
                hiden_error_message($('#id_mesplaneado'));
            } else {
                show_error_message($('#id_mesplaneado'), 'Este campo es requerido');
            }
        });

        $('#id_fechacierre').on('change', function () {
            if ($('#id_fechacierre').val() != '') {
                hiden_error_message($('#id_fechacierre'));
            } else {
                show_error_message($('#id_fechacierre'), 'Este campo es requerido');
            }
        });

        $('#id_observacionesactual').on('change', function () {
            if ($('#id_observacionesactual').val() != '') {
                hiden_error_message($('#id_observacionesactual'));
            } else {
                show_error_message($('#id_observacionesactual'), 'Este campo es requerido');
            }
        });

        $('#id_observacionesfutura').on('change', function () {
            if ($('#id_observacionesfutura').val() != '') {
                hiden_error_message($('#id_observacionesfutura'));
            } else {
                show_error_message($('#id_observacionesfutura'), 'Este campo es requerido');
            }
        });

        $('#id_estado').on('change', function () {
            if ($('#id_estado').val() != '') {
                hiden_error_message($('#id_estado'));
            } else {
                show_error_message($('#id_estado'), 'Este campo es requerido');
            }
        });

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_numero').val() == ''){
                show_error_message($('#id_numero'), 'Este campo es requerido');
                return;
            }

            if($('#id_fecha_recepcion').val() == ''){
                show_error_message($('#id_fecha_recepcion'), 'Este campo es requerido');
                return;
            }

            if($('#id_propuesto').val() == ''){
                show_error_message($('#id_propuesto'), 'Este campo es requerido');
                return;
            }

            if($('#id_responsable').val() == ''){
                show_error_message($('#id_responsable'), 'Este campo es requerido');
                return;
            }

            if($('#id_mesplaneado').val() == ''){
                show_error_message($('#id_mesplaneado'), 'Este campo es requerido');
                return;
            }

            if($('#id_fechacierre').val() == ''){
                show_error_message($('#id_fechacierre'), 'Este campo es requerido');
                return;
            }

            if($('#id_observacionesactual').val() == ''){
                show_error_message($('#id_observacionesactual'), 'Este campo es requerido');
                return;
            }

            if($('#id_observacionesfutura').val() == ''){
                show_error_message($('#id_observacionesfutura'), 'Este campo es requerido');
                return;
            }

            if($('#id_estado').val() == ''){
                show_error_message($('#id_estado'), 'Este campo es requerido');
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
                        'La afectacion se ha registrado satisfactoriamente!', '', 'success'
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
    CreateProcesses.init();
});