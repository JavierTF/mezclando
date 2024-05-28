'use strict';

const ListEmployees = function () {

    const initInput = function () {};

    const initEvent = function () {

        $('#example1').on('click', 'a.delete_employee', function () {
            Swal.fire({
              title: '¿Seguro desea eliminar el Trabajador?',
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
                                title: '¡El Trabajador ha sido eliminado satisfactoriamente!',
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

        $('#example1').on('search.dt', function() {
            var value = $('.dataTables_filter input').val();
            $('form input[name="search"]').val(value);
            console.log($('form input[name="search"]').val());
        });

    };

    return {
        init: function () {
            initInput();
            initEvent();
        }
    };
}();

$(document).ready(function() {
    ListEmployees.init();
});