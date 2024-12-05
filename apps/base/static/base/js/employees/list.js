'use strict';

const ListEmployees = function () {

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

    const initEvent = function () {

        $('.delete_employee').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar el Trabajador?',
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
                                title: 'El Trabajador ha sido eliminado satisfactoriamente!',
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
            initInput();
            initEvent();
        }
    };
}();

$(document).ready(function() {
    ListEmployees.init();
});