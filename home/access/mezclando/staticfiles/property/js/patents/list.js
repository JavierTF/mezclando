'use strict';

const ListPatent = function () {

    const initEvent = function () {

        $('#example1').on('click', 'a.delete_patent', function () {
            Swal.fire({
              title: '¿Seguro desea eliminar la Clasifiación de patente?',
              showCancelButton: true,
              confirmButtonText: 'Confirmar',
              cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.value){
                    $.ajax({
                        url: $(this).attr('model-url'),
                        type: "GET",
                        success: function (data){
                            Swal.fire({
                                title: '¡La Clasificación de patente ha sido eliminada satisfactoriamente!',
                                type: 'success',
                                timer: 2000,
                                showConfirmButton: false
                            }).then((result) => {
                                $(location).attr('href', '');
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
    ListPatent.init();
});