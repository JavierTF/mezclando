'use strict';
     
const modPlan = function () {
    const form = $("#form_update_plan");

    const initInputs= function () {};

    const initEvent = function () {

        $('#id_numero').on('change', function () {
            if ($('#id_numero').val() != '') {
                hiden_error_message($('#id_numero'));
            } else {
                show_error_message($('#id_numero'), 'Este campo es requerido');
            }
        });

        $('#id_descripcion').on('change', function () {
            if ($('#id_descripcion').val() != '') {
                hiden_error_message($('#id_descripcion'));
            } else {
                show_error_message($('#id_descripcion'), 'Este campo es requerido');
            }
        });
        if ($('#id_lugar').val() == 'Otros') {
            $('#id_otro').attr('disabled', false);
   
        }else{
            $('#id_otro').attr('disabled', true);
            hiden_error_message($('#id_otro'));
        }
        $('#id_dia').on('change', function () {
            if ($('#id_dia').val() != '') {
                hiden_error_message($('#id_dia'));
                let ahora=new Date($('#id_dia').val())
                    let antes=new Date(Date.now())
                if(antes.getFullYear()-2 >= ahora.getFullYear()) { 
                        show_error_message($('#id_dia'), 'La fecha de actividad no puede ser 2 años menor que la fecha actual');
                        return;
                           }else{  
                         hiden_error_message($('#id_dia'));
                           }
                           if(antes.getFullYear()+2 <= ahora.getFullYear()) { 
                            show_error_message($('#id_dia'), 'La fecha de actividad no puede ser 2 años mayor que la fecha actual');
                            return;
                               }else{  
                             hiden_error_message($('#id_dia'));
                               }
            } else {
                show_error_message($('#id_dia'), 'Este campo es requerido');
            }
        });

        $('#id_hora').on('change', function () {
            if ($('#id_hora').val() != '') {
                hiden_error_message($('#id_hora'));
            } else {
                show_error_message($('#id_hora'), 'Este campo es requerido');
            }
        });

        $('#id_lugar').on('change', function () {
            if ($('#id_lugar').val() != '') {
                hiden_error_message($('#id_lugar'));
            } else {
                show_error_message($('#id_lugar'), 'Este campo es requerido');
            }
        });

        

        $('#id_preside').on('change', function () {
            if ($('#id_preside').val() != '') {
                hiden_error_message($('#id_preside'));
            } else {
                show_error_message($('#id_preside'), 'Este campo es requerido');
            }
        });

        $('#id_participantes').on('change', function () {
            if ($('#id_participantes').val() != '') {
                hiden_error_message($('#id_participantes'));
            } else {
                show_error_message($('#id_participantes'), 'Este campo es requerido');
            }
        });

        $('#id_lugar').on('change', function () {
            if ($('#id_lugar').val() != '') {
                hiden_error_message($('#id_lugar'));
            } else {
                show_error_message($('#id_lugar'), 'Este campo es requerido');
            }
        });

        $('#id_lugar').on('change', function () {
            if ($('#id_lugar').val() != 'Otros') {
                $('#id_otro').attr('disabled', true);
            } else {
                $('#id_otro').attr('disabled', false);
            }
        });

        if($('#id_contcheck')[0].checked) {
            $('#id_contacto').attr('disabled', false);
        }else {
            $('#id_contacto').attr('disabled', true);
        }
        $('#id_contcheck').on('change', function () {
        if($('#id_contcheck')[0].checked) {
            $('#id_contacto').attr('disabled', false);
        }else {
            $('#id_contacto').attr('disabled', true);
        }
        });

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_numero').val() == ''){
                show_error_message($('#id_numero'), 'Este campo es requerido');
                return;
            }

            if($('#id_descripcion').val() == ''){
                show_error_message($('#id_descripcion'), 'Este campo es requerido');
                return;
            }

            if($('#id_dia').val() == ''){
                show_error_message($('#id_dia'), 'Este campo es requerido');
                return;
            }

            if($('#id_hora').val() == ''){
                show_error_message($('#id_hora'), 'Este campo es requerido');
                return;
            }

            if ($('#id_lugar').val() != 'Otros') {
                $('#id_otro').hide();  
        } else {
            $('#id_otro').show();
        }

            if($('#id_lugar').val() == ''){
                show_error_message($('#id_lugar'), 'Este campo es requerido');
                return;
            }

            if($('#id_preside').val() == ''){
                show_error_message($('#id_preside'), 'Este campo es requerido');
                return;
            }

            if($('#id_participantes').val() == ''){
                show_error_message($('#id_participantes'), 'Este campo es requerido');
                return;
            }

            let ahora=new Date($('#id_dia').val())
                    let antes=new Date(Date.now())
                if(antes.getFullYear()-2 >= ahora.getFullYear()) { 
                        show_error_message($('#id_dia'), 'La fecha de actividad no puede ser 2 años menor que la fecha actual');
                        return;
                           }else{  
                         hiden_error_message($('#id_dia'));
                           }
                           if(antes.getFullYear()+2 <= ahora.getFullYear()) { 
                            show_error_message($('#id_dia'), 'La fecha de actividad no puede ser 2 años mayor que la fecha actual');
                            return;
                               }else{  
                             hiden_error_message($('#id_dia'));
                               }

            

            var formData = new FormData(form[0]);

            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    Swal.fire({
                        title: '¡La actividad se ha modificado satisfactoriamente!',
                        type: 'success',
                        timer: 2000,
                        showConfirmButton: false
                    }).then((result) => {
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
    modPlan.init();
});

$('button[type="submit"]').prop("disabled", true);

var form = document.getElementById("form_update_plan");
var form_data = new FormData(form);
var csrf_token = $('input[name="csrfmiddlewaretoken"]').val();

form_data.append("informe_apertura", document.getElementById('id_informe_apertura').files[0]);
form_data.append("informe_cierre", document.getElementById('id_informe_cierre').files[0]);
form_data.append("csrfmiddlewaretoken", csrf_token);

$.ajax({
    url: $(this).attr("formaction"),
    type: $(this).attr("method"),
    dataType: "JSON",
    data: form_data,
    processData: false,
    contentType: false,
    success: function (data, status)
    {
        window.location.replace(listarConsecutivo);
    },
    error: function (xhr, desc, err)
    {
        if (response.result == 'error'){
            Toast.fire({
                type: 'error',
                title: response.message,
            });
        }      
        $('button[type="submit"]').prop("disabled", false);      
    },
    always: function (response){
        if (response.result == 'error'){
            Toast.fire({
                type: 'error',
                title: response.message,
            });
        }
        if (response.result == 'success'){
            window.location.replace(listarConsecutivo);
        }
        $('button[type="submit"]').prop("disabled", false);
    }
});
