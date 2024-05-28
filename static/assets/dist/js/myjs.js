if (typeof Swal == null){
  const Toast = Swal.mixin({
    toast: true,
    position: 'bottom-right',
    iconColor: 'red',
    customClass: {
        popup: 'colored-toast'
    },
    showConfirmButton: true,
    timer: 6000,
    timerProgressBar: false
    }) 
}

if (typeof COMPARISON_TYPES == null){
  const COMPARISON_TYPES = {
    MAYOR_IGUAL: "mayor_igual",
    MENOR_IGUAL: "menor_igual",
    MAYOR: "mayor",
    MENOR: "menor",
  };
}

// Para llenar los campos del modal a la hora de editar
function toModal(pdesc, pabbr) {
  $("#id_descripcion").prop("value", pdesc);
  $("#id_abreviatura").prop("value", pabbr);
}

// Para limpiar los campos despues de editar
function Clear() {
  $("#id_descripcion").prop("value", "");
  $("#id_abreviatura").prop("value", "");
}

// Toggle form action to edit
function ChangeActionToEdit(pid, entity_path) {
  $(".form-modal").attr("action", "/" + entity_path + "/edit/" + pid + "/");
}
// Toggle form action to create
function ChangeActionToCreate(entity_path) {
  $(".form-modal").attr("action", "/" + entity_path + "/create");
}
// Toggle form action to delete
function ChangeActionToDelete(pid, entity_path) {
  $(".button-delete").attr("href", "/" + entity_path + "/delete/" + pid + "/");
}

function ChangeModalTitle(title) {
  $("#exampleModalLabel").text(title); // Ej: 'Crear categoría profesional'
  $("#label1").text(title); // Ej: 'Crear categoría profesional'
}

//Insertar texto en el modal del delete
function ConfirmDelete(pdesc, entity_name) {
  var bold_tag = document.createElement("b");
  var textnode = document.createTextNode(pdesc);
  bold_tag.appendChild(textnode);
  $("div.modal-delete-body")
    .text(
      "¿Está seguro que desea eliminar la información de el/la " +
        entity_name +
        ": "
    )
    .append(bold_tag)
    .append("?");
}

//Poner foco al campo descripcion
function Foco() {
  $(".descripcion-field").focus();
}

//validaciones
function validate_campos_vacios(node) {
  if (node.val() == "") {
    node.removeClass("is-valid").addClass("is-invalid");
    node[0].nextElementSibling.textContent = "Por favor, no deje el campo vacío";
    $(".invalid-feedback").text("Por favor, no deje el campo vacío").show();
    $('button[type="submit"]').prop("disabled", "true");
    return false;
  } else {
    node.removeClass("is-invalid").addClass("is-valid");
    node[0].nextElementSibling.textContent = null;
    $('button[type="submit"]').removeAttr("disabled");
  }
}

function validate_campos_iguales(node1, node2, nombre1, nombre2='') {
  if (node1.val() !== node2.val()) {
    node1.removeClass("is-valid").addClass("is-invalid");
    node1[0].nextElementSibling.textContent = "Los campos " + nombre1 + nombre2 + " son diferentes";
    node2.removeClass("is-valid").addClass("is-invalid");
    node2[0].nextElementSibling.textContent = "Los campos " + nombre1 + " son diferentes";
    // $(".invalid-feedback").text("Por favor, no deje el campo vacío").show();
    $('button[type="submit"]').prop("disabled", "true");
    return false;
  } else {
    node1.removeClass("is-invalid").addClass("is-valid");
    node1[0].nextElementSibling.textContent = null;
    node2.removeClass("is-invalid").addClass("is-valid");
    node2[0].nextElementSibling.textContent = null;
    $('button[type="submit"]').removeAttr("disabled");
    return true;
  }
}

function validate_regex(myregex, node, text) {
  const v = node.val();
  const regex = new RegExp(myregex);
  if (!regex.test(v)) {
    node.removeClass("is-valid").addClass("is-invalid");
    node[0].nextElementSibling.textContent = text;
    $('button[type="submit"]').prop("disabled", "true");
    return false;
  } else {
    node.removeClass("is-invalid").addClass("is-valid");
    node[0].nextElementSibling.textContent = null;
    $('button[type="submit"]').removeAttr("disabled");
  }
}

