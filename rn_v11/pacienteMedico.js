function verificaPaciente(obj) {
    missinginfo = "";
    if (obj.txtf_noaf.value == "") {
        missinginfo += "\n El folio no debe estar vac\u00edo";
    }

    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El nombre no debe de ir vac\u00edo";
    }
    if (obj.txtf_ap.value == "") {
        missinginfo += "\n El apellido parteno no debe de ir vac\u00edo";
    }

    if (obj.txtf_am.value == "") {
        missinginfo += "\n El apellido materno no debe de ir vac\u00edo ";
    }


    if (obj.fecha_anov.value == "") {
        missinginfo += "\n El a\u00f1o de la fecha fin  de vigencia no debe de estar incompleta";
    }

    if (obj.fechadia_id.value == "") {
        missinginfo += "\n El d\u00eda de la fecha  de vigencia no debe de estar incompleta";
    }
    if (obj.fechames_id.value == "") {
        missinginfo += "\n El mes de la fecha  de vigencia no debe de estar incompleta";
    }
    if (obj.fechaano_id.value == "") {
        missinginfo += "\n El a\u00f1o de la fecha  de vigencia no debe de estar incompleta";
    }
    if (obj.fecha_diav.value == "") {
        missinginfo += "\n El d\u00eda de la fecha fin  de vigencia no debe de estar incompleta";
    }
    if (obj.fecha_mesv.value == "") {
        missinginfo += "\n El mes de la fecha fin  de vigencia no debe de estar incompleta";
    }
    if (obj.txtf_t1a.value == "") {
        missinginfo += "\n El d\u00eda de la fecha nacimiento  no debe de estar incompleta";
    }
    if (obj.txtf_t2a.value == "") {
        missinginfo += "\n El mes de la fecha nacimiento  no debe de estar incompleta";
    }
    if (obj.txtf_t3a.value == "") {
        missinginfo += "\n El a\u00f1o de la fecha nacimiento  no debe de estar incompleta";
    }
    if (obj.txtf_edad.value == "") {
        missinginfo += "\n El Campo Edad no debe de estar vac\u00edo";
    }
    if (obj.slct_sexo.value == "Escoja Genero") {
        missinginfo += "\n Escoja un Genero para el Paciente";
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
    var folio = "Folio: " + obj.txtf_noaf.value + "\n";
    var nom = "Nombre(s): " + obj.txtf_nom.value + "\n";
    var apat = "Apellido Paterno: " + obj.txtf_ap.value + "\n";
    var amat = "Apellido Materno: " + obj.txtf_am.value + "\n";
    var fecha = "Fecha de Nacimiento\n" + "D\u00eda: " + obj.txtf_t1a.value + "\n" + "Mes: " + obj.txtf_t2a.value + "\n" + "A\u00f1o: " + obj.txtf_t3a.value + "\n";
    var fecha_vi = "Fecha de Fin de Vigencia\n" + "D\u00eda: " + obj.fechadia_id.value + "\n" + "Mes: " + obj.fecha_mesv.value + "\n" + "A\u00f1o: " + obj.fecha_anov.value + "\n";
    var fecha_vif = "Fecha de Inicio de Vigencia\n" + "D\u00eda: " + obj.fecha_diav.value + "\n" + "Mes: " + obj.fechames_id.value + "\n" + "A\u00f1o: " + obj.fechaano_id.value + "\n";
    var edad = "Edad: " + obj.txtf_edad.value + "\n";
    var sexo = "Sexo: " + obj.slct_sexo.value + "\n\n";
    var mens = "DESEA GUARDAR LOS INFORMACION EN LA BASE DE DATOS?\n ACEPTAR = SI    CANCELAR = NO"
    info += folio + nom + apat + amat + fecha + fecha_vi + fecha_vif + edad + sexo + mens;
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


function verificaMedico(obj) {

    missinginfo = "";
    if (obj.txtf_ced.value == "") {
        missinginfo += "\n La c�dula no debe de ir vacia.";
    }
    if (obj.txtf_nom.value == "") {
        missinginfo += "\n El nombre no debe de ir vac\u00edo.";
    }
    if (obj.txtf_pat.value == "") {
        missinginfo += "\n El apellido paterno no debe de ir vac\u00edo.";
    }

    if (obj.txtf_mat.value == "") {
        missinginfo += "\n El apellido materno no debe de ir vac\u00edo.";
    }


    if (missinginfo != "") {
        missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS:\n" + missinginfo + "\n\n �INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ!\n";
        alert(missinginfo);
        return false;
    } else {
        return true;
    }

}