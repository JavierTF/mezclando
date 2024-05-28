'use strict';
     
const CrearAudInt = function () {
    const form = $("#form_crear_auditoriaInt");

    const initInputs= function () {};

    const initEvent = function () {

        $('#id_numero').on('change', function () {
            if ($('#id_numero').val() != '') {
                hiden_error_message($('#id_numero'));
            } else {
                show_error_message($('#id_numero'), 'Este campo es requerido');
            }
        });

        $('#id_titulo').on('change', function () {
            if ($('#id_titulo').val() != '') {
                hiden_error_message($('#id_titulo'));
            } else {
                show_error_message($('#id_titulo'), 'Este campo es requerido');
            }
        });

        $('#id_fecha').on('change', function () {
            if ($('#id_fecha').val() != '') {
                hiden_error_message($('#id_fecha'));
            } else {
                show_error_message($('#id_fecha'), 'Este campo es requerido');
            }
        });

        $('#id_responsable').on('change', function () {
            if ($('#id_responsable').val() != '') {
                hiden_error_message($('#id_responsable'));
            } else {
                show_error_message($('#id_responsable'), 'Este campo es requerido');
            }
        });

        $('#id_proceso').on('change', function () {
            if ($('#id_proceso').val() != '') {
                hiden_error_message($('#id_proceso'));
            } else {
                show_error_message($('#id_proceso'), 'Este campo es requerido');
            }
        });

        $('#id_objetivos').on('change', function () {
            if ($('#id_objetivos').val() != '') {
                hiden_error_message($('#id_objetivos'));
            } else {
                show_error_message($('#id_objetivos'), 'Este campo es requerido');
            }
        });

        $('#id_alcance').on('change', function () {
            if ($('#id_alcance').val() != '') {
                hiden_error_message($('#id_alcance'));
            } else {
                show_error_message($('#id_observacionesactual'), 'Este campo es requerido');
            }
        });

        $('#id_observaciones').on('change', function () {
            if ($('#id_observaciones').val() != '') {
                hiden_error_message($('#id_observaciones'));
            } else {
                show_error_message($('#id_observaciones'), 'Este campo es requerido');
            }
        });

        $('#id_criterios').on('change', function () {
            if ($('#id_criterios').val() != '') {
                hiden_error_message($('#id_criterios'));
            } else {
                show_error_message($('#id_criterios'), 'Este campo es requerido');
            }
        });

        $('#id_informe').on('change', function () {
            if ($('#id_informe').val() != '') {
                hiden_error_message($('#id_informe'));
            } else {
                show_error_message($('#id_informe'), 'Este campo es requerido');
            }
        });

        $('#id_fechainicio').on('change', function () {
            if ($('#id_fechainicio').val() != '') {
                hiden_error_message($('#id_fechainicio'));
                let ahora=new Date($('#id_fechainicio').val())
                let antes=new Date(Date.now())
                if(antes.getFullYear()-2 >= ahora.getFullYear()) { 
                    show_error_message($('#id_fechainicio'), 'La fecha de recepción no puede ser 2 años menor que la fecha actual');
                    return;
                       }else{  
                     hiden_error_message($('#id_fechainicio'));
                     if(Date.parse($('#id_fechainicio').val()) > Date.parse($('#id_fechafin').val())) { 
                        show_error_message($('#id_fechafin'), 'La fecha de inicio no puede ser menor que la fecha de fin');
                        return;
                           }else{  
                         hiden_error_message($('#id_fechafin'));
                         hiden_error_message($('#id_fechainicio'));
                           }
                       }
                
            } else {
                show_error_message($('#id_fechainicio'), 'Este campo es requerido');
            }
        });
        

        $('#id_fechafin').on('change', function () {
            if ($('#id_fechafin').val() != '') {
                
                hiden_error_message($('#id_fechafin'));
                
                let ahora=new Date($('#id_fechafin').val())
                let antes=new Date(Date.now())
                if(antes.getFullYear()+2 <= ahora.getFullYear()) { 
                    show_error_message($('#id_fechafin'), 'La fecha de fin no puede ser 2 años mayor que la fecha actual');
                  
                       }else{  
                     hiden_error_message($('#id_fechafin'));
                     if(Date.parse($('#id_fechainicio').val()) > Date.parse($('#id_fechafin').val())) { 
                        show_error_message($('#id_fechafin'), 'La fecha de fin de la auditoría no puede ser menor que la fecha de inicio');
                      
                           }else{  
                         hiden_error_message($('#id_fechafin'));
                         hiden_error_message($('#id_fechainicio'));
                           }
                       }
                
            } else {
                show_error_message($('#id_fechafin'), 'Este campo es requerido');
            }
        });
        $('#id_informe').on('change', function () {
            if ($('#id_informe').val() != '') {
        var fileInput = $('#id_informe');
        var filePath = fileInput.val();
        var allowedExtensions = /(.jpg|.jpeg|.png|.pdf|.docx|.doc)$/i;
        if(!allowedExtensions.exec(filePath)){
            show_error_message($('#id_informe'), 'El archivo debe ser una Imágen, un PDF o un Word');
            fileInput.value = '';
            return;
        }else{
            hiden_error_message($('#id_informe'));
        }
    } 
    });

    };
    

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_numero').val() == ''){
                show_error_message($('#id_numero'), 'Este campo es requerido');
                return;
            }

            if($('#id_titulo').val() == ''){
                show_error_message($('#id_titulo'), 'Este campo es requerido');
                return;
            }

            if($('#id_fechainicio').val() == ''){
                show_error_message($('#id_fechainicio'), 'Este campo es requerido');
                return;
            }

            if($('#id_fechafin').val() == ''){
                show_error_message($('#id_fechafin'), 'Este campo es requerido');
                return;
            }
            if ($('#id_informe').val() != '') {
                var fileInput = $('#id_informe');
                var filePath = fileInput.val();
                var allowedExtensions = /(.jpg|.jpeg|.png|.pdf|.docx|.doc)$/i;
                if(!allowedExtensions.exec(filePath)){
                    show_error_message($('#id_informe'), 'El archivo debe ser una Imágen, un PDF o un Word');
                    fileInput.value = '';
                    return;
                }else{
                    hiden_error_message($('#id_informe'));
                }
            }

            if($('#id_responsable').val() == ''){
                show_error_message($('#id_responsable'), 'Este campo es requerido');
                return;
            }
          
              
            

            if($('#id_proceso').val() == ''){
                show_error_message($('#id_proceso'), 'Este campo es requerido');
                return;
            }


            if($('#id_fechafin').val() == ''){
                show_error_message($('#id_fechafin'), 'Este campo es requerido');
                return;
            }

            if($('#id_fechainicio').val() == ''){
                show_error_message($('#id_fechainicio'), 'Este campo es requerido');
                return;
            }
            let ahora=new Date($('#id_fechafin').val())
            let antes=new Date(Date.now())
            if(antes.getFullYear()+2 <= ahora.getFullYear()) { 
                show_error_message($('#id_fechafin'), 'La fecha de fin no puede ser 2 años mayor que la fecha actual');
                return;
                   }else{  
                 hiden_error_message($('#id_fechafin'));
                   }
            if(Date.parse($('#id_fechainicio').val()) > Date.parse($('#id_fechafin').val())) { 
                show_error_message($('#id_fechafin'), 'La fecha de fin de la auditoría no puede ser menor que la fecha de inicio');
                return;
                   }else{  
                 hiden_error_message($('#id_fechafin'));
                 hiden_error_message($('#id_fechainicio'));
                   }


                let presente=new Date($('#id_fechainicio').val())
                let pasado=new Date(Date.now())
                   if(pasado.getFullYear()-2 >= presente.getFullYear()) { 
                       show_error_message($('#id_fechainicio'), 'La fecha de inicio no puede ser 2 años menor que la fecha actual');
                       return;
                          }else{  
                        hiden_error_message($('#id_fechainicio'));
                          }
                   if(Date.parse($('#id_fechainicio').val()) > Date.parse($('#id_fechafin').val())) { 
                       show_error_message($('#id_fechainicio'), 'La fecha de inicio de la auditoría no puede ser mayor que la fecha de fin');
                       return;
                          }else{  
                            hiden_error_message($('#id_fechafin'));
                        hiden_error_message($('#id_fechainicio'));
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
                        title: '¡La Auditoría se ha creado satisfactoriamente!',
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
    CrearAudInt.init();
});

$('button[type="submit"]').prop("disabled", true);

var form = document.getElementById("form_crear_auditoriaInt");
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
        window.location.replace(listar_auditoriainterna);
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
            window.location.replace(listar_auditoriainterna);
        }
        $('button[type="submit"]').prop("disabled", false);
    }
});
