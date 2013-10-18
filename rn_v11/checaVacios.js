// Archivo de JS

// checa campos vac�os para el RFC para M�dico
function verificaRFC(obj) {

    missinginfo = "";
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El campo NOMBRE no debe de estar vac�o";
    }

    if (obj.txtf_apat.value == "") {
        missinginfo += "\n El campo APELLIDO PATERNO no debe de estar vac�o";
    }
    if (obj.txtf_amat.value == "") {
        missinginfo += "\n El campo APELLIDO MATERNO no debe de estar vac�o";
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

    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GENERAR EL RFC:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
        alert(missinginfo);
        return false;
    } else {
        return true;
    }

}
// fin verificaci�n RFC ------------------------------------------------------
// checa campos vac�os para el RFC para paciente
function verificaRFC_Pac(obj) {

    missinginfo = "";
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El campo NOMBRE no debe de estar vac�o";
    }

    if (obj.txtf_apat.value == "") {
        missinginfo += "\n El campo APELLIDO PATERNO no debe de estar vac�o";
    }
    if (obj.txtf_amat.value == "") {
        missinginfo += "\n El campo APELLIDO MATERNO no debe de estar vac�o";
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

    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GENERAR EL RFC:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
        alert(missinginfo);
        return false;
    } else {
        return true;
    }

}
// fin verificaci�n RFC ------------------------------------------------------

// checa campos vac�os para el UCI
function verificaUCI(obj) {

    missinginfo = "";
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El campo NOMBRE no debe de estar vac�o";
    }

    if (obj.txtf_apat.value == "") {
        missinginfo += "\n El campo APELLIDO PATERNO no debe de estar vac�o";
    }
    if (obj.txtf_amat.value == "") {
        missinginfo += "\n El campo APELLIDO MATERNO no debe de estar vac�o";
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
    if (obj.txtf_rfc1.value == "") {
        missinginfo += "\n El campo RFC1 no debe de estar vac�o";
    }
    if (obj.txtf_rfc2.value == "") {
        missinginfo += "\n El campo RFC2 no debe de estar vac�o";
    }

    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GENERAR EL UCI:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
        alert(missinginfo);
        return false;
    } else {
        return true;
    }

}
// fin verificaci�n UCI ------------------------------------------------------

// checa campos vac�os para el UCI
function verificaUCI_Pac(obj) {

    missinginfo = "";
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El campo NOMBRE no debe de estar vac�o";
    }

    if (obj.txtf_apat.value == "") {
        missinginfo += "\n El campo APELLIDO PATERNO no debe de estar vac�o";
    }
    if (obj.txtf_amat.value == "") {
        missinginfo += "\n El campo APELLIDO MATERNO no debe de estar vac�o";
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
    if (obj.txtf_rfc1.value == "") {
        missinginfo += "\n El campo RFC1 no debe de estar vac�o";
    }
    if (obj.txtf_rfc2.value == "") {
        missinginfo += "\n El campo RFC2 no debe de estar vac�o";
    }

    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GENERAR EL ID DE PACIENTE:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
        alert(missinginfo);
        return false;
    } else {
        return true;
    }

}
// fin verificaci�n UCI ------------------------------------------------------

