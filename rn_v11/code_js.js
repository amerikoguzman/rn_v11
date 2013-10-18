// JavaScript Document
function handleEnter(field, event) {
    //var miTabla=new elements();
    //elements[]={"txtf_ref","txtf_con","txtf_deb"};
    var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    if (keyCode == 13) {
        var i;
        for (i = 0; i < field.form.elements.length; i++)
            if (field == field.form.elements[i])
                break;
        i = (i + 1) % field.form.elements.length;
        field.form.elements[i].focus();
        return false;
    }
    else
        return true;
}
// Sit�a el foco en el txtfield 			
function setTextField(form) {
    //alert("Introduzca Usuario y Contrase�a");
    document.form.txtf_user.focus();
}
// -------------------------

// funci�n para conversi�n de min�sculas a may�sculas en datosMedicos.jsp 
function toUppercaseNamePac() {
    document.form.txtf_nom.value = document.form.txtf_nom.value.toUpperCase();
}

function toUppercaseApatPac() {
    document.form.txtf_apat.value = document.form.txtf_apat.value.toUpperCase();
}

function toUppercaseAmatPac() {
    document.form.txtf_amat.value = document.form.txtf_amat.value.toUpperCase();
}

function toUppercaseCiudad() {
    document.form.txtf_ciu.value = document.form.txtf_ciu.value.toUpperCase();
}

function toUppercaseEstado() {
    document.form.txtf_edo.value = document.form.txtf_edo.value.toUpperCase();
}

function toUppercaseCURP() {
    document.form.txtf_curp.value = document.form.txtf_curp.value.toUpperCase();
}

function toUppercaseOCUP() {
    document.form.txtf_ocup.value = document.form.txtf_ocup.value.toUpperCase();
}

function toUppercaseCALLE() {
    document.form.txtf_calle.value = document.form.txtf_calle.value.toUpperCase();
}

function toUppercaseCOL() {
    document.form.txtf_col.value = document.form.txtf_col.value.toUpperCase();
}
// -------------------------------------------------------------------------------------