function validate_email(node, dominio) {  
  const v = node.val();  
  if (v.search("@") === -1){
    node.removeClass("is-valid").addClass("is-invalid");
    node[0].nextElementSibling.textContent = "Inserte dirección de correo válida";
    $('button[type="submit"]').prop("disabled", "true");
    return false;
  } else {
    const arr = v.split("@");
    if (arr[0] === ""){
      node.removeClass("is-valid").addClass("is-invalid");
      node[0].nextElementSibling.textContent = "Inserte nombre de correo";
      $('button[type="submit"]').prop("disabled", "true");
      return false;
    } else {
      if (arr[1] !== dominio){
        node.removeClass("is-valid").addClass("is-invalid");
        node[0].nextElementSibling.textContent = 'El dominio debe ser "@' + dominio + '"';
        $('button[type="submit"]').prop("disabled", "true");
        return false;
      } else {
        node.removeClass("is-invalid").addClass("is-valid");
        node[0].nextElementSibling.textContent = null;
        $('button[type="submit"]').removeAttr("disabled");
      }
    }
  }    
}

function validar_tareas(selector, num) {
  // Obtener el elemento select por su ID
  var selectElement = document.querySelector(selector);

  // Obtener el número de opciones dentro del select
  var numberOfOptions = selectElement.options.length;

  if (numberOfOptions <= num) {
      // Deshabilitar el botón de submit y otros campos
      $('button[type="submit"]').prop("disabled", true);
      $('#id_objetivo').prop("disabled", true);
      $('#id_nombre').prop("disabled", true);

      // Actualizar el mensaje de error
      updateErrorMessage(selectElement, "No quedan tareas sin asignar");
  }
}

// const show_error_message = function (element, message) {
//   var x = element.closest('.input-content')[0].querySelector('small');
//   x.innerHTML = message;
// };

// const hiden_error_message = function (element) {
//   var x = element.closest('.input-content')[0].querySelector('small');
//   x.innerHTML = '';
// };

function colorEstado(selector) {
  const element = document.querySelector(selector); 

  if (!element) {
      console.error(`Elemento no encontrado con el selector: ${selector}`);
      return;
  }

  const estado = element.innerHTML.toLowerCase().trim();

  const rojo = ['atrasado', 'cancelado', '1. muy mal', '2. bastante mal', '3. regular', 'incumplido', '3', '2', '1', 'pendiente'];
  const naranja = ['solicitado', 'reiniciado', 'interrumpido', '4. casi bien', 'tomado', '4', 'en proceso'];
  const verde = ['aprobado', 'en fecha', 'terminado', 'adelantado', 'excelente', '5. muy bien', 'cumplido', '5', 'cumplido'];

  if (verde.includes(estado)) {
      element.style.backgroundColor = "#4fcd4f";
  } else if (naranja.includes(estado)) {
      element.style.backgroundColor = "rgb(235, 156, 58)";
  } else if (rojo.includes(estado)) {
      element.style.backgroundColor = "#f95858";
  } else {
      console.log(`Estado no reconocido: ${estado}`);
  }
}

function validate_only_text(node, event) {
  const validCharacters = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
      'á', ',', 'é', 'í', 'ó', 'ú', ' ', '\r', '\n', '\t', 'ñ', 'Ñ',
  ];

  if (validCharacters.includes(event.key)) {
      node.removeClass("is-invalid").addClass("is-valid");
      node[0].nextElementSibling.textContent = "";
      $('button[type="submit"]').removeAttr("disabled");
  } else {
      event.preventDefault();
      node.removeClass("is-valid").addClass("is-invalid");
      node[0].nextElementSibling.textContent = "Este campo solo acepta letras";

      $('button[type="submit"]').prop("disabled", true);
  }
}

function updateErrorMessage(element, newText, invalidar=true) {
  console.log('updateErrorMessage updateErrorMessage updateErrorMessage')
  console.log('element', element)
  console.log('newText', newText)
  if (invalidar){
    element.classList.add('is-invalid');
  } else {
    element.classList.remove('is-invalid');
  }

  // Verificar si el elemento es de tipo select
  if (element.tagName.toLowerCase() === 'select') {
    // Obtener el tercer hermano después del select
    var smallSibling = element.nextElementSibling.nextElementSibling;
  } else {
    // Obtener el hermano siguiente del elemento
    var smallSibling = element.nextElementSibling;
  }

  // Verificar si existe y actualizar el texto del small
  if (smallSibling && smallSibling.tagName.toLowerCase() === 'small') {
      smallSibling.textContent = newText;
  }
  // console.log('UPDATE', element)
}


