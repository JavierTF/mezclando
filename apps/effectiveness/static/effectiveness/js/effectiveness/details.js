'use strict';
     
const DetailsEffectiveness = function () {

    const initEvent = function () {

        $('.delete_semester').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar la evaluación del semestre para este proceso?',
              showCancelButton: true,
              confirmButtonText: 'Confirmar',
              cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.value){
                    $.ajax({
                        url: $(this).attr('model-url'),
                        type: "GET",
                        success: function (data){
                            Swal.fire(
                                'La evaluación del semestre para este proceso ha sido eliminada satisfactoriamente!', '', 'success'
                            ).then((result) => {
                                setTimeout(function() {
                                    $(location).attr('href', '');
                                }, 1250);
                            });
                        }
                    });
                }
            });
        });

    };

    return {
        init: function () {
            initEvent();
        }
    };
}();

$(document).ready(function() {
    DetailsEffectiveness.init();
});