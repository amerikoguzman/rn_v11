// JavaScript Document

//función para visualizar la imágen 
function cerrar() {
//alert("2");
    div = document.getElementById('flotante');
    div.style.display = 'none';

    div = document.getElementById('recetas');
    div.style.display = 'block';
}

function cerrar2() {
//alert("2");
    div = document.getElementById('contra');
    div.style.display = 'block';

    div = document.getElementById('recetas');
    div.style.display = 'none';

    document.form.txtf_pass.focus();
}

// -------------------------------
function focusLocus() {
    alert("focus");
}

function mueveReloj() {

    momentoActual = new Date()
    hora = momentoActual.getHours()
    minuto = momentoActual.getMinutes()
    segundo = momentoActual.getSeconds()

    str_segundo = new String(segundo)
    if (str_segundo.length == 1)
        segundo = "0" + segundo

    str_minuto = new String(minuto)
    if (str_minuto.length == 1)
        minuto = "0" + minuto

    str_hora = new String(hora)
    if (str_hora.length == 1)
        hora = "0" + hora


    horaImprimible = hora + ":" + minuto + ":" + segundo

    document.form.reloj.value = horaImprimible

    setTimeout("mueveReloj()", 1000)

}

// Validar Imprimir PS

function verifica_PSI(obj) {
    missinginfo = "";
    if (obj.txtf_paciente.value == "") {
        missinginfo += "\n - Campo Nombre del Beneficiario";
    }

    if (missinginfo != "") {
        missinginfo = "NO SE HA INGRESADO UN FOLIO VÁLIDO:\n" + missinginfo + "\n\n ¡INGRESA UN FOLIO Y TRATA OTRA VEZ!\n";
        alert(missinginfo);

        return false;

    } else {

        return true;
    }
}
// fin validar 

// focus locus
function focus1() {
    alert("carga");
    document.form.datasize.focus();
}
// ----------