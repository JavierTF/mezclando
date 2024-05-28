'use strict';

const ListTypeLegalDocument = function () {

    const initEvent = function () {

        $('#example1').on('click', 'a.delete_typelegaldocument', function () {
            Swal.fire({
              title: '¿Seguro desea eliminar el Tipo de documento legal?',
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
                                title: '¡El Tipo de documento legal ha sido eliminado satisfactoriamente!',
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
    ListTypeLegalDocument.init();
});