// funci�n para que un txtfield solo reciba n�meros
function validarNro(e) {
    var key;
    if (window.event) // IE
    {
        key = e.keyCode;
    }
    else if (e.which) // Netscape/Firefox/Opera
    {
        key = e.which;
    }

    if (key < 48 || key > 57) {
        if (key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
        {
            return true;
        }
        else {
            return false;
        }
    }
    return true;
}
// -----------------------------------------

// funci�n para obtener el dato de un slct a un txtfield

function setDay(form) {
    //alert("hello");
    day1 = form.slct_dia.value;
    form.txtf_dia.value = day1;
}
function setMes(form) {
    //alert("hello");
    mes = form.slct_mes.value;
    form.txtf_mes.value = mes;
}
function setAnio(form) {
    //alert("hello");
    anio = form.slct_anio.value;
    form.txtf_anio.value = anio;
    var dia = parseInt(document.form.txtf_dia);
    var mes = parseInt(document.form.txtf_mes);
    var anios = parseInt(anio);
    var ed = calcular_edad(dia, mes, anios);
    document.form.txtf_edad.value = ed;
}
function setCed(form) {
    //alert("hello");
    ced = form.slct_ced.value;
    form.txtf_ced.value = ced;
}
function setProg(form) {
    //alert("hello");
    prog = form.slct_prog.value;
    form.txtf_prog.value = prog;
}
function setEst(form) {
    //alert("hello");
    est = form.slct_est.value;
    form.txtf_est.value = est;
}
function setSex(form) {
    //alert("hello");
    sex = form.slct_sex.value;
    form.txtf_sex.value = sex;
}

function setHij(form) {
    //alert("hello");
    hij = form.slct_hij.value;
    form.txtf_hij.value = hij;
}
function setLot1(form) {
    var lot1 = form.slct_lote.value;
    form.txtf_loten.value = lot1;
}
function setCad(form) {
    //alert(vari);
    var cad = form.slct_cad.value;
    form.txtf_cad.value = cad;
}

function setSexMed(form) {
    //alert(vari);
    var sex_med = form.slct_sex.value;
    form.txtf_sex.value = sex_med;
}
function setEnt(form) {
    //alert(vari);
    var ent = form.slct_ent.value;
    form.txtf_ent.value = ent;
}
function setEsp(form) {
    //alert(vari);
    var esp = form.slct_esp.value;
    form.txtf_esp.value = esp;
}
function setTel(form) {
    //alert(vari);
    var tel = form.slct_tel.value;
    form.txtf_tel3.value = tel;
}


function setID(form) {
    //alert("hello");
    id = form.slct_name.value;
    form.txtf_id.value = id;
    id2 = form.txtf_id.value;
    form.txtf_name.value = "";
    //location.reload();
    return id2;
}
function setUnidad(val, form) {
    //alert("hello");
    uni = form.unidad.value;
    form.txtf_uni.value = uni;
    //alert(""+val);
    var select = document.getElementById("slct_tuni");
    var select2 = document.getElementById("slct_clues");
    select.options.length = 0;
    select2.options.length = 0;
    select.options[select.options.length] = new Option('-- TIPO DE UNIDAD --', '-- TIPO DE UNIDAD --');
    select2.options[select2.options.length] = new Option('-- CLUES --', '-- CLUES --');
    document.getElementById("txta_dom").value = " ";
    document.form.txtf_mun.value = document.form.muni.value;
    if (val == 'APANZINGO') {
        //alert("Ingreso");
        var select = document.getElementById("slct_tuni");
        var select2 = document.getElementById("slct_clues");
        select.options.length = 0;
        select2.options.length = 0;
        select.options[select.options.length] = new Option('Unidad de Consulta Externa', 'Unidad de Consulta Externa');
        select2.options[select2.options.length] = new Option('MSSSA000290', 'MSSSA000290');
        document.getElementById("txta_dom").value += "AV. ADOLFO L�PEZ MATEOS S/N CENTRO";
    }
    if (val == 'HOSPITAL GENERAL DE JOJUTLA') {
        var select = document.getElementById("slct_tuni");
        var select2 = document.getElementById("slct_clues");
        select.options.length = 0;
        select2.options.length = 0;
        select.options[select.options.length] = new Option('Unidad de Hospitalizaci�n', 'Unidad de Hospitalizaci�n');
        select2.options[select2.options.length] = new Option('MSSSA000961', 'MSSSA000961');
        document.getElementById("txta_dom").value += "AV. UNIVERSIDAD S/N CENTRO";
    }
    if (val == 'ATLATLAHUCAN') {
        var select = document.getElementById("slct_tuni");
        var select2 = document.getElementById("slct_clues");
        select.options.length = 0;
        select2.options.length = 0;
        select.options[select.options.length] = new Option('Unidad de Consulta Externa', 'Unidad de Consulta Externa');
        select2.options[select2.options.length] = new Option('MSSSA002822', 'MSSSA002822');
        document.getElementById("txta_dom").value += "CARRETERA ATLATLAHUCAN-TOTOLAPAN KM 88 S/N";
    }


}
//-------------------------------------------------------

// Para agregar las Juris del Estado de Morelos
function fillCategory_Morelos() {
    var select = document.getElementById("juris");
    select.options[select.options.length] = new Option('J.S.1. CUERNAVACA', 'J.S.1. CUERNAVACA');
    select.options[select.options.length] = new Option('J.S.2. JOJUTLA', 'J.S.2. JOJUTLA');
    select.options[select.options.length] = new Option('J.S.3. CUAUTLA', 'J.S.3. CUAUTLA');
    //select.options[select.options.length] = new Option('HOSPITALES GENERALES', 'HOSPITALES GENERALES');
}
// fin municipios ---------------------------------------------------------------------------

// para Municipios 
function SelectSubCat_Mor(val, form) {
    var select = document.getElementById("muni");
    //alert("RHW2"+val);
    select.options.length = 0;
    if (val == 'J.S.1. CUERNAVACA') {//alert("R"+val);
        var select = document.getElementById("muni");
        select.options[select.options.length] = new Option('-- ESCOJA MUNICIPIO --', '-- ESCOJA MUNICIPIO --');
        select.options[select.options.length] = new Option('COATLAN DEL RIO', 'COATLAN DEL RIO');
        select.options[select.options.length] = new Option('CUERNAVACA', 'CUERNAVACA');
        select.options[select.options.length] = new Option('EMILIANO ZAPATA', 'EMILIANO ZAPATA');
        select.options[select.options.length] = new Option('HUITZILAC', 'HUITZILAC');
        select.options[select.options.length] = new Option('JIUTEPEC', 'JIUTEPEC');
        select.options[select.options.length] = new Option('MAZATEPEC', 'MAZATEPEC');
        select.options[select.options.length] = new Option('MIACATLAN', 'MIACATLAN');
        select.options[select.options.length] = new Option('TEMIXCO', 'TEMIXCO');
        select.options[select.options.length] = new Option('TEPOZTLAN', 'TEPOZTLAN');
        select.options[select.options.length] = new Option('TETECALA', 'TETECALA');
        select.options[select.options.length] = new Option('XOCHITEPEC', 'XOCHITEPEC');
        //alert("RHW2");

    }
    if (val == 'J.S.2. JOJUTLA') {
        var select = document.getElementById("muni");
        select.options[select.options.length] = new Option('-- ESCOJA MUNICIPIO --', '-- ESCOJA MUNICIPIO --');
        select.options[select.options.length] = new Option('JOJUTLA DE JUAREZ', 'JOJUTLA DE JUAREZ');
        select.options[select.options.length] = new Option('PUENTE DE IXTLA', 'PUENTE DE IXTLA');
        //alert("RHW2");

    }
    if (val == 'J.S.3. CUAUTLA') {
        var select = document.getElementById("muni");
        select.options[select.options.length] = new Option('-- ESCOJA MUNICIPIO --', '-- ESCOJA MUNICIPIO --');
        select.options[select.options.length] = new Option('ATLATLAHUCAN', 'ATLATLAHUCAN');
        select.options[select.options.length] = new Option('AXOCHIAPAN', 'AXOCHIAPAN');
        select.options[select.options.length] = new Option('AYALA', 'AYALA');
        select.options[select.options.length] = new Option('CUAUTLA', 'CUAUTLA');
        select.options[select.options.length] = new Option('JANTETELCO', 'JANTETELCO');
        select.options[select.options.length] = new Option('JONACATEPEC', 'JONACATEPEC');
        select.options[select.options.length] = new Option('OCUITUCO', 'OCUITUCOC');
        select.options[select.options.length] = new Option('TEMOAC', 'TEMOAC');
        select.options[select.options.length] = new Option('TEPALCINGO', 'TEPALCINGO');
        select.options[select.options.length] = new Option('TETELA DEL VOLC�N', 'TETELA DEL VOLC�N');
        select.options[select.options.length] = new Option('TLALNEPANTLA', 'TLALNEPANTLA');
        select.options[select.options.length] = new Option('TLAYACAPAN', 'TLAYACAPAN');
        select.options[select.options.length] = new Option('TOTOLAPAN', 'TOTOLAPAN');
        select.options[select.options.length] = new Option('YAUTEPEC', 'YAUTEPEC');
        select.options[select.options.length] = new Option('YECAPIXTLA', 'YECAPIXTLA');
        select.options[select.options.length] = new Option('ZACUALPAN DE AMILPAS', 'ZACUALPAN DE AMILPAS');
    }

    if (val == 'HOSPITALES GENERALES') {
        var select = document.getElementById("muni");
        select.options[select.options.length] = new Option('-- ESCOJA MUNICIPIO --', '-- ESCOJA MUNICIPIO --');
        select.options[select.options.length] = new Option('AXOCHIAPAN', 'AXOCHIAPAN');
        select.options[select.options.length] = new Option('CUAUTLA', 'CUAUTLA');
        select.options[select.options.length] = new Option('YAUTEPEC', 'YAUTEPEC');

    }

}
// fin de municipio ----------------------------------------------------------------------

// Para Unidades
function Select_toUnidad(val, form) {
    //alert("ingreso: "+val+form);
    var select = document.getElementById("unidad");
    select.options.length = 0;
    //document.form.txtf_mun.value=val;
    if (val == 'COATLAN DEL RIO') {
        var select = document.getElementById("unidad");
        select.options[select.options.length] = new Option('-- ESCOJA UNIDAD DE SALUD --', '-- ESCOJA UNIDAD DE SALUD --');
        select.options[select.options.length] = new Option('APANZINGO', 'APANZINGO');

    }

    if (val == 'JOJUTLA DE JUAREZ') {
        var select = document.getElementById("unidad");
        select.options[select.options.length] = new Option('-- ESCOJA UNIDAD DE SALUD --', '-- ESCOJA UNIDAD DE SALUD --');
        select.options[select.options.length] = new Option('HOSPITAL GENERAL DE JOJUTLA', 'HOSPITAL GENERAL DE JOJUTLA');
    }
    if (val == 'PUENTE DE IXTLA') {
        var select = document.getElementById("unidad");
        select.options[select.options.length] = new Option('-- ESCOJA UNIDAD DE SALUD --', '-- ESCOJA UNIDAD DE SALUD --');
        select.options[select.options.length] = new Option('HOSPITAL GENERAL DE PUENTE DE IXTLA', 'HOSPITAL GENERAL DE PUENTE DE IXTLA');
    }
    if (val == 'ATLATLAHUCAN') {
        var select = document.getElementById("unidad");
        select.options[select.options.length] = new Option('-- ESCOJA UNIDAD DE SALUD --', '-- ESCOJA UNIDAD DE SALUD --');
        select.options[select.options.length] = new Option('ATLATLAHUCAN', 'ATLATLAHUCAN');
    }


}
// fin de unidades ------------------------------------------------------------------------

// c�lculo de edad
function calcular_edad(dia_nacim, mes_nacim, anio_nacim) {
    fecha_hoy = new Date();
    ahora_anio = fecha_hoy.getYear();
    ahora_mes = fecha_hoy.getMonth();
    ahora_dia = fecha_hoy.getDate();
    edad = (ahora_anio + 1900) - anio_nacim;
    if (ahora_mes < (mes_nacim - 1)) {
        edad--;
    }
    if (((mes_nacim - 1) == ahora_mes) && (ahora_dia < dia_nacim)) {
        edad--;
    }
    if (edad > 1900) {
        edad -= 1900;
    }
    //document.form.txtf_edad.value=edad;
    return edad;
}
// fin c�lculo de edad ------------------------

// Cerrar ventana

function CloseWin() {
    window.opener = top;
    window.close();
}

// --------------------------------------------

// Cerrar ventana

function CloseWin2() {
    window.opener = top;

    window.close();
}

// --------------------------------------------

// funciones para el mes, d�a y a�o de forma autom�tica se mueve al siguiente campo
function putDays() {
    //alert("quibo")
    var dayv = document.form.txtf_day.value;
    // alert(""+dayv);
    if (dayv >= 0 && dayv <= 31) {
        var day = document.form.txtf_day.value.length + 1;
        //alert(" "+letters);
        if (day <= 2) {
            document.form.txtf_day.focus()
        }
        else {

            document.form.txtf_month.focus()

        }

    } else {
        alert("DIA Fuera de Rango: " + dayv);
        document.form.txtf_day.value = "";
        document.form.txtf_day.focus();
    }
}

function putMonths() {
    //alert("quibo")
    var month = document.form.txtf_month.value.length + 1;
    var monthv = document.form.txtf_month.value;
    // alert(""+dayv);
    if (monthv >= 0 && monthv <= 12) {
        //alert(" "+letters);
        if (month <= 2) {
            document.form.month.focus()
        }
        else {
            document.form.txtf_year.focus()
        }
    } else {
        alert("MES Fuera de Rango: " + monthv);
        document.form.txtf_month.value = "";
        document.form.txtf_month.focus();
    }
}

function putYears(form) {
    //alert("quibo")

    var year = document.form.txtf_year.value.length + 1;
    var yearv = document.form.txtf_year.value;
    // alert(""+dayv);
    // if( (yearv==0) || (yearv>=2009 && yearv<=2018))
    //{
    //alert(" "+letters);
    if (year <= 4) {
        document.form.txtf_year.focus()
    }
    else {
        document.form.txtf_usu.focus()
    }

}


// --------------------------------------------------------------------------------

// para la hora

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

    document.form.txtf_hor.value = horaImprimible

    setTimeout("mueveReloj()", 1000)

    //enviar el cursor al campo del folio
    /*var foc=document.form.txtf_foliore.value;
     if (foc !="")
     {
     document.form.txtf_cb.focus();
     }else
     {
     document.form.txtf_foliore.focus();
     }
     */

    //document.form.txtf_cb.focus();
    hora();
}

