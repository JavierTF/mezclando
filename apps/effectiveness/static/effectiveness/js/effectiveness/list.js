'use strict';
     
const ListEffectiveness = function () {

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

        $('.delete_effectiveness').on('click', function () {
            Swal.fire({
              title: 'Seguro desea eliminar la evaluación para este proceso?',
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
                                'La evaluación del proceso ha sido eliminada satisfactoriamente!', '', 'success'
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
            initEvent();
        }
    };
}();

$(document).ready(function() {
    ListEffectiveness.init();
});