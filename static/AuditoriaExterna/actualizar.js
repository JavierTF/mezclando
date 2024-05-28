'use strict';
     
const ModAudEXt = function () {
    const form = $("#form_update_ext");

    const initInputs= function () {};

    const initEvent = function () {

        $('#id_numero').on('change', function () {
            if ($('#id_numero').val() != '') {
                hiden_error_message($('#id_numero'));
            } else {
                show_error_message($('#id_numero'), 'Este campo es requerido');
            }
        });

        $('#id_resultados').on('change', function () {
            if ($('#id_resultados').val() != '') {
                hiden_error_message($('#id_resultados'));
            } else {
                show_error_message($('#id_resultados'), 'Este campo es requerido');
            }
        });

        $('#id_plan_medidas').on('change', function () {
            if ($('#id_plan_medidas').val() != '') {
                hiden_error_message($('#id_plan_medidas'));
            } else {
                show_error_message($('#id_plan_medidas'), 'Este campo es requerido');
            }
        });

        $('#id_observaciones').on('change', function () {
            if ($('#id_observaciones').val() != '') {
                hiden_error_message($('#id_observaciones'));
            } else {
                show_error_message($('#id_observaciones'), 'Este campo es requerido');
            }
        });


        $('#id_informe').on('change', function () {
            if ($('#id_informe').val() != '') {
                hiden_error_message($('#id_informe'));
            } else {
                show_error_message($('#id_informe'), 'Este campo es requerido');
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
    } else {
        show_error_message($('#id_informe'), 'Este campo es requerido');
    } 
    });

    $('#id_plan_medidas').on('change', function () {
        if ($('#id_plan_medidas').val() != '') {
    var fileInput = $('#id_plan_medidas');
    var filePath = fileInput.val();
    var allowedExtensions = /(.jpg|.jpeg|.png|.pdf|.docx|.doc)$/i;
    if(!allowedExtensions.exec(filePath)){
        show_error_message($('#id_plan_medidas'), 'El archivo debe ser una Imágen, un PDF o un Word');
        fileInput.value = '';
        return;
    }else{
        hiden_error_message($('#id_plan_medidas'));
    }
} else {
    show_error_message($('#id_plan_medidas'), 'Este campo es requerido');
} 
});

$('#id_fechainicio').on('change', function () {
    if ($('#id_fechainicio').val() != '') {
        hiden_error_message($('#id_fechainicio'));
        if(Date.now() < Date.parse($('#id_fechainicio').val())) { 
            show_error_message($('#id_fechainicio'), 'La fecha de inicio de la auditoría no puede ser mayor que la fecha actual');
            return;
               }else{  
             hiden_error_message($('#id_fechainicio'));
               }
    } else {
        show_error_message($('#id_fechainicio'), 'Este campo es requerido');
    }
});

$('#id_fechafin').on('change', function () {
    if ($('#id_fechafin').val() != '') {
        hiden_error_message($('#id_fechafin'));

        if(Date.now() > Date.parse($('#id_fechafin').val())) { 
            show_error_message($('#id_fechafin'), 'La fecha de fin de la auditoría no puede ser menor que la fecha actual');
            return;
               }else{  
             hiden_error_message($('#id_fechafin'));
               }
    } else {
        show_error_message($('#id_fechafin'), 'Este campo es requerido');
    }
});

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_resultados').val() == ''){
                show_error_message($('#id_resultados'), 'Este campo es requerido');
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


            if($('#id_observaciones').val() == ''){
                show_error_message($('#id_observaciones'), 'Este campo es requerido');
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

            
            if ($('#id_plan_medidas').val() != '') {
                var fileInput = $('#id_plan_medidas');
                var filePath = fileInput.val();
                var allowedExtensions = /(.jpg|.jpeg|.png|.pdf|.docx|.doc)$/i;
                if(!allowedExtensions.exec(filePath)){
                    show_error_message($('#id_plan_medidas'), 'El archivo debe ser una Imágen, un PDF o un Word');
                    fileInput.value = '';
                    return;
                }else{
                    hiden_error_message($('#id_plan_medidas'));
                }
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
                        title: '¡La Auditoría se ha modificado satisfactoriamente!',
                        type: 'success',
                        timer: 500,
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
    ModAudEXt.init();
});

$('button[type="submit"]').prop("disabled", true);

var form = document.getElementById("form_update_ext");
var form_data = new FormData(form);

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
        window.location.replace(listar_auditoriaexterna);
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