'use strict';

const ListInditarors = function () {

    const initEvent = function () {

        $('.delete_indicator').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar el Indicador?',
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
                                'El Indicador ha sido eliminado satisfactoriamente!', '', 'success'
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
    ListInditarors.init();
});