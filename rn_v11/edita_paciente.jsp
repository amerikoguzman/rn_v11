<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*"
         import="java.io.*" import="javax.swing.*" errorPage="" %>
<%
    /*------------------------------------------------------------------------------------------
    Nombre de archivo: paciente.jsp
    Funcion: Guarda datos del Paciente
      -----------------------------------------------------------------------------------------*/
// Conexión BDD vía JDBC
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit", "root", "eve9397");
    ResultSet rset = null;
    Statement stmt = conn__001.createStatement();
// fin conexión --------
// Variables de entorno
    String t1a_jv = "", t2a_jv = "", t3a_jv = "", t1b_jv = "", t2b_jv = "", t3b_jv = "", t1c_jv = "", t2c_jv = "", t3c_jv = "", noaf_jv = "", nom_jv = "", ap_jv = "", am_jv = "", fechana = "", fechaini = "", fechafin = "", nombre1_jv = "", programa_jv = "", nom_unidad = "", no_jur = "", edad = "", sexo_jv = "", mensaje = "", noafa_jv = "";
    String but = "r";
// fin variables
// si se oprime el botón 
    try {
        but = "" + request.getParameter("Submit");
    } catch (Exception e) {
        System.out.print("not");
    }
// inicio proceso guardar	
    if (but.equals("Guardar")) {
        noaf_jv = request.getParameter("txtf_noaf");
        noafa_jv = request.getParameter("txtf_noaf2");
        nom_jv = request.getParameter("txtf_nom");
        ap_jv = request.getParameter("txtf_ap");
        am_jv = request.getParameter("txtf_am");
        t1a_jv = request.getParameter("txtf_t1a");
        t2a_jv = request.getParameter("txtf_t2a");
        t3a_jv = request.getParameter("txtf_t3a");
        t1b_jv = request.getParameter("txtf_t1b");
        t2b_jv = request.getParameter("txtf_t2b");
        t3b_jv = request.getParameter("txtf_t3b");
        t1c_jv = request.getParameter("txtf_t1c");
        t2c_jv = request.getParameter("txtf_t2c");
        t3c_jv = request.getParameter("txtf_t3c");
        programa_jv = request.getParameter("programa");
        edad = request.getParameter("txtf_edad");
        sexo_jv = request.getParameter("slct_sexo");
        fechana = t3a_jv + "-" + t2a_jv + "-" + t1a_jv;
        fechaini = t3b_jv + "-" + t2b_jv + "-" + t1b_jv;
        fechafin = t3c_jv + "-" + t2c_jv + "-" + t1c_jv;
        nombre1_jv = nom_jv + " " + ap_jv + " " + am_jv;
        //out.print("update seguro_p2 set folio='"+noaf_jv+"', a_paterno='"+ap_jv+"', a_materno='"+am_jv+"', nombre1='"+nom_jv+"', nombre='"+nombre1_jv+"', f_inicio='"+fechaini+"', f_fin='"+fechafin+"', programa= '"+programa_jv+"', edad='"+edad+"', fecha_naci='"+fechana+"',sexo='"+sexo_jv+"' where folio='"+noaf_jv+"';");
        stmt.execute("update seguro_p2 set folio='" + noaf_jv + "', a_paterno='" + ap_jv + "', a_materno='" + am_jv + "', nombre1='" + nom_jv + "', nombre='" + nombre1_jv + "', f_inicio='" + fechaini + "', f_fin='" + fechafin + "', programa= '" + programa_jv + "', edad='" + edad + "', fecha_naci='" + fechana + "',sexo='" + sexo_jv + "' where folio='" + noafa_jv + "';");


%>
<script>
    alert("DATOS GUARDADOS")
</script>
<%
    }
// fin proceso guardar -------------------------------


//-----------------Eliminar-------------------------------------

    if (but.equals("Eliminar")) {
        noaf_jv = request.getParameter("txtf_noaf");
        String qry_elimina = "delete from seguro_p2 where folio='" + noaf_jv + "'";
        //out.print(qry_elimina);
        stmt.execute(qry_elimina);
        noaf_jv = "";

%>
<script>
    alert("REGISTRO ELIMINADO");
    location.href = "edita_paciente.jsp";
</script>
<%

    }

