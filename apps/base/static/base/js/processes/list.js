'use strict';

const ListProcesses = function () {

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
            ordering: false,
            fixedHeader: true,
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
        // const count= $('#example2 thead tr:eq(0) th').length;
        //
        // var table = $("#example2").DataTable({
        //     "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]],
        //     orderCellsTop: false,
        //     fixedHeader: true,
        //     "aoColumnDefs":[{
        //        "bSortable":false,
        //        "aTargets": [count-1],
        //        /*"width": 200,
        //        "targets": 0*/
        //     }],
        //     language: {
        //         "decimal": "",
        //         "emptyTable": "No hay información",
        //         "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        //         "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
        //         "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        //         "infoPostFix": "",
        //         "thousands": ",",
        //         "lengthMenu": "Mostrar _MENU_ Entradas",
        //         "loadingRecords": "Cargando...",
        //         "processing": "Procesando...",
        //         "search": "Buscar:",
        //         "zeroRecords": "Sin resultados encontrados",
        //         "paginate": {
        //             "first": "Primero",
        //             "last": "Último",
        //             "next": "Siguiente",
        //             "previous": "Anterior"
        //         }
        //     },
        //     "search": {
        //         "caseInsensitive": true
        //     },
        // });

        // $('#example2 tbody').on('click', 'tr', function () {
        //     if ($(this).hasClass('selected')) {
        //         $(this).removeClass('selected');
        //     } else {
        //         table.$('tr.selected').removeClass('selected');
        //         $(this).addClass('selected');
        //     }
        // });

        // $('#example2 thead tr').clone(true).appendTo( '#example2 thead' );

        //table.columns.adjust().draw();

        // $('#example2 thead tr:eq(1) th').each( function (i) {
        //     var title = $(this).text(); //es el nombre de la columna
        //     $(this).unbind('click');
        //     $(this).removeAttr('aria-label aria-sort');
        //     $(this).removeClass('sorting_asc sorting_desc sorting');
        //
        //     if (!title.includes("Número")){
        //         $(this).html( '<input type="text" placeholder="Buscar..." class="form-control"/>' );
        //         $( 'input', this ).on( 'keyup change', function () {
        //             if ( table.column(i).search() !== this.value ) {
        //                 table
        //                     .column(i)
        //                     .search( this.value )
        //                     .draw();
        //             }
        //         });
        //     }
        //     else {
        //         $(this).html('');
        //     }
        //
        //     if (title.includes("Activo")){
        //         sele = '<select class="custom-select form-select form-select-sm">'
        //         sele += '<option value="" selected>Todos</option>'
        //         sele += '<option value="true">Activados</option>'
        //         sele += '<option value="False">Desactivados</option>'
        //         sele += '</select>'
        //         $(this).html( sele );
        //         $( 'select', this ).on( 'change', function () {
        //             if ( table.column(i).search() !== this.value ) {
        //                 table
        //                     .column(i)
        //                     .search( this.value )
        //                     .draw();
        //             }
        //         });
        //     }
        // });
    };

    const initEvent = function () {

        $('.delete_process').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar el Proceso?',
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
                                'El Proceso ha sido eliminado satisfactoriamente!', '', 'success'
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
    ListProcesses.init();
});