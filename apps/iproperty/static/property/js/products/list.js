'use strict';

const ListProducts = function () {

    const initEvent = function () {

        $('.delete_product').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar la Clasificación de productos y servicios?',
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
                                'La Clasificación de productos y servicios ha sido eliminado satisfactoriamente!', '', 'success'
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
    ListProducts.init();
});