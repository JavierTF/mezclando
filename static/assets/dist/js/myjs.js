// Para llenar los campos del modal a la hora de editar
function toModal(pdesc, pabbr)
{
    $('#id_descripcion').prop('value', pdesc);
    $('#id_abreviatura').prop('value', pabbr);
}

// Para limpiar los campos despues de editar
function Clear()
{
    $('#id_descripcion').prop('value','');
    $('#id_abreviatura').prop('value','');
}

// Toggle form action to edit
function ChangeActionToEdit(pid,entity_path)
{
  $('.form-modal').attr('action','/'+entity_path+'/edit/'+pid+'/');
}
// Toggle form action to create
function ChangeActionToCreate(entity_path)
{
  $('.form-modal').attr('action','/'+entity_path+'/create');
}
// Toggle form action to delete
function ChangeActionToDelete(pid,entity_path)
{
  $('.button-delete').attr('href','/'+entity_path+'/delete/'+pid+'/');
}

function ChangeModalTitle(title)
{
  $('#exampleModalLabel').text(title); // Ej: 'Crear categoría profesional'
  $('#label1').text(title); // Ej: 'Crear categoría profesional'
}

//Insertar texto en el modal del delete
function ConfirmDelete(pdesc,entity_name)
    {
        var bold_tag = document.createElement("b");
        var textnode = document.createTextNode(pdesc);
        bold_tag.appendChild(textnode);
        $('div.modal-delete-body').text('¿Está seguro que desea eliminar la información de el/la '+entity_name+': ')
        .append(bold_tag).append('?');
    }

//Poner foco al campo descripcion
function Foco()
    {
        $('.descripcion-field').focus();
    }

//validaciones
function validate_campos_vacios(node){
 if (node.val() == "")
        {
            node.addClass('is-invalid');
            $('.invalid-feedback').text("Por favor, no deje el campo vacío.").show();
            $('button[type="submit"]').prop("disabled","true");
            return false;

        }
        else
            {
                node.removeClass('is-invalid').addClass('is-valid');
                $('button[type="submit"]').removeAttr("disabled");
            }

    }
function validate_only_text(node, event) {

    if ((event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) ||
        event.charCode == 225 || event.charCode == 44 || event.charCode == 233  || event.charCode == 237 || event.charCode == 243 || event.charCode == 250|| event.charCode == 209 || event.charCode == 241 || event.charCode == 32 || event.charCode == 13) { // 13-> 'Enter' 32-> ' '
        node.removeClass('is-invalid').addClass('is-valid');
        node[0].nextElementSibling.textContent = "";
        $('button[type="submit"]').removeAttr("disabled");
    } else {
        event.preventDefault();
        node.addClass('is-invalid');
        console.log(node);
        node[0].nextElementSibling.textContent = "Este campo solo acepta letras";

        $('button[type="submit"]').prop("disabled", "true");
    }
}

function validate_only_number_and_text(node, event) {

    if ((event.charCode >= 48 && event.charCode <= 57) || (event.charCode >= 97 && event.charCode <= 122) ||
        event.charCode == 225 || event.charCode == 44 || event.charCode == 233  || event.charCode == 237 || event.charCode == 243 || event.charCode == 250|| event.charCode == 209 || event.charCode == 241 || event.charCode == 32 || event.charCode == 13) { // 13-> 'Enter' 32-> ' '
        node.removeClass('is-invalid').addClass('is-valid');
        node[0].nextElementSibling.textContent = "";
        $('button[type="submit"]').removeAttr("disabled");
    } else
    {
        event.preventDefault();
        node.addClass('is-invalid');
        console.log(node);
        node[0].nextElementSibling.textContent = "Este campo solo acepta letras y números";

        $('button[type="submit"]').prop("disabled","true");
    }


}
function validate_only_number(node, event) {

    if ((event.charCode >= 48 && event.charCode <= 57))  { // 13-> 'Enter' 32-> ' '
        node.removeClass('is-invalid').addClass('is-valid');
        node[0].nextElementSibling.textContent = "";
        $('button[type="submit"]').removeAttr("disabled");
    } else
    {
        event.preventDefault();
        node.addClass('is-invalid');
        console.log(node);
        node[0].nextElementSibling.textContent = "Este campo solo acepta números";

        $('button[type="submit"]').prop("disabled","true");
    }


}
function validate_only_number_and_text_and_guion(node, event) {

    if ((event.charCode >= 48 && event.charCode <= 57) || (event.charCode >= 65 && event.charCode <= 90) || (event.charCode >= 97 && event.charCode <= 122) ||
        event.charCode == 45 ||event.charCode == 225 || event.charCode == 44 || event.charCode == 233  || event.charCode == 237 || event.charCode == 243 || event.charCode == 250|| event.charCode == 209 || event.charCode == 241 || event.charCode == 32 || event.charCode == 13) { // 13-> 'Enter' 32-> ' '
        node.removeClass('is-invalid').addClass('is-valid');
        node[0].nextElementSibling.textContent = "";
        $('button[type="submit"]').removeAttr("disabled");
    } else
    {
        event.preventDefault();
        node.addClass('is-invalid');
        console.log(node);
        node[0].nextElementSibling.textContent = "Este campo solo acepta letras y números";

        $('button[type="submit"]').prop("disabled","true");
    }


}