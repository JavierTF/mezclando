'use strict';

const ListComplaints = function () {

    function format(data) {
        var html = '<table><tr><th>No.</th><th>Acción</th><th>Fecha</th></tr>';
        for (var i = 0; i < data.actions.length; i++) {
            html += '<tr><td>' + (i + 1) + '</td><td>' + data.actions[i].action + '</td><td>' + data.actions[i].date + '</td></tr>';
        }
        html += '</table>';
        return html;
    }

    const initTable = function () {
      var table = $('#example10').DataTable({
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
      $('#example10').on('click', 'td.details-control', function () {
          var tr = $(this).closest('tr');
          var row = table.row(tr);

          if (row.child.isShown()) {
              row.child.hide();
              tr.removeClass('shown');
          } else {
            $.ajax({
                url: get_actions_path,
                data: {complaint_id: tr.data('child-value')},
                type: "GET",
                success: function (data){
                    row.child(format(data)).show();
                    tr.addClass('shown');
                }
            });
          }
      });
    };

    const initEvent = function () {

        $('.delete_complaint').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar la Queja?',
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
                                'La Queja ha sido eliminada satisfactoriamente!', '', 'success'
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
    ListComplaints.init();
});