// verifica TODO para Paciente
function verificaAll_Pac(obj) {
//alert("huge");
    missinginfo = "";
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El campo NOMBRE no debe de estar vac�o";
    }

    if (obj.txtf_apat.value == "") {
        missinginfo += "\n El campo APELLIDO PATERNO no debe de estar vac�o";
    }
    if (obj.txtf_amat.value == "") {
        missinginfo += "\n El campo APELLIDO MATERNO no debe de estar vac�o";
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
    if (obj.txtf_edad.value == "") {
        missinginfo += "\n El campo EDAD no debe de estar vac�o";
    }
    if (obj.txtf_sex.value == "") {
        missinginfo += "\n El campo SEXO no debe de estar vac�o";
    }

    if (obj.txtf_rfc1.value == "") {
        missinginfo += "\n El campo RFC1 no debe de estar vac�o";
    }
    if (obj.txtf_rfc2.value == "") {
        missinginfo += "\n El campo RFC2 no debe de estar vac�o";
    }
    if (obj.txtf_ent.value == "") {
        missinginfo += "\n El campo ESTADO no debe de estar vac�o";
    }
    if (obj.txtf_ciu.value == "") {
        missinginfo += "\n El campo CIUDAD no debe de estar vac�o";
    }

    if (obj.txtf_curp.value == "") {
        missinginfo += "\n El campo CURP no debe de estar vac�o";
    }
    if (obj.txtf_pai.value == "") {
        missinginfo += "\n El campo PA�S no debe de estar vac�o";
    }
    if (obj.txtf_nac.value == "") {
        missinginfo += "\n El campo NACIONALIDAD no debe de estar vac�o";
    }
    if (obj.txtf_est.value == "") {
        missinginfo += "\n El campo ESTADO CIVIL no debe de estar vac�o";
    }
    if (obj.txtf_prog.value == "") {
        missinginfo += "\n El campo PROGRAMA no debe de estar vac�o";
    }
    if (obj.txtf_afi.value == "") {
        missinginfo += "\n El campo NUMERO DE AFILIACION no debe de estar vac�o";
    }

    if (obj.txtf_id2.value == "") {
        missinginfo += "\n El campo ID no debe de estar vac�o";
    }
    if (obj.txtf_ocup.value == "") {
        missinginfo += "\n El campo OCUPACI�N no debe de estar vac�o";
    }
    if (obj.txtf_calle.value == "") {
        missinginfo += "\n El campo CALLE no debe de estar vac�o";
    }
    if (obj.txtf_noext.value == "") {
        missinginfo += "\n El campo N�MERO EXTERIOR no debe de estar vac�o";
    }
    if (obj.txtf_col.value == "") {
        missinginfo += "\n El campo COLONIA no debe de estar vac�o";
    }
    if (obj.txtf_cp.value == "") {
        missinginfo += "\n El campo C�DIGO POSTAL no debe de estar vac�o";
    }
    if (obj.txtf_fec.value == "") {
        missinginfo += "\n El campo FECHA no debe de estar vac�o";
    }
    if (obj.txtf_hor.value == "") {
        missinginfo += "\n El campo HORA no debe de estar vac�o";
    }


    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GUARDAR EL FORMULARIO:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
        alert(missinginfo);
        return false;
    } else {
        var reg1 = myFunction_pac(obj);

        if (reg1 == 1)
            return true;
        else
            return false;
    }


}

// FUNC
function verificaAll_CAR(obj) {
//alert("huge");
    missinginfo = "";
    if (obj.txtf_id.value == "") {
        missinginfo += "\n El campo ID DE PACIENTE no debe de estar vac�o";
    }


    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA CARGAR LOS DATOS:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
        alert(missinginfo);
        return false;
    } else {

        return true;
    }


}

// --- FIN FUNC


function myFunction_pac(obj) {
//alert("huge");
    var info = "\n HAS INTRODUCIDO LOS SIGUIENTES DATOS AL FORMULARIO:\n\n";
    var nom = "Nombre(s): " + obj.txtf_nom.value + "\n";
    var apat = "Apellido Paterno: " + obj.txtf_apat.value + "\n";
    var amat = "Apellido Materno: " + obj.txtf_amat.value + "\n";
    var fecha = "Fecha de Nacimiento\n" + "D�a: " + obj.txtf_dia.value + "\n" + "Mes: " + obj.txtf_mes.value + "\n" + "A�o: " + obj.txtf_anio.value + "\n";
    var edad = "Edad: " + obj.txtf_edad.value + "\n";
    var sex = "Sexo: " + obj.txtf_sex.value + "\n";
    var curp = "CURP: " + obj.txtf_curp.value + "\n";
    var rfc = "RFC: " + obj.txtf_rfc1.value + "-" + obj.txtf_rfc2.value + "\n\n";
    var cred = "Lugar de Nacimiento\n" + "Ciudad:" + obj.txtf_ciu.value + "\nEstado: " + obj.txtf_ent.value + "\nPa�s: " + obj.txtf_pai.value + "\nNacionalidad: " + obj.txtf_nac.value + "\nEstado Civil: " + obj.txtf_est.value + "\nPrograma de Afiliaci�n: " + obj.txtf_prog.value + "\nN�mero de Afiliaci�n: " + obj.txtf_afi.value + "\nID Paciente: " + obj.txtf_id1.value + "-" + obj.txtf_id2.value + "\n\n";

    var ocu = "Ocupaci�n\n" + "Se ocupa en: " + obj.txtf_ocup.value + "\n";
    var dom = "Domicilio: " + "Calle: " + obj.txtf_calle.value + "\n" + "No. Ext: " + obj.txtf_noext.value + " No. Int: " + obj.txtf_noint.value + "\n" + "Colonia: " + obj.txtf_col.value + "CP: " + obj.txtf_cp.value + "\n" + "Fecha de Elaboraci�n: " + obj.txtf_fec.value + "\n" + "Hora de Registro: " + obj.txtf_hor.value + "\n";

    var mens = "\n �DESEA GUARDAR LOS INFORMACI�N EN LA BASE DE DATOS?\n ACEPTAR = SI    CANCELAR = NO"
    info += nom + apat + amat + fecha + edad + sex + curp + rfc + cred + ocu + dom + mens;
    var x;
    var r = confirm(info);
    if (r == true) {
        //alert("si");//x="You pressed OK!";
        x = 1;
    }
    else {
        //alert("no");//x="You pressed Cancel!";
        x = 0;
    }
//document.getElementById("demo").innerHTML=x;
    return x;
}
// ---------------------------------------------------------------------------