//------------------------------------------------------

//out.print(but);
    String folio = "", nombre = "", ape_pat = "", ape_mat = "", nacimiento = "", edad1 = "", sexo = "", programa = "", vig_ini = "", vig_fin = "", anio1 = "", mes1 = "", dia1 = "", id = "";

    if (but.equals("Ver")) {
        folio = request.getParameter("txtf_noaf2");
        //out.print(folio);
        if (folio == null) {
            folio = "";
        }
        String qry_paciente = "select * from seguro_p2 where folio= '" + folio + "'";

        rset = stmt.executeQuery(qry_paciente);
        while (rset.next()) {
            nombre = rset.getString("nombre1");
            ape_pat = rset.getString("a_paterno");
            ape_mat = rset.getString("a_materno");
            nacimiento = rset.getString("fecha_naci");
            edad1 = rset.getString("edad");
            sexo = rset.getString("sexo");
            programa = rset.getString("programa");
            vig_ini = rset.getString("f_inicio");
            vig_fin = rset.getString("f_fin");
            id = rset.getString("id");

            String token = "";//out.print(ruta);
            StringTokenizer ruta_token = new StringTokenizer(nacimiento, "-");
            //out.print(ruta_token.lenght);
            while (ruta_token.hasMoreTokens()) {
                anio1 = ruta_token.nextToken();
                mes1 = ruta_token.nextToken();
                dia1 = ruta_token.nextToken();
            }
        }
        if (nombre.equals("")) {
            folio = "";
%>
<script>alert("Folio Inexistente");</script>
<%
        }
    }


%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>.: Crear Nuevo Paciente:.</title>

    <script language="javascript" src="pacienteMedico.js"></script>
    <script language="javascript" src="list02.js"></script>

    <link rel="stylesheet" href="mm_restaurant1.css" type="text/css"/>
</head>

