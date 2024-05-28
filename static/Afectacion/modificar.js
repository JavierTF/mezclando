'use strict';
     
const cambiarAfectacion = function () {
    const form = $("#form_update_afectation");

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
                if(Date.now() < Date.parse($('#id_fecha_recepcion').val())) { 
                    show_error_message($('#id_fecha_recepcion'), 'La fecha de recepción no puede ser mayor que la fecha actual');
                    hiden_error_message($('#id_hora'));
                    return;
                       }else{  
                     hiden_error_message($('#id_fecha_recepcion'));
                       }
                    let ahora=new Date($('#id_fecha_recepcion').val())
                    let antes=new Date(Date.now())
                if(antes.getFullYear()-2 >= ahora.getFullYear()) { 
                        show_error_message($('#id_fecha_recepcion'), 'La fecha de recepción no puede ser 2 años menor que la fecha actual');
                        return;
                           }else{  
                         hiden_error_message($('#id_fecha_recepcion'));
                           }
            } else {
                show_error_message($('#id_fecha_recepcion'), 'Este campo es requerido');
            }
            
        });

       

        $('#id_propuesto').on('change', function () {
            if ($('#id_propuesto').val() != '') {
                hiden_error_message($('#id_propuesto'));
                if($('#id_propuesto').val() == $('#id_responsable').val()) { 
                    show_error_message($('#id_propuesto'), 'El trabajador que reporta la afectación no puede ser el encargado de la misma');
                    return;
                        }else{  
                            hiden_error_message($('#id_responsable'));
                    hiden_error_message($('#id_propuesto'));
                        }
            } else {
                show_error_message($('#id_propuesto'), 'Este campo es requerido');
            }
        });

        $('#id_responsable').on('change', function () {
            if ($('#id_responsable').val() != '') {
                hiden_error_message($('#id_responsable'));
                if($('#id_propuesto').val() == $('#id_responsable').val()) { 
                    show_error_message($('#id_responsable'), 'El trabajador que se encarga de la afectación no puede ser el que reporta  la misma');
                    return;
                        }else{  
                            hiden_error_message($('#id_propuesto'));
                    hiden_error_message($('#id_responsable'));
                        }
            } else {
                show_error_message($('#id_responsable'), 'Este campo es requerido');
            }
        });

        
        $('#id_observacionesactual').on('change', function () {
            if ($('#id_observacionesactual').val() != '') {
                hiden_error_message($('#id_observacionesactual'));
            } else {
                show_error_message($('#id_observacionesactual'), 'Este campo es requerido');
            }
        });

        if ($('#id_estado').val() == 'Cerrado') {
            $('#id_fecha_cierre').attr('disabled', false);
   
}else{
    $('#id_fecha_cierre').attr('disabled', true);
    hiden_error_message($('#id_fecha_cierre'));
}
        
        $('#id_estado').on('change', function () {
            if ($('#id_estado').val() == 'Cerrado') {
                $('#id_fecha_cierre').attr('disabled', false);
       
    }else{
        $('#id_fecha_cierre').attr('disabled', true);
        hiden_error_message($('#id_fecha_cierre'));
    }});

    $('#id_fecha_cierre').on('change', function () {
        if ($('#id_fecha_cierre').val() != '') {
            hiden_error_message($('#id_fecha_cierre'));
            if(Date.now() < Date.parse($('#id_fecha_cierre').val())) { 
                show_error_message($('#id_fecha_cierre'), 'La fecha de cierre no puede ser mayor que la fecha actual');
                return;
                   }else{  
                 hiden_error_message($('#id_fecha_cierre'));
                   }
                let ahora=new Date($('#id_fecha_cierre').val())
                let antes=new Date(Date.now())
            if(antes.getFullYear()-2 >= ahora.getFullYear()) { 
                    show_error_message($('#id_fecha_cierre'), 'La fecha de cierre no puede ser 2 años menor que la fecha actual');
                    return;
                       }else{  
                     hiden_error_message($('#id_fecha_cierre'));
                       }
        } else {
            show_error_message($('#id_fecha_cierre'), 'Este campo es requerido');
        }
        
    });


    };

    const submitForm = function () {

        $('#form_submit').click(function () {


            
            var formData = new FormData(form[0]);

            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    Swal.fire({
                        title: '¡La afectación se ha modificado satisfactoriamente!',
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
    cambiarAfectacion.init();
});

$('button[type="submit"]').prop("disabled", true);

var form = document.getElementById("formAddConsecutivo");
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