/*function submitForm(formulario) {
  console.log('first first first');
  formulario.on("submit", function (e) {
      e.preventDefault();
      var href = formulario.attr("formaction");
      var listar = formulario.attr("formsuccess");
      var data = formulario.serializeArray();

      if ($(".is-invalid").length > 0) {
          return false;
      } else {
          $('button[type="submit"]').prop("disabled", true);

          var form = document.getElementById(formulario.attr("id"));
          var form_data = new FormData(form);
          var csrf_token = $('input[name="csrfmiddlewaretoken"]').val();
          form_data.append("csrfmiddlewaretoken", csrf_token);

          $.ajax({
              url: formulario.attr("formaction"),
              type: formulario.attr("method"),
              dataType: "JSON",
              data: form_data,
              processData: false,
              contentType: false,
              success: function (data) {
                  if (data.result == "success") {
                      Swal.fire({
                          title: data.title,
                          type: data.result,
                          timer: 2000,
                          showConfirmButton: false
                      }).then((result) => {
                          $(location).attr('href', listar); 
                      });
                  } else if (data.result == "error") {
                      var element = document.querySelector(`[name="${data.field}"]`);
                      updateErrorMessage(element, data.title);
                      $('button[type="submit"]').prop("disabled", true);
                  }
              },
          });
      }
  });
}*/

function validate_only_number_and_text(node, event) {
  if (
    (event.charCode >= 48 && event.charCode <= 57) ||
    (event.charCode >= 97 && event.charCode <= 122) ||
    event.charCode == 225 ||
    event.charCode == 44 ||
    event.charCode == 233 ||
    event.charCode == 237 ||
    event.charCode == 243 ||
    event.charCode == 250 ||
    event.charCode == 209 ||
    event.charCode == 241 ||
    event.charCode == 32 ||
    event.charCode == 13
  ) {
    // 13-> 'Enter' 32-> ' '
    node.removeClass("is-invalid").addClass("is-valid");
    node[0].nextElementSibling.textContent = "";
    $('button[type="submit"]').removeAttr("disabled");
  } else {
    event.preventDefault();
    node.removeClass("is-valid").addClass("is-invalid");
    node[0].nextElementSibling.textContent =
      "Este campo solo acepta letras y números";
    $('button[type="submit"]').prop("disabled", "true");
  }
}

function validate_select(node, event) {
  if (node.val() !== null && node.val().length > 0 && node.val() != '') {
    node.removeClass("is-invalid").addClass("is-valid");
    node[0].nextElementSibling.nextElementSibling.textContent = ""; 
    $('button[type="submit"]').removeAttr("disabled");
  } else {
    event.preventDefault();
    node.removeClass("is-valid").addClass("is-invalid");
    node[0].nextElementSibling.nextElementSibling.textContent = "Por favor, no deje el campo vacío";
    $('button[type="submit"]').prop("disabled", "true");
  }
}

function validate_cantidad_elementos(node, event) {
  if (node.val().length > 0 || node.val().length <= 6) {
    node.removeClass("is-invalid").addClass("is-valid");
    $('button[type="submit"]').removeAttr("disabled");
  } else {
    event.preventDefault();
    node.removeClass("is-valid").addClass("is-invalid");
    Toast.fire({
      type: 'error',
      title: "No puede haber más de 6 elementos en " + node[0]["name"],
    });
    $('button[type="submit"]').prop("disabled", "true");
  }
}

function validate_only_number(node, event) {
  if (event.charCode >= 48 && event.charCode <= 57) {
    // 13-> 'Enter' 32-> ' '
    node.removeClass("is-invalid").addClass("is-valid");
    node[0].nextElementSibling.textContent = "";
    $('button[type="submit"]').removeAttr("disabled");
  } else {
    event.preventDefault();
    node.removeClass("is-valid").addClass("is-invalid");
    node[0].nextElementSibling.textContent = "Este campo solo acepta números";
    $('button[type="submit"]').prop("disabled", "true");
  }
}