<body>
<form id="form" name="form" method="post" action="edita_paciente.jsp">
    <table width="650" height="335" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
        <tr>
            <td width="731">
                <table width="650" height="478" border="0" align="center" cellpadding="2">
                    <tr>
                        <th width="142" height="82" scope="row"><label><img src="imagenes/nay_ima1.jpg" width="142"
                                                                            height="72"/><br/>
                        </label></th>
                        <td colspan="2">
                            <div align="center" class="pageHeader style7">
                                <p class="style8">Editar al Paciente </p>
                            </div>
                            <label></label>
                            <label></label></td>
                        <td width="163"><img src="imagenes/ssn.jpg" width="162" height="78"/></td>
                    </tr>
                    <tr>
                        <th height="14" colspan="4" bgcolor="#EC3237" scope="row"><span class="style11"></span></th>
                    </tr>
                    <tr>
                        <th height="26" scope="row">
                            <div align="center"></div>
                        </th>
                        <td width="161">
                            <div align="left" class="Estilo1"><strong>No. AFILIACION</strong>:</div>
                        </td>
                        <td width="158"><input name="txtf_noaf2" type="text" id="txtf_noaf2"
                                               onkeypress="validar(event);" value="<%=folio%>"/></td>
                        <td><input type="submit" name="Submit" value="Ver"/></td>
                    </tr>
                    <tr>
                        <th height="26" scope="row">&nbsp;</th>
                        <td><span class="style5">
                                        <label></label>
                                    </span>

                            <div align="left" class="Estilo1"><strong>Nuevo No. AFILIACION</strong>:
                            </div>
                        </td>
                        <td><input name="txtf_noaf" type="text" id="txtf_noaf" onKeyPress="validar(event);"
                                   value="<%=folio%>"/></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="26" scope="row">&nbsp;</th>
                        <td class="bodyText">
                            <div align="left" class="Estilo1"><strong>NOMBRE(s)</strong>:
                                <label></label>
                            </div>
                        </td>
                        <td><span class="bodyText"><span class="style5">
                                            <input name="txtf_nom" type="text" id="txtf_nom"
                                                   onKeyPress="return handleEnter(this, event)"
                                                   onChange="mayNom(this.form)" value="<%=nombre%>"/>
                                        </span></span></td>
                        <td><input type="submit" name="Submit" value="Eliminar"
                                   onClick="return confirm('Desea Eliminarlo');"/></td>
                    </tr>
                    <tr>
                        <th height="26" scope="row">&nbsp;</th>
                        <td class="bodyText">
                            <div align="left" class="Estilo1"><strong>APELLIDO PATERNO:</strong>
                                <label></label>
                            </div>
                        </td>
                        <td><span class="bodyText"><span class="style5">
                                            <input name="txtf_ap" type="text" id="txtf_ap"
                                                   onKeyPress="return handleEnter(this, event)"
                                                   onChange="mayApep(this.form)" value="<%=ape_pat%>"/>
                                        </span></span></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="26" scope="row">&nbsp;</th>
                        <td class="bodyText">
                            <div align="left" class="Estilo1"><strong>APELLIDO MATERNO:</strong>
                                <label></label>
                            </div>
                        </td>
                        <td><span class="bodyText"><span class="style5">
                                            <input name="txtf_am" type="text" id="txtf_am"
                                                   onKeyPress="return handleEnter(this, event)"
                                                   onChange="mayApem(this.form)" value="<%=ape_mat%>"/>
                                        </span></span></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="28" scope="row">&nbsp;</th>
                        <td class="bodyText">
                            <div align="left" class="Estilo1">FECHA DE NACIMIENTO:</div>
                        </td>
                        <td><span class="bodyText"><div align="left" class="Estilo1">

                            <input name="txtf_t1a" id="txtf_t1a" type="text"
                                   onKeyPress="return handleEnter(this, event)" onKeyUp="putDaysa()" size="1"
                                   maxlength="2" value="<%=dia1%>"/>
                            <strong> /</strong>
                            <input name="txtf_t2a" id="txtf_t2a" type="text" size="1" maxlength="2"
                                   onKeyUp="putMonthssa()" onKeyPress="return handleEnter(this, event)"
                                   value="<%=mes1%>"/>
                            <strong> /</strong>
                            <input name="txtf_t3a" id="txtf_t3a" type="text" size="2" maxlength="4"
                                   onKeyUp="putYearssa(this.form)" onKeyPress="return handleEnter(this, event)"
                                   value="<%=anio1%>"/>
                        </div></span></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="26" scope="row">&nbsp;</th>
                        <td class="bodyText">
                            <div align="left" class="Estilo1"><strong>EDAD:</strong>
                                <label></label>
                            </div>
                        </td>
                        <td><span class="bodyText"><span class="style5">
                                            <input name="txtf_edad" type="text" id="txtf_edad"
                                                   onKeyPress="return handleEnter(this, event)" size="1"
                                                   value="<%=edad1%>"/>
                                        </span></span></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="26" scope="row">&nbsp;</th>
                        <td class="bodyText">
                            <div align="left" class="Estilo1"><strong>SEXO:</strong>
                                <label></label>
                            </div>
                        </td>
                        <td>
                            <select name="slct_sexo" id="slct_sexo" class="style13"
                                    onChange="focus_inicioVig(this.form)">
                                <option value = "Escoja Genero">-- Escoja G&eacute;nero --</option>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
                            </select></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="23" scope="row">&nbsp;</th>
                        <td class="style5">
                            <div align="left" class="Estilo1">PROGRAMA:</div>
                        </td>
                        <td class="style5"><select name="programa" class="style13">
                            <option value="SP">SEGURO POPULAR</option>
                            <option value="PA">POBLACION ABIERTA</option>
                            <option value="OP">OPORTUNIDADES</option>

                        </select></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="11" scope="row">&nbsp;</th>
                        <td bordercolor="#FF0000" bgcolor="#CCCCCC" class="style5">
                            <div align="left" class="Estilo1">DATOS DE LA POLIZA</div>
                        </td>
                        <td class="style5">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <%
                        StringTokenizer ruta_token = new StringTokenizer(vig_ini, "-");
                        while (ruta_token.hasMoreTokens()) {
                            anio1 = ruta_token.nextToken();
                            mes1 = ruta_token.nextToken();
                            dia1 = ruta_token.nextToken();
                        }
                    %>
                    <tr>
                        <th height="13" scope="row">&nbsp;</th>
                        <td>
                            <div align="left" class="Estilo1"><strong>FECHA DE INICIO VIGENCIA </strong>:</div>
                        </td>
                        <td>
                            <div align="left" class="Estilo1">

                                <input name="txtf_t1b" type="text" id="fechadia_id"
                                       onKeyPress="return handleEnter(this, event)" onKeyUp="putDaysb()" size="1"
                                       maxlength="2" value="<%=dia1%>"/>
                                <strong> /</strong>
                                <input name="txtf_t2b" type="text" id="fechames_id" size="1" maxlength="2"
                                       onKeyUp="putMonthssb()" onKeyPress="return handleEnter(this, event)"
                                       value="<%=mes1%>"/>
                                <strong> /</strong>
                                <input name="txtf_t3b" type="text" id="fechaano_id" size="2" maxlength="4"
                                       onKeyUp="putYearssb(this.form)" onKeyPress="return handleEnter(this, event)"
                                       value="<%=anio1%>"/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <%
                        StringTokenizer ruta_token2 = new StringTokenizer(vig_fin, "-");
                        while (ruta_token2.hasMoreTokens()) {
                            anio1 = ruta_token2.nextToken();
                            mes1 = ruta_token2.nextToken();
                            dia1 = ruta_token2.nextToken();
                        }
                    %>
                    <tr>
                        <th height="26" scope="row">&nbsp;</th>
                        <td>
                            <div align="left" class="Estilo1"><strong>FECHA DE FIN VIGENCIA </strong>:</span></div>
                        </td>
                        <td>
                            <div align="left" class="Estilo1">

                                <input name="txtf_t1c" id="fecha_diav" type="text"
                                       onKeyPress="return handleEnter(this, event)" onKeyUp="putDaysc()" size="1"
                                       maxlength="2" value="<%=dia1%>"/>
                                <strong> /</strong>
                                <input name="txtf_t2c" id="fecha_mesv" type="text" size="1" maxlength="2"
                                       onKeyUp="putMonthssc()" onKeyPress="return handleEnter(this, event)"
                                       value="<%=mes1%>"/>
                                <strong> /</strong>
                                <input name="txtf_t3c" id="fecha_anov" type="text" size="2" maxlength="4"
                                       onKeyUp="putYearssc(this.form)" onKeyPress="return handleEnter(this, event)"
                                       value="<%=anio1%>"/>
                            </div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="18" scope="row">&nbsp;</th>
                        <td colspan="2">
                            <div align="center"></div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th height="47" scope="row">&nbsp;</th>
                        <td colspan="2">
                            <div align="center">
                                <input type="submit" name="Submit" value="Guardar"
                                       onClick="return verificaPaciente(document.forms.form)"/>
                                &nbsp;Cerrar Aplicaci&oacute;n
                                <button name="boton" type="button" class="style7" onClick="CloseWin()"/>
                                <img src="imagenes/borr.jpg"/></button></div>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <p>&nbsp;</p>

    <p>&nbsp;</p>
</form>
<%
    // ----- try que cierra la conexión a la base de datos
    try {
        // Se cierra la conexión dentro del try
        conn__001.close();
    } catch (Exception e) {
        mensaje = e.toString();
    } finally {
        if (conn__001 != null) {
            conn__001.close();
            if (conn__001.isClosed()) {
                mensaje = "desconectado2";
            }
        }
    }
    //out.print(mensaje);
    // ---- fin de la conexión

%>
</body>
</html>
