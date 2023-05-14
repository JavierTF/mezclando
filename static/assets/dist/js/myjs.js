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
    $(".invalid-feedback").text("Por favor, no deje el campo vacío.").show();
    $('button[type="submit"]').prop("disabled", "true");
    return false;
  } else {
    node.removeClass("is-invalid").addClass("is-valid");
    $('button[type="submit"]').removeAttr("disabled");
  }
}
function validate_only_text(node, event) {
  if (
    (event.charCode >= 65 && event.charCode <= 90) ||
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
    node[0].nextElementSibling.textContent = "Este campo solo acepta letras";

    $('button[type="submit"]').prop("disabled", "true");
  }
}

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
  if (node.val()) {
    node.removeClass("is-invalid").addClass("is-valid");
    // node[0].nextElementSibling.textContent = "";
    $('button[type="submit"]').removeAttr("disabled");
  } else {
    event.preventDefault();
    node.removeClass("is-valid").addClass("is-invalid");
    alert("Seleccione un valor en " + node[0]["name"]);
    // node[0].nextElementSibling.textContent = "Seleccione un valor";
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
    alert("No puede haber más de 6 elementos en " + node[0]["name"]);
    $('button[type="submit"]').prop("disabled", "true");
  }
}

function validate_only_number(node, event) {
  // alert('validar numeros')
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

function validar_comparar_fechas(v1, v2 = "", tipo = "mayor", dia = "hoy") {
  var d1 = new Date(v1.value.replace(/-/g, ","));
  d1 = d1.toISOString();
  if (!v2.value) {
    var d2 = new Date(Date.now());
    d2 = d2.toISOString();
  } else {
    v2 = new Date(v2.value.replace(/-/g, ","));
    var d2 = v2.toISOString();
  }

  switch (tipo) {
    case "mayor_igual":
      if (d1 < d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");
        if (!v2) {
          alert(v1.name + " debe ser mayor o igual que " + dia);
        } else {
          alert(v1.name + " debe ser mayor o igual que " + v2.name);
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor_igual":
      if (d1 > d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");
        if (!v2) {
          alert(v1.name + " debe ser menor o igual que " + dia);
        } else {
          alert(v1.name + " debe ser menor o igual que " + v2.name);
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "mayor":
      if (d1 <= d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");
        if (!v2) {
          alert(v1.name + " debe ser mayor que " + dia);
        } else {
          alert(v1.name + " debe ser mayor que " + v2.name);
        }
        $('button[type="submit"]').prop("disabled", "true");
        return flag;
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    case "menor":
      if (d1 >= d2) {
        v1.classList.remove("is-valid");
        v1.classList.add("is-invalid");
        if (!v2) {
          alert(v1.name + " debe ser menor que " + dia);
        } else {
          alert(v1.name + " debe ser menor que " + v2.name);
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.classList.remove("is-invalid");
        v1.classList.add("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
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
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2);
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
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2);
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
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2);
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
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2);
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    default:
      console.log("default");
  }
}

function validar_existencia_ambos(v1, v2) {
  var flag;
  if (!v1.value && v2.value) {
    v1.classList.remove("is-valid");
    v1.classList.add("is-invalid");
    alert("Debe llenar el campo " + v1.name + ", porque " + v2.name + " tiene valor");
    // $('button[type="submit"]').prop("disabled", "true");
    flag = false;
  }

  if (v1.value && !v2.value) {
    v2.classList.remove("is-valid");
    v2.classList.add("is-invalid");
    alert("Debe llenar el campo " + v2.name + ", porque " + v1.name + " tiene valor");
    // $('button[type="submit"]').prop("disabled", "true");
    flag = false;
  }

  if (v1.value && v2.value) {
    v1.classList.remove("is-invalid");
    v1.classList.add("is-valid");
    v2.classList.remove("is-invalid");
    v2.classList.add("is-valid");
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
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser mayor o igual que " + v2);
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
          alert(v1[0]["name"] + " debe ser menor o igual que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser menor o igual que " + v2);
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
          alert(v1[0]["name"] + " debe ser mayor que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser mayor que " + v2);
        }
        $('button[type="submit"]').prop("disabled", "true");
        console.log("invalido");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
        console.log("valido");
      }
      break;
    case "menor":
      if (v1.val().length >= v2) {
        v1.removeClass("is-valid").addClass("is-invalid");
        if (typeof v2 === "object") {
          alert(v1[0]["name"] + " debe ser menor que " + v2[0]["name"]);
        } else {
          alert(v1[0]["name"] + " debe ser menor que " + v2);
        }
        $('button[type="submit"]').prop("disabled", "true");
      } else {
        v1.removeClass("is-invalid").addClass("is-valid");
        $('button[type="submit"]').removeAttr("disabled");
      }
      break;
    default:
      console.log("default");
  }
}

function validar_archivos(selector, extensions) {
  let filePath = selector.val();
  // Seperar nombre de archivo por . y obtener último elemento (extensión)
  let extension = filePath.split(".").pop().toLowerCase();

  // Verificar que la extensión es permitida
  if (filePath) {
    if (!extensions.includes(extension)) {
      selector.removeClass("is-valid").addClass("is-invalid");
      $('button[type="submit"]').prop("disabled", "true");
      alert(
        "Por favor, suba archivos con una extensión válida: " +
          extensions.join(", ")
      );
      document.getElementById("id_informe_apertura").value = "";
    } else {
      selector.removeClass("is-invalid").addClass("is-valid");
      $('button[type="submit"]').removeAttr("disabled");
    }
  } else {
    selector.removeClass("is-invalid").addClass("is-valid");
    $('button[type="submit"]').removeAttr("disabled");
  }
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