/*function validar_comparar_fechas(v1, v2 = "", tipo = "mayor", node, dia = "hoy") {  
  // console.log('ENTRE A VALIDAR FECHAS')
  var d = new Date(v1.value.replace(/-/g, ","));
  d1 = d.toLocaleString('en-CA').slice(0, 10);
  if (!v2.value) {
    var d3 = new Date(Date.now());
    d2 = d3.toLocaleString('en-CA').slice(0, 10);
  } else {
    d2 = new Date(v2.value.replace(/-/g, ","));
    var d2 = d2.toLocaleString('en-CA').slice(0, 10);
  }

  switch (tipo) {
    case "mayor_igual":
      if (d1 < d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");

        if (!v2) {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser mayor o igual que " + dia,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser mayor o igual que ${dia}`);

          // node[0].nextElementSibling.textContent = v1.name + " debe ser mayor o igual que " + dia;
        } else {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser mayor o igual que " + v2.name,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser mayor o igual que ${v2.name}`);
          // node[0].nextElementSibling.textContent = v1.name + " debe ser mayor o igual que " + v2.name;
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        updateErrorMessage(v1, "", false);
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor_igual":
      if (d1 > d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");
        console.log('V1 1', v1)

        if (!v2) {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser menor o igual que " + dia,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser menor o igual que ${dia}`);
          // node[0].nextElementSibling.textContent = v1.name + " debe ser menor o igual que " + dia;
        } else {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser menor o igual que " + v2.name,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser menor o igual que ${v2.name}`);
          // node[0].nextElementSibling.textContent = v1.name + " debe ser menor o igual que " + v2.name;
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        updateErrorMessage(v1, "", false);
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "mayor":
      if (d1 <= d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");
        if (!v2) {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser mayor que " + dia,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser mayor que ${dia}`);
          // node[0].nextElementSibling.textContent = v1.name + " debe ser mayor que " + dia;
        } else {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser mayor que " + v2.name,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser mayor que ${v2.name}`);

          // node[0].nextElementSibling.textContent = v1.name + " debe ser mayor que " + v2.name;
        }
        $('button[type="submit"]').prop("disabled", "true");
        return flag;
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        updateErrorMessage(v1, "", false);
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor":
      if (d1 >= d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");
        if (!v2) {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser menor que " + dia,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser menor que ${dia}`);

          // node[0].nextElementSibling.textContent = v1.name + " debe ser menor que " + dia;
        } else {
          // Toast.fire({
          //   type: 'error',
          //   title: v1.name + " debe ser menor que " + v2.name,
          // });
          updateErrorMessage(v1, `${v1.name} debe ser menor que ${v2.name}`);

          // node[0].nextElementSibling.textContent = v1.name + " debe ser menor que " + v2.name;
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        updateErrorMessage(v1, "", false);
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    default:
      break;
  }
}*/



function updateValidationState(element, isValid, errorMessage = "") {
  if (isValid) {
    element.classList.remove("is-invalid");
    element.classList.add("is-valid");
    updateErrorMessage(element, "", false);
    $('button[type="submit"]').prop("disabled", false);
  } else {
    element.classList.remove("is-valid");
    element.classList.add("is-invalid");
    updateErrorMessage(element, errorMessage);
    $('button[type="submit"]').prop("disabled", true);
  }
}

function validar_comparar_fechas(v1, v2 = "", tipo = "mayor", node, dia = "hoy") {
  const COMPARISON_TYPES = {
    MAYOR_IGUAL: "mayor_igual",
    MENOR_IGUAL: "menor_igual",
    MAYOR: "mayor",
    MENOR: "menor",
  };

  const d1 = new Date(v1.value.replace(/-/g, ","));
  const d2 = v2.value ? new Date(v2.value.replace(/-/g, ",")) : new Date();

  switch (tipo) {
    case COMPARISON_TYPES.MAYOR_IGUAL:
      updateValidationState(
        v1,
        d1 >= d2,
        v2 ? `${v1.name} debe ser mayor o igual que ${v2.name}` : `${v1.name} debe ser mayor o igual que ${dia}`
      );
      break;
    case COMPARISON_TYPES.MENOR_IGUAL:
      updateValidationState(
        v1,
        d1 <= d2,
        v2 ? `${v1.name} debe ser menor o igual que ${v2.name}` : `${v1.name} debe ser menor o igual que ${dia}`
      );
      break;
    case COMPARISON_TYPES.MAYOR:
      updateValidationState(
        v1,
        d1 > d2,
        v2 ? `${v1.name} debe ser mayor que ${v2.name}` : `${v1.name} debe ser mayor que ${dia}`
      );
      break;
    case COMPARISON_TYPES.MENOR:
      updateValidationState(
        v1,
        d1 < d2,
        v2 ? `${v1.name} debe ser menor que ${v2.name}` : `${v1.name} debe ser menor que ${dia}`
      );
      break;
    default:
      break;
  }
}

