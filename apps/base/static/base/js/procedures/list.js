'use strict';

const ListProcedures = function () {

    const initInput = function () {
        $('input[name="export_date"]').daterangepicker({
             singleDatePicker: true,
            startDate: moment(),
            endDate: moment().endOf('year'),
            maxYear: moment().year(),
            locale: {
                format: 'DD-MM-Y',
                separator: ' | ',
                applyLabel: 'Aplicar',
                cancelLabel: 'Cancelar',
                weekLabel: 'W',
                customRangeLabel: 'Personalizado',
                daysOfWeek: moment.weekdaysMin(),
                monthNames: moment.monthsShort()
            }
        });
    };

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
//            dom: 'Bfrtip',
//            buttons: [
//                {
//                    extend: 'print',
//                    text: 'Imprimir'
//                }, {
//                    extend: 'excel',
//                    text: 'EXCEL'
//                }, {
//                    extend: 'pdf',
//                    text: 'PDF'
//                },
//            ]
        });
    };

    const initEvent = function () {

        $('.delete_procedure').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar el Procedimiento?',
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
                                'El Procedimiento ha sido eliminado satisfactoriamente!', '', 'success'
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
            initInput();
            initTable();
            initEvent();
        }
    };
}();

$(document).ready(function() {
    ListProcedures.init();
});