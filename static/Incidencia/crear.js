'use strict';
     
const CreateIncidencia = function () {
    const form = $("#form_crear_incidencias");

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
                hiden_error_message($('#id_hora'));
                hiden_error_message($('#id_fecha_recepcion'));
                let picker=new Date($('#id_fecha_recepcion').val())
                let ahora=$('#id_hora').val()
                let hora=ahora[0]+ahora[1]
                let antes=new Date(Date.now()).getHours()
                let mina=ahora[3]+ahora[4]
                let minb=new Date(Date.now()).getMinutes()
                let hoy=new Date(Date.now())
                if(hoy.getFullYear() == picker.getFullYear()) { 
                    if(hoy.getMonth() == picker.getMonth()) { 
                        if(hoy.getDate() == picker.getDate()+1) {   
                                
                if((antes == hora)) { 
                    if(mina > minb) { 
                    show_error_message($('#id_hora'), 'La hora de recepción no puede ser mayor que la hora actual');
                       }else{  
                        hiden_error_message($('#id_hora'));
                          }}else{  
                            if((antes < hora)) { 
                                show_error_message($('#id_hora'), 'La hora de recepción no puede ser mayor que la hora actual');
                            }else{  
                         hiden_error_message($('#id_hora'));
                                }
                       }}}}
                if(Date.now() < Date.parse($('#id_fecha_recepcion').val())) { 
                    show_error_message($('#id_fecha_recepcion'), 'La fecha de recepción no puede ser mayor que la fecha actual');
                    hiden_error_message($('#id_hora'));
                    return;
                       }else{  
                     hiden_error_message($('#id_fecha_recepcion'));
                       }
                    let a=new Date($('#id_fecha_recepcion').val())
                    let an=new Date(Date.now())
                if(an.getFullYear()-2 >= a.getFullYear()) { 
                        show_error_message($('#id_fecha_recepcion'), 'La fecha de recepción no puede ser 2 años menor que la fecha actual');
                        return;
                           }else{  
                         hiden_error_message($('#id_fecha_recepcion'));
                           }
            } else {
                show_error_message($('#id_fecha_recepcion'), 'Este campo es requerido');
            }
            
        });

        $('#id_trabajador').on('change', function () {
            if ($('#id_trabajador').val() != '') {
                hiden_error_message($('#id_trabajador'));
                if($('#id_trabajador').val() == $('#id_ejecutante').val()) { 
                    show_error_message($('#id_trabajador'), 'El trabajador que reporta la incidencia no puede ser el encargado de la misma');
                    return;
                        }else{  
                            hiden_error_message($('#id_ejecutante'));
                    hiden_error_message($('#id_trabajador'));
                        }
            } else {
                show_error_message($('#id_trabajador'), 'Este campo es requerido');
            }
        });

        

        $('#id_hora').on('change', function () {
            if ($('#id_hora').val() != '') {
    
                let picker=new Date($('#id_fecha_recepcion').val())
                let ahora=$('#id_hora').val()
                let hora=ahora[0]+ahora[1]
                let antes=new Date(Date.now()).getHours()
                let mina=ahora[3]+ahora[4]
                let minb=new Date(Date.now()).getMinutes()
                let hoy=new Date(Date.now())
                if(hoy.getFullYear() == picker.getFullYear()) { 
                    if(hoy.getMonth() == picker.getMonth()) { 
                        if(hoy.getDate() == picker.getDate()) {   
                            
                if((antes == hora)) { 
                    if(mina > minb) { 
                        
                    show_error_message($('#id_hora'), 'La hora de recepción no puede ser mayor que la hora actual');
                       }else{  
                        hiden_error_message($('#id_hora'));
                          }}else{  
                            if((antes < hora)) { 
                                show_error_message($('#id_hora'), 'La hora de recepción no puede ser mayor que la hora actual');
                            }else{  
                         hiden_error_message($('#id_hora'));
                                }
                       }}}}
            } else {
                show_error_message($('#id_hora'), 'Este campo es requerido');
            }
        });

        $('#id_descripcion').on('change', function () {
            if ($('#id_descripcion').val() != '') {
                hiden_error_message($('#id_descripcion'));
            } else {
                show_error_message($('#id_descripcion'), 'Este campo es requerido');
            }
        });

        $('#id_estado').on('change', function () {
            if ($('#id_estado').val() != '') {
                hiden_error_message($('#id_estado'));
            } else {
                show_error_message($('#id_estado'), 'Este campo es requerido');
            }
        });
        $('#id_proceso').on('change', function () {
            if ($('#id_proceso').val() != '') {
                hiden_error_message($('#id_proceso'));
            } else {
                show_error_message($('#id_proceso'), 'Este campo es requerido');
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

            if($('#id_trabajador').val() == ''){
                show_error_message($('#id_propuesto'), 'Este campo es requerido');
                return;
            }


            if($('#id_hora').val() == ''){
                show_error_message($('#id_hora'), 'Este campo es requerido');
                
                return;
            }

            if($('#id_estado').val() == ''){
                show_error_message($('#id_fechacierre'), 'Este campo es requerido');
                return;
            }
            if(Date.now() == Date.parse($('#id_fecha_recepcion').val())) { 
                let ahora=new Date($('#id_hora').val())
                    let antes=new Date(Date.now())
                if((antes.getHours >= ahora.getHours) & (antes.getMinutes >= ahora.getMinutes)) { 
                    show_error_message($('#id_hora'), 'La hora de recepción no puede ser mayor que la hora actual');
                    return;
                       }else{  
                     hiden_error_message($('#id_hora'));
                       }}
            if(Date.now() < Date.parse($('#id_fecha_recepcion').val())) { 
                show_error_message($('#id_fecha_recepcion'), 'La fecha de recepción no puede ser mayor que la fecha actual');
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

            
                            if ($('#id_hora').val() != '') {
                                let picker=new Date($('#id_fecha_recepcion').val())
                                let ahora=$('#id_hora').val()
                                let hora=ahora[0]+ahora[1]
                                let antes=new Date(Date.now()).getHours()
                                let mina=ahora[3]+ahora[4]
                                let minb=new Date(Date.now()).getMinutes()
                                let hoy=new Date(Date.now())
                                if(hoy.getFullYear() == picker.getFullYear()) { 
                                    if(hoy.getMonth() == picker.getMonth()) { 
                                        if(hoy.getDay() == picker.getDay()+1) {       
                                if((antes == hora)) { 
                                    if(mina > minb) { 
                                    show_error_message($('#id_hora'), 'La hora de recepción no puede ser mayor que la hora actual');
                                       }else{  
                                        hiden_error_message($('#id_hora'));
                                          }}else{  
                                            if((antes < hora)) { 
                                                show_error_message($('#id_hora'), 'La hora de recepción no puede ser mayor que la hora actual');
                                            }else{  
                                         hiden_error_message($('#id_hora'));
                                                }
                                       }}}}
                            } else {
                                show_error_message($('#id_hora'), 'Este campo es requerido');
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
                        title: '¡La incidencia se ha creado satisfactoriamente!',
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
    CreateIncidencia.init();
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