function validar_comparar_valores(v1, v2, tipo) {
  switch (tipo) {
    case "mayor_igual":
      if (v1 < v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2,
          });
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor_igual":
      if (v1 > v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2,
          });
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "mayor":
      if (v1 <= v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2,
          });
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor":
      if (v1 >= v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2,
          });
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    default:
      break;
  }
}

function validar_existencia_ambos(v1, v2) {
  var flag;
  if (!v1.value && v2.value) {
    v1.classList.remove("is-valid");
    v1.classList.add("is-invalid");
    Toast.fire({
      type: 'error',
      title: "Debe llenar el campo " + v1.name + ", porque " + v2.name + " tiene valor",
    });
    //v1.nextElementSibling.textContent = "Debe llenar el campo " + v1.name + ", porque " + v2.name + " tiene valor";
    if (v1.type !== 'select-one') {
        // Si v1 no es un elemento de tipo select, realiza esta acción
        v1.nextElementSibling.innerHTML  = "Debe llenar el campo " + v1.name + ", porque " + v2.name + " tiene valor";
    } else {
        // Si v1 es un elemento de tipo select, realiza esta otra acción
        v1.parentNode.querySelector('small').innerHTML  = "Debe llenar el campo " + v1.name + ", porque " + v2.name + " tiene valor";
    }
    // $('button[type="submit"]').prop("disabled", "true");
    flag = false;
  }

  if (v1.value && !v2.value) {
    v2.classList.remove("is-valid");
    v2.classList.add("is-invalid");
    Toast.fire({
      type: 'error',
      title: "Debe llenar el campo " + v2.name + ", porque " + v1.name + " tiene valor",
    });
    //v2.nextElementSibling.textContent = "Debe llenar el campo " + v2.name + ", porque " + v1.name + " tiene valor";
    if (v2.type !== 'select-one') {
      console.log('TYPE', v2.type)
        // Si v1 no es un elemento de tipo select, realiza esta acción
        v2.nextElementSibling.innerHTML = "Debe llenar el campo " + v2.name + ", porque " + v1.name + " tiene valor";
    } else {
        // Si v1 es un elemento de tipo select, realiza esta otra acción
        v2.parentNode.querySelector('small').innerHTML  = "Debe llenar el campo " + v2.name + ", porque " + v1.name + " tiene valor";
    }
    // $('button[type="submit"]').prop("disabled", "true");
    flag = false;
  }

  if (v1.value && v2.value) {
    v1.classList.remove("is-invalid");
    v1.classList.add("is-valid");
    v2.classList.remove("is-invalid");
    v2.classList.add("is-valid");
    
    if (v1.type !== 'select-one') {
        // Si v1 no es un elemento de tipo select, realiza esta acción
        v1.nextElementSibling.innerHTML = "";
    } else {
        // Si v1 es un elemento de tipo select, realiza esta otra acción
        v1.parentNode.querySelector('small').innerHTML  = "";
    }
    if (v2.type !== 'select-one') {
        // Si v1 no es un elemento de tipo select, realiza esta acción
        v2.nextElementSibling.innerHTML = "";
    } else {
        // Si v1 es un elemento de tipo select, realiza esta otra acción
        v2.parentNode.querySelector('small').innerHTML  = "";
    }
    // $('button[type="submit"]').removeAttr("disabled");
    flag = true;
  }

  if (!v1.value && !v2.value) {
    v1.classList.remove("is-invalid");
    v1.classList.add("is-valid");
    v2.classList.remove("is-invalid");
    v2.classList.add("is-valid");
    if (v1.type !== 'select-one') {
      // Si v1 no es un elemento de tipo select, realiza esta acción
        v1.nextElementSibling.textContent = "";
    } else {
        // Si v1 es un elemento de tipo select, realiza esta otra acción
        v1.parentNode.querySelector('small').innerHTML  = "";
    }
    if (v2.type !== 'select-one') {
        // Si v1 no es un elemento de tipo select, realiza esta acción
        v2.nextElementSibling.textContent = "";
    } else {
        // Si v1 es un elemento de tipo select, realiza esta otra acción
        v2.parentNode.querySelector('small').innerHTML  = "";
    }
    // $('button[type="submit"]').removeAttr("disabled");
    flag = true;
  }

  return flag;
}

