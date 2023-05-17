'use strict';
     
const ListLicenses = function () {

    const initTable = function () {
        $('#example2').DataTable( {
            "lengthMenu": [[-1, 10, 25, 50, 100], ["Todos", 10, 25, 50, 100]],
            "columnDefs":[{targets:0, visible:false}],
            ordering: false,
            fixedHeader: true,
            rowGroup: {
                startRender: function ( rows, group ) {
                    return group +' ('+rows.count()+')';
                },
                dataSrc: 0
            },
            language: {
                "decimal": "",
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },
            "search": {
                "caseInsensitive": true
            },
        });
    };

    const initEvent = function () {

        $('.delete_licenses').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar la licencia?',
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
                                'La licencia se ha eliminado satisfactoriamente!', '', 'success'
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
            initTable();
            initEvent();
        }
    };
}();

$(document).ready(function() {
    ListLicenses.init();
});