// --------------------------------------------------------------------------------
function abrir() {

    div = document.getElementById('flotante');

    div.style.display = 'block';

    div = document.getElementById('flotante2');

    div.style.display = 'block';

    div = document.getElementById('flotante3');

    div.style.display = 'block';

    div = document.getElementById('flotante4');

    div.style.display = 'block';

    div = document.getElementById('flotante5');

    div.style.display = 'block';

}


// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
function cerrar() {

    div = document.getElementById('flotante');

    div.style.display = 'none';

    div = document.getElementById('flotante2');

    div.style.display = 'none';

    div = document.getElementById('flotante3');

    div.style.display = 'none';

    div = document.getElementById('flotante4');

    div.style.display = 'none';

    div = document.getElementById('flotante5');

    div.style.display = 'none';

}


// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
function abrir_hijos(form) {

    valor = form.slct_hij.value;
    //alert("wence"+valor);
    if (valor == "Si") {
        document.getElementById('flotante').style.display = "block";
        document.getElementById('flotante2').style.display = "block";
    }
    else {
        document.getElementById('flotante2').style.display = "none";
        document.getElementById('flotante').style.display = "none";
    }

    /*div = document.getElementById('flotante');

     div.style.display='block';

     div = document.getElementById('flotante2');

     div.style.display='block';*/

}


// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
function cerrar_hijos() {

    div = document.getElementById('flotante');

    div.style.display = 'none';

    div = document.getElementById('flotante2');

    div.style.display = 'none';

}


