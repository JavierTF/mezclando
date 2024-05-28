'use strict';
     
const CreateAfectation = function () {
    const form = $("#form_paso_incidencia");

    const initInputs= function () {};
    
    const initEvent = function () {

        $('#id_observacionesactual').on('change', function () {
            if ($('#id_observacionesactual').val() != '') {
                hiden_error_message($('#id_observacionesactual'));
            } else {
                show_error_message($('#id_observacionesactual'), 'Este campo es requerido');
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
                        title: '¡La incidencia ha sido pasada a afectaciones satisfactoriamente!',
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
        var closestElement = element.closest('.input-content')[0];
        if (closestElement) {
            var x = closestElement.querySelector('small');
            if (x) {
                x.innerHTML = '';
            }
        }
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
    CreateAfectation.init();
    
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