// verifica TODO para M�dico
function verificaAll(obj) {

    missinginfo = "";
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El campo NOMBRE no debe de estar vac�o";
    }

    if (obj.txtf_apat.value == "") {
        missinginfo += "\n El campo APELLIDO PATERNO no debe de estar vac�o";
    }
    if (obj.txtf_amat.value == "") {
        missinginfo += "\n El campo APELLIDO MATERNO no debe de estar vac�o";
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
    if (obj.txtf_anio.value == "") {
        missinginfo += "\n El campo EDAD no debe de estar vac�o";
    }
    if (obj.txtf_sex.value == "") {
        missinginfo += "\n El campo SEXO no debe de estar vac�o";
    }
    if (obj.txtf_ciu.value == "") {
        missinginfo += "\n El campo CIUDAD no debe de estar vac�o";
    }
    if (obj.txtf_ent.value == "") {
        missinginfo += "\n El campo ENTIDAD no debe de estar vac�o";
    }
    if (obj.txtf_esp.value == "") {
        missinginfo += "\n El campo ESPECIALIDAD no debe de estar vac�o";
    }
    if (obj.txtf_tel1.value == "") {
        missinginfo += "\n El campo TELEFONO 1 no debe de estar vac�o";
    }
    if (obj.txtf_tel2.value == "") {
        missinginfo += "\n El campo TELEFONO 2 no debe de estar vac�o";
    }
    if (obj.txtf_tel3.value == "") {
        missinginfo += "\n El campo TIPO DE TELEFONO no debe de estar vac�o";
    }
    if (obj.txtf_correo.value == "") {
        missinginfo += "\n El campo CORREO no debe de estar vac�o";
    }

    if (obj.txtf_ced.value == "") {
        missinginfo += "\n El campo C�DULA no debe de estar vac�o";
    }
    if (obj.txtf_curp.value == "") {
        missinginfo += "\n El campo CURP no debe de estar vac�o";
    }

    if (obj.txtf_rfc1.value == "") {
        missinginfo += "\n El campo RFC1 no debe de estar vac�o";
    }
    if (obj.txtf_rfc2.value == "") {
        missinginfo += "\n El campo RFC2 no debe de estar vac�o";
    }
    if (obj.txtf_usu.value == "") {
        missinginfo += "\n El campo USUARIO no debe de estar vac�o";
    }
    if (obj.txtf_con.value == "") {
        missinginfo += "\n El campo CONTRASE�A no debe de estar vac�o";
    }
    if (obj.txtf_id2.value == "") {
        missinginfo += "\n El campo ID no debe de estar vac�o";
    }
    if (obj.txtf_uni.value == "") {
        missinginfo += "\n El campo UNIDAD M�DICA no debe de estar vac�o";
    }
    if (obj.txtf_mun.value == "") {
        missinginfo += "\n El campo MUNICIPIO no debe de estar vac�o";
    }
    if (obj.slct_tuni.value == "-- TIPO DE UNIDAD --") {
        missinginfo += "\n El campo TIPO DE UNIDAD no debe de estar vac�o";
    }
    if (obj.slct_clues.value == "-- CLUES --") {
        missinginfo += "\n El campo CLUES no debe de estar vac�o";
    }
    if (obj.txta_dom.value == "") {
        missinginfo += "\n El campo DOMICILIO no debe de estar vac�o";
    }


    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA GUARDAR EL FORMULARIO:\n" + missinginfo + "\n\n INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ\n";
        alert(missinginfo);
        return false;
    } else {
        var reg = myFunction(obj);

        if (reg == 1)
            return true;
        else
            return false;
    }


}