// --------------------------------------------------------------------------------

// Funci�n para no permitir acentos

function validar(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[A-Za-z\s\w.,:;()*{}]/; // 4
    te = String.fromCharCode(tecla); // 5
    document.form.txta_sist.value = document.form.txta_sist.value.toUpperCase();
    return patron.test(te); // 6
}


//---------------------------------------------------------------------------------

// Funci�n para no permitir acentos

function validar2(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[A-Za-z\s\w.,:;()*{}]/; // 4
    te = String.fromCharCode(tecla); // 5
    document.form.txta_plan.value = document.form.txta_plan.value.toUpperCase();
    return patron.test(te); // 6
}


//---------------------------------------------------------------------------------

// Funci�n para no permitir acentos

function validar3(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[A-Za-z\s\w.,:;()*{}]/; // 4
    te = String.fromCharCode(tecla); // 5
    document.form.txta_sug.value = document.form.txta_sug.value.toUpperCase();
    return patron.test(te); // 6
}


//---------------------------------------------------------------------------------

// Funci�n para no permitir acentos

function validar4(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[A-Za-z\s\w-.,:;()*{}]/; // 4
    te = String.fromCharCode(tecla); // 5
    document.form.txta_cons.value = document.form.txta_cons.value.toUpperCase();
    return patron.test(te); // 6
}


//---------------------------------------------------------------------------------

// Funci�n para no permitir acentos

function validar5(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[A-Za-z\s\w-.,:;()*{}]/; // 4
    te = String.fromCharCode(tecla); // 5
    document.form.txta_sist.value = document.form.txta_sist.value.toUpperCase();
    return patron.test(te); // 6
}


//---------------------------------------------------------------------------------

// Funci�n para no permitir acentos

function validar_ant1(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[A-Za-z\s\w-.,:;()*{}]/; // 4
    te = String.fromCharCode(tecla); // 5
    document.form.txta_pad.value = document.form.txta_pad.value.toUpperCase();
    return patron.test(te); // 6
}


//---------------------------------------------------------------------------------

// Funci�n para no permitir acentos

function validar_ant2(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[A-Za-z\s\w-.,:;()*{}]/; // 4
    te = String.fromCharCode(tecla); // 5
    document.form.txta_abue.value = document.form.txta_abue.value.toUpperCase();
    return patron.test(te); // 6
}


//---------------------------------------------------------------------------------

// enviar dato de un txtfield
function irFile_Motivos() {
//alert("tt2");
    window.open("menu_motivo_cons.jsp")
//nueva_vent=open('usu_ficha.jsp','FICHA DE IDENTIFICACION','toolbar=0,status=0,location=0,directories=0,menubar=0,scrollbars=0,resize=0,width=500,height=620');
}

// --------------------------

function examinar(fic) {
    var fic2;
    fic = fic.split('//');
    //alert(fic[fic.length-1]);
    fic2 = fic[fic.length - 1];
    //alert(fic2);
    //fic2.replace('\','/'));
    form.txtf_ced.value = fic2;
    //alert(fic2.replace('\','/'));
}

function examinar2(form) {
    alert("" + form.exa.value);
    form.txtf_ced.value = form.exa.value;
    //alert(fic2.replace('\','/'));
}

// para mover un select
function dimePropiedades(form) {
    var texto
    texto = "El numero de opciones del select: " + form.slct_lote.length
    var indice = form.slct_lote.selectedIndex
    texto += "\nIndice de la opcion escogida: " + indice
    var valor = form.slct_lote.options[indice].value
    texto += "\nValor de la opcion escogida: " + valor
    var textoEscogido = form.slct_lote.options[indice].text
    texto += "\nTexto de la opcion escogida: " + textoEscogido
    //alert(texto) 
    form.slct_cad.value = form.slct_cad.options[indice].value;
    form.txtf_t3.value = form.slct_cad.value;
    //alert(texto)
}

// --------------------

