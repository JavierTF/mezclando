'use strict';
     
const UpdateIndicator = function () {
    var list_measurers = [];
    const form = $("#form_update_indicator");

    const initInputs= function () {
        $.ajax({
            url: get_list_measurers_path,
            data: {'indicator_id': indicator_id},
            dataType: 'json',
            success: function(data){
                for(var i = 0; i < data.results.length; i++){
                    list_measurers.push(data.results[i]);
                }
            }
        });
    };

    const initEvent = function () {

        $('#id_name').on('change', function () {
            if ($('#id_name').val() != '') {
                hiden_error_message($('#id_name'));
            } else {
                show_error_message($('#id_name'), 'Este campo es requerido');
            }
        });

        $('#add_measurer').on('click', function () {
            if ($('#id_measurer-name').val() == ''){
                show_error_message($('#id_measurer-name'), 'Este campo es requerido');
                return;
            }
            if ($('#id_measurer-qualification').val() == ''){
                show_error_message($('#id_measurer-qualification'), 'Este campo es requerido');
                return;
            }
            const name = $('#id_measurer-name');
            const qualification = $('#id_measurer-qualification');

            addMeasurer({"name": name.val(), "qualification": qualification.val()});

            var html = '<tr>';
            html += '<td>' + (list_measurers.length) + '</td><td>' + name.val() + '</td><td>' + qualification.val() + '</td><td><a class="btn btn-sm btn-default" onclick="UpdateIndicator.editMeasurer(\'' + name.val() + '\', \'' + qualification.val() + '\')"><i class="fa fa-edit"></i></a> <a class="btn btn-sm btn-default" onclick="UpdateIndicator.removeMeasurer(\'' + name.val() + '\')"><i class="fa fa-trash"></i></a></td>';
            html += '</tr>';

            $('#table-action').append(html);

            name.val('');
            hiden_error_message(name);
            qualification.val('');
            hiden_error_message(qualification);

        });

    };

    const submitForm = function () {

        $('#form_submit').click(function () {

            if($('#id_name').val() == ''){
                show_error_message($('#id_name'), 'Este campo es requerido');
                return;
            }

            var formData = new FormData(form[0]);
            for (var i = 0; i < list_measurers.length; i++){
                formData.append('measurers[]', JSON.stringify({"name": list_measurers[i].name, "qualification": list_measurers[i].qualification}));
            }

            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    Swal.fire(
                        'El Indicador se ha modificado satisfactoriamente!', '', 'success'
                    ).then((result) => {
                        setTimeout(function() {
                            $(location).attr('href', data.results.url);
                        }, 1250);
                    });
                }
            });
        });

    };

    const addMeasurer = function (measurer) {
        list_measurers.push(measurer);
    };

    const editMeasurer = function (elem, name, qualification) {
        const x = list_measurers.filter((item) => item.name != name );
        list_measurers = x;

        var tr = elem.parentNode.closest('tr');
        tr.remove();

        $('#id_measurer-name').val(name);
        $('#id_measurer-qualification').val(qualification);
    };

    const removeMeasurer = function (elem, index) {
        const x = list_measurers.filter((item) => item.name != index );
        list_measurers = x;

        var tr = elem.parentNode.closest('tr');
        tr.remove();
    };

    const show_error_message = function (element, message) {
        var x = element.closest('.input-content')[0].querySelector('small');
        x.innerHTML = message;
    };

    const hiden_error_message = function (element) {
        var x = element.closest('.input-content')[0].querySelector('small');
        x.innerHTML = '';
    };

    return {
        init: function () {
            initInputs();
            initEvent();
            submitForm();
        },
        editMeasurer: function (name, qualification) {
          editMeasurer(event.target, name, qualification);
        },
        removeMeasurer: function (index) {
          removeMeasurer(event.target, index);
        }
    };
}();

$(document).ready(function() {
    UpdateIndicator.init();
});