function myFunction(obj) {

    var info = "\n HAS INTRODUCIDO LOS SIGUIENTES DATOS AL FORMULARIO:\n\n";
    var nom = "Nombre(s): " + obj.txtf_nom.value + "\n";
    var apat = "Apellido Paterno: " + obj.txtf_apat.value + "\n";
    var amat = "Apellido Materno: " + obj.txtf_amat.value + "\n";
    var fecha = "Fecha de Nacimiento\n" + "D�a: " + obj.txtf_dia.value + "\n" + "Mes: " + obj.txtf_mes.value + "\n" + "A�o: " + obj.txtf_anio.value + "\n";
    var edad = "Edad: " + obj.txtf_edad.value + "\n";
    var sex = "Sexo: " + obj.txtf_sex.value + "\n";
    var ciu = "Ciudad: " + obj.txtf_ciu.value + "\n";
    var ent = "Entidad: " + obj.txtf_ent.value + "\n";
    var esp = "Especialidad: " + obj.txtf_esp.value + "\n";
    var tel = "Telefono: " + obj.txtf_tel1.value + "-" + obj.txtf_tel2.value + "\n";
    var tipo_tel = "Tipo de Tel�fono: " + obj.txtf_tel3.value + "\n";
    var correo = "Correo: " + obj.txtf_correo.value + "\n";
    var ced = "C�dula: " + obj.txtf_ced.value + "\n";
    var curp = "CURP: " + obj.txtf_curp.value + "\n";
    var rfc = "RFC: " + obj.txtf_rfc1.value + "-" + obj.txtf_rfc2.value + "\n\n";
    var cred = "Credenciales del Usuario\n" + "Usuario: " + obj.txtf_usu.value + "\nContrase�a: " + obj.txtf_con.value + "\nID del M�dico: " + obj.txtf_id1.value + "-" + obj.txtf_id2.value + "\n\n";
    var uni = "Datos Unidad M�dica\n" + "Nombre Unidad M�dica: " + obj.txtf_uni.value + "\n";
    var muni = "Municipio: " + obj.txtf_mun.value + "\n";
    var tipo = "Tipo de Unidad: " + obj.slct_tuni.value + "\n";
    var dom = "Domicilio: " + obj.txta_dom.value + "\n";
    var mens = "\n �DESEA GUARDAR LOS INFORMACI�N EN LA BASE DE DATOS?\n ACEPTAR = SI    CANCELAR = NO"
    info += nom + apat + amat + fecha + edad + sex + ciu + ent + esp + tel + tipo_tel + correo + ced + curp + rfc + cred + uni + muni + tipo + dom + mens;
    var x;
    var r = confirm(info);
    if (r == true) {
        //alert("si");//x="You pressed OK!";
        x = 1;
    }
    else {
        //alert("no");//x="You pressed Cancel!";
        x = 0;
    }
//document.getElementById("demo").innerHTML=x;
    return x;
}
// ---------------------------------------------------------------------------

// verifica curp campos vacios

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

// ---------------------------


function verificaMedico(obj) {

    missinginfo = "";
    if (obj.txtf_ced.value == "") {
        missinginfo += "\n La c�dula no debe de ir vacia.";
    }
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El nombre no debe de ir vacio.";
    }
    if (obj.txtf_pat.value == "") {
        missinginfo += "\n El apellido paterno no debe de ir vacio.";
    }

    if (obj.txtf_mat.value == "") {
        missinginfo += "\n El apellido materno no debe de ir vacio.";
    }


    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS:\n" + missinginfo + "\n\n �INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ!\n";
        alert(missinginfo);
        return false;
    } else {
        return true;
    }

}

// -----
function verificaUnidad_ID(obj) {
//alert("Ingreso ID"+obj.slct_uni.value);
    missinginfo = "";
    if (obj.slct_uni.value == "Unidad") {
        missinginfo += "\n Escoga una v�lida de la LISTA DE UNIDADES";
    }
    if (obj.txtf_id.value == "") {
        missinginfo += "\n Ingrese un ID DE PACIENTE";
    }

    if (missinginfo != "") {
        missinginfo = "\n NO SE HA ESCOGIDO LA UNIDAD DONDE SE ENCUENTRA EL USB O CAMPO VAC�O EN EL ID:\n" + missinginfo + "\n\n ESCOJA UNA UNIDAD DE ALMACENAMIENTO V�LIDA / INGRESE ID DEL PACIENTE\n";
        alert(missinginfo);
        return false;
    } else {
        return true;

    }


}

//--------

// -----
function verificaUnidad(obj) {

    missinginfo = "";
    if (obj.slct_uni.value == "Unidad") {
        missinginfo += "\n Escoga una v�lida de la LISTA DE UNIDADES";
    }

    if (missinginfo != "") {
        missinginfo = "\n NO SE HA ESCOGIDO LA UNIDAD DONDE SE ENCUENTRA EL USB:\n" + missinginfo + "\n\n ANTES DE IR AL PASO 2, ESCOGER UNA UNIDAD DE ALMACENAMIENTO VALIDO\n";
        alert(missinginfo);
        return false;
    } else {
        return true;

    }


}

//--------
