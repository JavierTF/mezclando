'use strict';
     
const Eliminatefectation = function () {
    const form = $("#form_eliminate_afectation");


    const submitForm = function () {

        $('#form_eliminate_afectation').click(function () {

           
            var formData = new FormData(form[0]);
            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    Swal.fire({
                        title: '¡La afectación  ha sido eliminada satisfactoriamente!',
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
            submitForm();
        }
    };
}();

$(document).ready(function() {
    Eliminatefectation.init();
});


var form = document.getElementById("form_eliminate_afectation");
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
        window.location.replace(listarAfectacion);
    },
    error: function (xhr, desc, err)
    {
        if (response.result == 'error'){
            Toast.fire({
                type: 'error',
                title: response.message,
            });
        }      
             
    },
    always: function (response){
        
        if (response.result == 'success'){
            window.location.replace(listarAfectacion);
        }
        
    }
});