// function para obtener la CURP
function obtieneRFC() {
    alert("ingreso a RFC");
    var fecha = "21/11/1970";
    var sexo = "1";
    var estado = "DF";
    var nombre = "RICARDO";
    var paterno = "HERNANDEZ";
    var materno = "WENCE";


    fecha = fecha.substring(6) + "-" + fecha.substring(3, 5) + "-" + fecha.substring(0, 2);
    alert("ingreso a RFC" + fecha);

    if (sexo == 1) {
        sexo = "H";
    }
    if (sexo == 2) {
        sexo = "M";
    }
    switch (estado) {
        case "1":
            estado = "AS";
            break;
        case "2":
            estado = "BC";
            break;
        case "3":
            estado = "BS";
            break;
        case "4":
            estado = "CC";
            break;
        case "5":
            estado = "CS";
            break;
        case "6":
            estado = "CH";
            break;
        case "7":
            estado = "CL";
            break;
        case "8":
            estado = "CM";
            break;
        case "9":
            estado = "DF";
            break;
        case "10":
            estado = "DG";
            break;
        case "11":
            estado = "GT";
            break;
        case "12":
            estado = "GR";
            break;
        case "13":
            estado = "HG";
            break;
        case "14":
            estado = "JC";
            break;
        case "15":
            estado = "MC";
            break;
        case "16":
            estado = "MN";
            break;
        case "17":
            estado = "MS";
            break;
        case "18":
            estado = "NT";
            break;
        case "19":
            estado = "NL";
            break;
        case "20":
            estado = "OC";
            break;
        case "21":
            estado = "PL";
            break;
        case "22":
            estado = "QT";
            break;
        case "23":
            estado = "QR";
            break;
        case "24":
            estado = "SP";
            break;
        case "25":
            estado = "SL";
            break;
        case "26":
            estado = "SR";
            break;
        case "27":
            estado = "TC";
            break;
        case "28":
            estado = "TS";
            break;
        case "29":
            estado = "TL";
            break;
        case "30":
            estado = "VZ";
            break;


    }
    var result = fnCalculaCURP(nombre, paterno, materno, fecha, sexo, estado).substring(0, 10);
    alert("result: " + result);
}
function obtieneCURP(obj, form) {

    if (!(verificaCURP(obj)))
        return false;
    else {
        var gender;

        //alert("amat: "+form.txtf_amat.value);
        if (form.txtf_sex.value == "MASCULINO")
            gender = 1;
        else
            gender = 2

        var fecha = form.txtf_dia.value + "/" + form.txtf_mes.value + "/" + form.txtf_anio.value;
        var sexo = gender;
        var estado = form.txtf_ent.value;
        var nombre = form.txtf_nom.value;
        var paterno = form.txtf_apat.value;
        var materno = form.txtf_amat.value;

        fecha = fecha.substring(6) + "-" + fecha.substring(3, 5) + "-" + fecha.substring(0, 2);

        if (sexo == 1) {
            sexo = "H";
        }
        if (sexo == 2) {
            sexo = "M";
        }
        switch (estado) {
            case "1":
                estado = "AS";
                break;
            case "2":
                estado = "BC";
                break;
            case "3":
                estado = "BS";
                break;
            case "4":
                estado = "CC";
                break;
            case "5":
                estado = "CS";
                break;
            case "6":
                estado = "CH";
                break;
            case "7":
                estado = "CL";
                break;
            case "8":
                estado = "CM";
                break;
            case "9":
                estado = "DF";
                break;
            case "10":
                estado = "DG";
                break;
            case "11":
                estado = "GT";
                break;
            case "12":
                estado = "GR";
                break;
            case "13":
                estado = "HG";
                break;
            case "14":
                estado = "JC";
                break;
            case "15":
                estado = "MC";
                break;
            case "16":
                estado = "MN";
                break;
            case "17":
                estado = "MS";
                break;
            case "18":
                estado = "NT";
                break;
            case "19":
                estado = "NL";
                break;
            case "20":
                estado = "OC";
                break;
            case "21":
                estado = "PL";
                break;
            case "22":
                estado = "QT";
                break;
            case "23":
                estado = "QR";
                break;
            case "24":
                estado = "SP";
                break;
            case "25":
                estado = "SL";
                break;
            case "26":
                estado = "SR";
                break;
            case "27":
                estado = "TC";
                break;
            case "28":
                estado = "TS";
                break;
            case "29":
                estado = "TL";
                break;
            case "30":
                estado = "VZ";
                break;
            case "31":
                estado = "YU";
                break;


        }
        result = fnCalculaCURP(nombre, paterno, materno, fecha, sexo, estado);
        //alert("result: "+result);
    }
}
function fnCalculaCURP(pstNombre, pstPaterno, pstMaterno, dfecha, pstSexo, pnuCveEntidad) {
    /*
     pstNombre="MARIA TERESITA DEL NI�O JESUS";
     pstPaterno="AGUERREBERE";
     pstMaterno="BARROSO";
     dfecha="1937-11-22";
     pstSexo = "M";
     pnuCveEntidad ="DF";

     pstNombre="ROCIO";
     pstPaterno="URIBARREN";
     pstMaterno="AGUERREBERE";
     dfecha="1969-02-03";
     pstSexo = "M";
     pnuCveEntidad ="DF";


     pstNombre="AINHOA";
     pstPaterno="ESTURAU";
     pstMaterno="URIBARREN";
     dfecha="2003-03-05";
     pstSexo = "M";
     pnuCveEntidad ="QR";




     pstNombre="MARIO";
     pstPaterno="PI�A";
     pstMaterno="FLORES";
     dfecha="1968-03-30";
     pstSexo = "H";
     pnuCveEntidad ="DF";
     */

    pstCURP = "";
    pstDigVer = "";
    contador = 0;
    contador1 = 0;
    pstCom = "";
    numVer = 0.00;
    valor = 0;
    sumatoria = 0;


// se declaran las varibale que se van a utilizar para ontener la CURP

    NOMBRES = "";
    APATERNO = "";
    AMATERNO = "";
    T_NOMTOT = "";
    NOMBRE1 = ""; //PRIMER NOMBRE
    NOMBRE2 = ""; //DEMAS NOMBRES
    NOMBRES_LONGITUD = 0; //LONGITUD DE TODOS @NOMBRES
    var NOMBRE1_LONGITUD = 0; //LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE SOBRA ES UN ESPACIO EN BLANCO)
    APATERNO1 = ""; //PRIMER NOMBRE
    APATERNO2 = ""; //DEMAS NOMBRES
    APATERNO_LONGITUD = 0; //LONGITUD DE TODOS @NOMBRES
    APATERNO1_LONGITUD = 0; //LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE SOBRA ES UN ESPACIO EN BLANCO)
    AMATERNO1 = ""; //PRIMER NOMBRE
    AMATERNO2 = ""; //DEMAS NOMBRES
    AMATERNO_LONGITUD = 0; //LONGITUD DE TODOS @NOMBRES
    AMATERNO1_LONGITUD = 0; //LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE SOBRA ES UN ESPACIO EN BLANCO)
    VARLOOPS = 0; //VARIABLE PARA LOS LOOPS, SE INICIALIZA AL INICIR UN LOOP


// Se inicializan las variables para obtener la primera parte de la CURP


    NOMBRES = pstNombre.replace(/^\s+|\s+$/g, "");
    APATERNO = pstPaterno.replace(/^\s+|\s+$/g, "");
    AMATERNO = pstMaterno.replace(/^\s+|\s+$/g, "");

    T_NOMTOT = APATERNO + ' ' + AMATERNO + ' ' + NOMBRES;


// Se procesan los nombres de pila


    VARLOOPS = 0;

    while (VARLOOPS != 1) {

        NOMBRES_LONGITUD = NOMBRES.length

        var splitNombres = NOMBRES.split(" ");
        var splitNombre1 = splitNombres[0];

        NOMBRE1_LONGITUD = splitNombre1.length;
//		NOMBRE1_LONGITUD = PATINDEX('% %',@NOMBRES)

        if (NOMBRE1_LONGITUD = 0) {
            NOMBRE1_LONGITUD = NOMBRES_LONGITUD;
        }
        NOMBRE1 = NOMBRES.substring(0, splitNombre1.length);
        NOMBRE2 = NOMBRES.substring(splitNombre1.length + 1, NOMBRES.length);


// Se quitan los nombres de JOSE, MARIA,MA,MA.
        /*
         if (NOMBRE1 IN ('JOSE','MARIA','MA.','MA','DE','LA','LAS','MC','VON','DEL','LOS','Y','MAC','VAN') && NOMBRE2 != '')
         {
         NOMBRES = NOMBRE2
         }
         else
         {
         VARLOOPS = 1
         }
         */

        if (NOMBRE1 == 'JOSE' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'MARIA' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'MA.' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'MA' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'DE' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'LA' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'LAS' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }


        if (NOMBRE1 == 'MC' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'VON' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }


        if (NOMBRE1 == 'DEL' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }


        if (NOMBRE1 == 'LOS' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'Y' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'MAC' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

        if (NOMBRE1 == 'VAN' && NOMBRE2 != '') {
            NOMBRES = NOMBRE2;
        }
        else {
            VARLOOPS = 1;
        }

    } // fin varloops <> 1


// Se procesan los APELLIDOS, PATERNO EN UN LOOP

    VARLOOPS = 0;

    while (VARLOOPS != 1) {

        //SET @APATERNO_LONGITUD = LEN(@APATERNO)
        APATERNO_LONGITUD = APATERNO.length;

        //SET @APATERNO1_LONGITUD = PATINDEX('% %',@APATERNO)
        var splitPaterno = APATERNO.split(" ");
        var splitPaterno1 = splitPaterno[0];
        APATERNO1_LONGITUD = splitPaterno1.length;

        if (APATERNO1_LONGITUD = 0) {
            APATERNO1_LONGITUD = APATERNO_LONGITUD;
        }
//		APATERNO1 = RTRIM(LEFT(@APATERNO,@APATERNO1_LONGITUD))
//		APATERNO2 = LTRIM(RIGHT(@APATERNO,@APATERNO_LONGITUD - @APATERNO1_LONGITUD))

        APATERNO1 = APATERNO.substring(0, splitPaterno1.length);
        APATERNO2 = APATERNO.substring(splitPaterno1.length + 1, APATERNO.length);
        // Se quitan los sufijos

        /*
         IF @APATERNO1 IN ('DE','LA','LAS','MC','VON','DEL','LOS','Y','MAC','VAN') AND @APATERNO2 <> ''
         BEGIN
         SET @APATERNO = @APATERNO2
         END
         ELSE
         BEGIN
         SET @VARLOOPS = 1
         END
         }
         */

        if (APATERNO1 == 'DE' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }


        if (APATERNO1 == 'LA' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }


        if (APATERNO1 == 'LAS' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (APATERNO1 == 'MC' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (APATERNO1 == 'VON' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (APATERNO1 == 'DEL' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }


        if (APATERNO1 == 'LOS' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (APATERNO1 == 'Y' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (APATERNO1 == 'MAC' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (APATERNO1 == 'VAN' && APATERNO2 != '') {
            APATERNO = APATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

    } // fin varloops


// Faltan: )


// Se procesan los APELLIDOS, MATERNO EN UN LOOP

    VARLOOPS = 0;

    while (VARLOOPS != 1) {

        //SET @APATERNO_LONGITUD = LEN(@APATERNO)
        AMATERNO_LONGITUD = AMATERNO.length;

        //SET @APATERNO1_LONGITUD = PATINDEX('% %',@APATERNO)
        var splitMaterno = AMATERNO.split(" ");
        var splitMaterno1 = splitMaterno[0];
        AMATERNO1_LONGITUD = splitMaterno1.length;

        if (AMATERNO1_LONGITUD = 0) {
            AMATERNO1_LONGITUD = AMATERNO_LONGITUD;
        }

        AMATERNO1 = AMATERNO.substring(0, splitMaterno1.length);
        AMATERNO2 = AMATERNO.substring(splitMaterno1.length + 1, AMATERNO.length);

// Se quitan los sufijos


        /*
         IF @APATERNO1 IN ('DE','LA','LAS','MC','VON','DEL','LOS','Y','MAC','VAN') AND @APATERNO2 <> ''
         BEGIN
         SET @APATERNO = @APATERNO2
         END
         ELSE
         BEGIN
         SET @VARLOOPS = 1
         END
         }
         */

        if (AMATERNO1 == 'DE' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }


        if (AMATERNO1 == 'LA' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }


        if (AMATERNO1 == 'LAS' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (AMATERNO1 == 'MC' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (AMATERNO1 == 'VON' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (AMATERNO1 == 'DEL' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (AMATERNO1 == 'LOS' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (AMATERNO1 == 'Y' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (AMATERNO1 == 'MAC' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }

        if (AMATERNO1 == 'VAN' && AMATERNO2 != '') {
            AMATERNO = AMATERNO2;
        }
        else {
            VARLOOPS = 1;
        }


    } // fin varloops


// Se obtiene del primer apellido la primer letra y la primer vocal interna

    pstCURP = APATERNO1.substring(0, 1);

    APATERNO1_LONGITUD = APATERNO1.length;
    VARLOOPS = 0 // EMPIEZA EN UNO POR LA PRIMERA LETRA SE LA VA A SALTAR

    while (APATERNO1_LONGITUD > VARLOOPS) {
        VARLOOPS = VARLOOPS + 1;

        // if SUBSTRING(@APATERNO1,@VARLOOPS,1) IN ('A','E','I','O','U')
        var compara = APATERNO1.substr(parseInt(VARLOOPS), 1);

        if (compara == 'A') {
            pstCURP = pstCURP + compara;
            VARLOOPS = APATERNO1_LONGITUD;
        }
        if (compara == 'E') {
            pstCURP = pstCURP + compara;
            VARLOOPS = APATERNO1_LONGITUD;
        }
        if (compara == 'I') {
            pstCURP = pstCURP + compara;
            VARLOOPS = APATERNO1_LONGITUD;
        }
        if (compara == 'O') {
            pstCURP = pstCURP + compara;
            VARLOOPS = APATERNO1_LONGITUD;
        }
        if (compara == 'U') {

            pstCURP = pstCURP + compara;
            VARLOOPS = APATERNO1_LONGITUD;
        }

    }


// Se obtiene la primer letra del apellido materno

    pstCURP = pstCURP + AMATERNO1.substring(0, 1);

// Se le agrega la primer letra del nombre

    pstCURP = pstCURP + NOMBRES.substring(0, 1);


// Se agrega la fecha de nacimiento, clave del sexo y clave de la entidad

    var splitFecha = dfecha.split("-");
    var splitAnio = splitFecha[0].substr(2, 2);
    var splitMes = splitFecha[1];
    var splitDia = splitFecha[2];


    pstCURP = pstCURP + splitAnio + splitMes + splitDia + pstSexo + pnuCveEntidad


// Se obtiene la primera consonante interna del apellido paterno


    VARLOOPS = 0;

    while (splitPaterno1.length > VARLOOPS) {
        VARLOOPS = VARLOOPS + 1
        var compara = APATERNO1.substr(parseInt(VARLOOPS), 1);

        if (compara != 'A' && compara != 'E' && compara != 'I' && compara != 'O' && compara != 'U') {
            if (compara == '�') {
                pstCURP = pstCURP + 'X';
            }
            else {
                pstCURP = pstCURP + compara;
            }

            VARLOOPS = splitPaterno1.length;
        }
    }


// Se obtiene la primera consonante interna del apellido materno

    VARLOOPS = 0;

    while (splitMaterno1.length > VARLOOPS) {

        VARLOOPS = VARLOOPS + 1;
        var compara = AMATERNO1.substr(parseInt(VARLOOPS), 1);

        if (compara != 'A' && compara != 'E' && compara != 'I' && compara != 'O' && compara != 'U') {
            if (compara == '�') {
                pstCURP = pstCURP + 'X';
            }
            else {
                pstCURP = pstCURP + compara;
            }

            VARLOOPS = splitMaterno1.length;
        }
    }


// Se obtiene la primera consonante interna del nombre

    VARLOOPS = 0;

    while (splitNombre1.length > VARLOOPS) {

        VARLOOPS = VARLOOPS + 1;
        var compara = NOMBRE1.substr(parseInt(VARLOOPS), 1);

        if (compara != 'A' && compara != 'E' && compara != 'I' && compara != 'O' && compara != 'U') {
            if (compara == '�') {
                pstCURP = pstCURP + 'X';
            }
            else {
                pstCURP = pstCURP + compara;
            }

            VARLOOPS = splitNombre1.length;
        }
    }


// Se obtiene el digito verificador


    var contador = 18;
    var contador1 = 0;
    var valor = 0;
    var sumatoria = 0;


    while (contador1 <= 15) {

        //pstCom = SUBSTRING(@pstCURP,@contador1,1)
        var pstCom = pstCURP.substr(parseInt(contador1), 1);

        if (pstCom == '0') {
            valor = 0 * contador;
        }
        if (pstCom == '1') {
            valor = 1 * contador;
        }
        if (pstCom == '2') {
            valor = 2 * contador;
        }
        if (pstCom == '3') {
            valor = 3 * contador;
        }
        if (pstCom == '4') {
            valor = 4 * contador;
        }
        if (pstCom == '5') {
            valor = 5 * contador;
        }
        if (pstCom == '6') {
            valor = 6 * contador;
        }
        if (pstCom == '7') {
            valor = 7 * contador;
        }
        if (pstCom == '8') {
            valor = 8 * contador;
        }
        if (pstCom == '9') {
            valor = 9 * contador;
        }
        if (pstCom == 'A') {
            valor = 10 * contador;
        }
        if (pstCom == 'B') {
            valor = 11 * contador;
        }
        if (pstCom == 'C') {
            valor = 12 * contador;
        }
        if (pstCom == 'D') {
            valor = 13 * contador;
        }
        if (pstCom == 'E') {
            valor = 14 * contador;
        }
        if (pstCom == 'F') {
            valor = 15 * contador;
        }
        if (pstCom == 'G') {
            valor = 16 * contador;
        }
        if (pstCom == 'H') {
            valor = 17 * contador;
        }
        if (pstCom == 'I') {
            valor = 18 * contador;
        }
        if (pstCom == 'J') {
            valor = 19 * contador;
        }
        if (pstCom == 'K') {
            valor = 20 * contador;
        }
        if (pstCom == 'L') {
            valor = 21 * contador;
        }
        if (pstCom == 'M') {
            valor = 22 * contador;
        }
        if (pstCom == 'N') {
            valor = 23 * contador;
        }
        if (pstCom == '�') {
            valor = 24 * contador;
        }
        if (pstCom == 'O') {
            valor = 25 * contador;
        }
        if (pstCom == 'P') {
            valor = 26 * contador;
        }
        if (pstCom == 'Q') {
            valor = 27 * contador;
        }
        if (pstCom == 'R') {
            valor = 28 * contador;
        }
        if (pstCom == 'S') {
            valor = 29 * contador;
        }
        if (pstCom == 'T') {
            valor = 30 * contador;
        }
        if (pstCom == 'U') {
            valor = 31 * contador;
        }
        if (pstCom == 'V') {
            valor = 32 * contador;
        }
        if (pstCom == 'W') {
            valor = 33 * contador;
        }
        if (pstCom == 'X') {
            valor = 34 * contador;
        }
        if (pstCom == 'Y') {
            valor = 35 * contador;
        }

        if (pstCom == 'Z') {
            valor = 36 * contador;
        }

        contador = contador - 1;
        contador1 = contador1 + 1;
        sumatoria = sumatoria + valor;

    }

    numVer = sumatoria % 10;
    numVer = Math.abs(10 - numVer);
    anio = splitFecha[0];


    if (numVer == 10) {
        numVer = 0;
    }


    if (anio < 2000) {
        pstDigVer = '0' + '' + numVer;
    }
    if (anio >= 2000) {
        pstDigVer = 'A' + '' + numVer;
    }

    pstCURP = pstCURP + pstDigVer;

    form.txtf_curp.value = pstCURP;
    return pstCURP

} // End if


// end function-----------------

// valida Email
function validateEmail($email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test($email)) {
        return false;
    } else {
        return true;
    }
}
// ------------

// otra funci�n para Email
function validarEmail(valor) {


    if (/^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/.test(valor)) {
        return (true);
    }
    else {
        alert("Direcci�n de Correo Inv�lida, Introduzca una v�lida");
        //document.all('mail').focus();
        document.form.mail.focus();

//return (false);
    }
}
// -----------------------

// Verfica CURP
function verificaCURP(obj) {

    missinginfo = "";
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El campo NOMBRE no debe de estar vac�o.";
    }
    if (obj.txtf_apat.value == "") {
        missinginfo += "\n El campo APELLIDO PATERNO no debe de estar vac�o.";
    }
    if (obj.txtf_amat.value == "") {
        missinginfo += "\n El campo APELLIDO MATERNO no debe de estar vac�o.";
    }

    if (obj.txtf_dia.value == "") {
        missinginfo += "\n El campo D�A no debe de estar vac�o ";
    }


    if (obj.txtf_mes.value == "") {
        missinginfo += "\n El campo MES no debe de estar vac�o";
    }

    if (obj.txtf_anio.value == "") {
        missinginfo += "\n El campo A�O no debe de estar vac�o";
    }
    if (obj.txtf_sex.value == "") {
        missinginfo += "\n El campo SEXO no debe de estar vac�o";
    }
    if (obj.txtf_ent.value == "") {
        missinginfo += "\n El campo ENTIDAD no debe de estar vac�o";
    }


    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GENERAR EL CURP:\n" + missinginfo + "\n\n �INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ!\n";
        alert(missinginfo);
        return false;
    } else {
        return true;
    }

}
// ------------


function test(form) {
    //vari=document.form.txtf_id.value;
    //alert("wence"+vari);
    alert("wence");
}


function mostrar() {
    lb = document.getElementById("ctr_18");
    lb1 = document.getElementById("ctr_19");
    lb2 = document.getElementById("ctr_20");
    lb3 = document.getElementById("ctr_21");

    chk = document.getElementById("ch1");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}

function mostrar1() {
    lb = document.getElementById("ctr_22");
    lb1 = document.getElementById("ctr_23");
    lb2 = document.getElementById("ctr_24");
    lb3 = document.getElementById("ctr_25");

    chk = document.getElementById("ch2");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar2() {
    lb = document.getElementById("ctr_26");
    lb1 = document.getElementById("ctr_27");
    lb2 = document.getElementById("ctr_28");
    lb3 = document.getElementById("ctr_29");

    chk = document.getElementById("ch3");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar3() {
    lb = document.getElementById("ctr_30");
    lb1 = document.getElementById("ctr_31");
    lb2 = document.getElementById("ctr_32");
    lb3 = document.getElementById("ctr_33");

    chk = document.getElementById("ch4");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar4() {
    lb = document.getElementById("ctr_34");
    lb1 = document.getElementById("ctr_35");
    lb2 = document.getElementById("ctr_36");
    lb3 = document.getElementById("ctr_37");

    chk = document.getElementById("ch5");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar5() {
    lb = document.getElementById("ctr_38");
    lb1 = document.getElementById("ctr_39");
    lb2 = document.getElementById("ctr_40");
    lb3 = document.getElementById("ctr_41");

    chk = document.getElementById("ch6");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar6() {
    lb = document.getElementById("ctr_42");
    lb1 = document.getElementById("ctr_43");
    lb2 = document.getElementById("ctr_44");
    lb3 = document.getElementById("ctr_45");

    chk = document.getElementById("ch7");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar7() {
    lb = document.getElementById("ctr_46");
    lb1 = document.getElementById("ctr_47");
    lb2 = document.getElementById("ctr_48");
    lb3 = document.getElementById("ctr_49");

    chk = document.getElementById("ch8");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar8() {
    lb = document.getElementById("ctr_50");
    lb1 = document.getElementById("ctr_51");
    lb2 = document.getElementById("ctr_52");
    lb3 = document.getElementById("ctr_53");

    chk = document.getElementById("ch9");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar9() {
    lb = document.getElementById("ctr_54");
    lb1 = document.getElementById("ctr_55");
    lb2 = document.getElementById("ctr_56");
    lb3 = document.getElementById("ctr_57");

    chk = document.getElementById("ch10");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar10() {
    lb = document.getElementById("ctr_58");
    lb1 = document.getElementById("ctr_59");
    lb2 = document.getElementById("ctr_60");
    lb3 = document.getElementById("ctr_61");

    chk = document.getElementById("ch11");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar11() {
    lb = document.getElementById("ctr_62");
    lb1 = document.getElementById("ctr_63");
    lb2 = document.getElementById("ctr_64");
    lb3 = document.getElementById("ctr_65");

    chk = document.getElementById("ch12");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar12() {
    lb = document.getElementById("ctr_66");
    lb1 = document.getElementById("ctr_67");
    lb2 = document.getElementById("ctr_68");
    lb3 = document.getElementById("ctr_69");

    chk = document.getElementById("ch13");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar13() {
    lb = document.getElementById("ctr_70");
    lb1 = document.getElementById("ctr_71");
    lb2 = document.getElementById("ctr_72");
    lb3 = document.getElementById("ctr_73");

    chk = document.getElementById("ch14");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar14() {
    lb = document.getElementById("ctr_74");
    lb1 = document.getElementById("ctr_75");
    lb2 = document.getElementById("ctr_76");
    lb3 = document.getElementById("ctr_77");

    chk = document.getElementById("ch15");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}
function mostrar15() {
    lb = document.getElementById("ctr_78");
    lb1 = document.getElementById("ctr_79");
    lb2 = document.getElementById("ctr_80");
    lb3 = document.getElementById("ctr_81");

    chk = document.getElementById("ch16");
    if (chk.checked) {
        lb.style.display = 'block';
        lb1.style.display = 'block';
        lb2.style.display = 'block';
        lb3.style.display = 'block';
    } else {
        lb.style.display = 'none';
        lb1.style.display = 'none';
        lb2.style.display = 'none';
        lb3.style.display = 'none';
    }
}

// ------autocomplete


// ----------