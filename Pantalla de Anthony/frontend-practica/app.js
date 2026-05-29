const API_PRINCIPAL = `${window.location.origin}/api`;
const API_LOCAL = "http://127.0.0.1:3000/api";

const formulario = document.getElementById("formularioProveedor");
const ciudadSelect = document.getElementById("ciudad");
const sectorSelect = document.getElementById("sector");

function mostrarAlerta(texto) {
  alert(texto);
}

async function cargarOpciones(endpoint, select, textoInicial, crearTexto) {
  try {
    select.innerHTML = `<option value="">Cargando...</option>`;

    const respuesta = await pedirDatos(endpoint);

    if (!respuesta.ok) {
      throw new Error(`Error ${respuesta.status}`);
    }

    const datos = await respuesta.json();

    if (!Array.isArray(datos)) {
      throw new Error("La respuesta del servidor no es una lista");
    }

    select.innerHTML = `<option value="">${textoInicial}</option>`;

    datos.forEach((item) => {
      const option = document.createElement("option");
      option.value = endpoint === "ciudades" ? item.id_ciudad : item.id_sector;
      option.textContent = crearTexto(item);
      select.appendChild(option);
    });
  } catch (error) {
    select.innerHTML = `<option value="">No se pudieron cargar los datos</option>`;
    mostrarAlerta(`No se pudieron cargar los datos de ${endpoint}`);
  }
}

async function pedirDatos(endpoint, opciones = {}) {
  const apiActual = window.location.protocol === "http:" && window.location.port === "3000"
    ? API_PRINCIPAL
    : API_LOCAL;

  try {
    return await fetch(`${apiActual}/${endpoint}`, opciones);
  } catch (error) {
    return fetch(`${API_LOCAL}/${endpoint}`, opciones);
  }
}

async function iniciarFormulario() {
  await Promise.all([
    cargarOpciones("ciudades", ciudadSelect, "Seleccione una ciudad", (item) => item.nombre),
    cargarOpciones("sectores", sectorSelect, "Seleccione un sector", (item) => item.nombre)
  ]);
}

formulario.addEventListener("submit", async (event) => {
  event.preventDefault();

  const boton = formulario.querySelector("button");
  const textoBoton = boton.textContent;
  const datos = Object.fromEntries(new FormData(formulario));

  boton.disabled = true;
  boton.textContent = "Registrando proveedor...";

  try {
    const respuesta = await pedirDatos("proveedores", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(datos)
    });

    const resultado = await respuesta.json();

    if (!respuesta.ok) {
      throw new Error(resultado.mensaje || "No se pudo registrar el proveedor");
    }

    formulario.reset();
    mostrarAlerta(resultado.mensaje);
  } catch (error) {
    mostrarAlerta(error.message);
  } finally {
    boton.disabled = false;
    boton.textContent = textoBoton;
  }
});

iniciarFormulario();