function validar_comparar_valores_contables(v1, v2, tipo) {
  switch (tipo) {
    case "mayor_igual":
      if (v1.val().length < v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor o igual a " + v2 + "elementos",
          });
          v1 = v1[0]
          v1.removeClass("is-valid").addClass("is-invalid");
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor_igual":
      if (v1.val().length > v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser menor o igual que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser menos de " + v2 + " elementos",
          });
          v1 = v1[0]
          v1.removeClass("is-valid").addClass("is-invalid");
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "mayor":
      if (v1.val().length <= v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser mayor que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " deben ser más de " + v2 + " elementos",
          });
          v1 = v1[0]
          v1.removeClass("is-valid").addClass("is-invalid");
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor":
      if (v1.val().length >= v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser menor que " + v2[0]["name"],
          });
        } else {
          Toast.fire({
            type: 'error',
            title: v1[0]["name"] + " debe ser menor a " + v2 + " elementos",
          });
          v1 = v1[0]
          v1.removeClass("is-valid").addClass("is-invalid");
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    default:
      break;
  }
}

function validar_archivos(selector, extensions) {
  let filePath = selector.val();
  // Seperar nombre de archivo por . y obtener último elemento (extensión)
  let extension = filePath.split(".").pop().toLowerCase();

  // Verificar que la extensión es permitida
  if (filePath) {
    if (!extensions.includes(extension)) {
      //selector.removeClass("is-valid").addClass("is-invalid");
      //$('button[type="submit"]').prop("disabled", "true");
      alert(
        "Por favor, suba archivos con una extensión válida: " +
          extensions.join(", ")
      );
      selector.val('');
    } else {
      //selector.removeClass("is-invalid").addClass("is-valid");
      //$('button[type="submit"]').prop("disabled", "false");
    }
  } else {
    //selector.removeClass("is-invalid").addClass("is-valid");
    //$('button[type="submit"]').prop("disabled", "false");
  }
  $('button[type="submit"]').prop("disabled", false);
}

function validate_only_number_and_text_and_guion(node, event) {
  if (
    (event.charCode >= 48 && event.charCode <= 57) ||
    (event.charCode >= 65 && event.charCode <= 90) ||
    (event.charCode >= 97 && event.charCode <= 122) ||
    event.charCode == 45 ||
    event.charCode == 225 ||
    event.charCode == 44 ||
    event.charCode == 233 ||
    event.charCode == 237 ||
    event.charCode == 243 ||
    event.charCode == 250 ||
    event.charCode == 209 ||
    event.charCode == 241 ||
    event.charCode == 32 ||
    event.charCode == 13
  ) {
    // 13-> 'Enter' 32-> ' '
    node.removeClass("is-invalid").addClass("is-valid");
    node[0].nextElementSibling.textContent = "";
    $('button[type="submit"]').removeAttr("disabled");
  } else {
    event.preventDefault();
    node.removeClass("is-valid").addClass("is-invalid");
    node[0].nextElementSibling.textContent =
      "Este campo solo acepta letras y números";

    $('button[type="submit"]').prop("disabled", "true");
  }
}

function tooglePassword(el, elem_icon){
  if (el.type == 'password'){
      el.type = 'text';
      //console.log('element', elem_icon.removeClass('fas fa-lock'));
      elem_icon.removeClass('fas fa-lock').addClass('fa fa-eye');
  } else {
      el.type = 'password';
      elem_icon.removeClass('fa fa-eye').addClass('fas fa-lock');
  }
}
