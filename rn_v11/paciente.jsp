<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddHHmmss"); %>
<%
/*------------------------------------------------------------------------------------------
Nombre de archivo: paciente.jsp
Funcion: Guarda datos del Paciente
  -----------------------------------------------------------------------------------------*/
// Conexi�n BDD v�a JDBC
Class.forName("org.gjt.mm.mysql.Driver"); 
Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
Statement stmt = conn__001.createStatement();
ResultSet rset=null;
// fin conexi�n --------
// Variables de entorno
String t1a_jv="",t2a_jv="",t3a_jv="",t1b_jv="",t2b_jv="",t3b_jv="",t1c_jv="",t2c_jv="",t3c_jv="",noaf_jv="",nom_jv="",ap_jv="",am_jv="",fechana="",fechaini="",fechafin="",nombre1_jv="",programa_jv="",nom_unidad="",no_jur="",edad="",sexo_jv="",mensaje="";
String but="r";
// fin variables
// si se oprime el bot�n 
try { 
     but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
// inicio proceso guardar	
	if(but.equals("Guardar"))
     {
		 int ban_pac=0;
	   noaf_jv=request.getParameter("txtf_noaf");
	   nom_jv=request.getParameter("txtf_nom");
	   ap_jv=request.getParameter("txtf_ap");
	   am_jv=request.getParameter("txtf_am");
	   t1a_jv=request.getParameter("txtf_t1a");
	   t2a_jv=request.getParameter("txtf_t2a");
	   t3a_jv=request.getParameter("txtf_t3a");
	   t1b_jv=request.getParameter("txtf_t1b");
	   t2b_jv=request.getParameter("txtf_t2b");
	   t3b_jv=request.getParameter("txtf_t3b");
	   t1c_jv=request.getParameter("txtf_t1c");
	   t2c_jv=request.getParameter("txtf_t2c");
	   t3c_jv=request.getParameter("txtf_t3c");
	   programa_jv=request.getParameter("programa");
	   edad=request.getParameter("txtf_edad");
	   sexo_jv=request.getParameter("slct_sexo");
	   fechana=t3a_jv+t2a_jv+t1a_jv;
	   fechaini=t3b_jv+t2b_jv+t1b_jv;
	   fechafin=t3c_jv+t2c_jv+t1c_jv;
	   nombre1_jv=nom_jv+" "+ap_jv+" "+am_jv;
	   
	   String qry_comp_med="select folio from seguro_p2 where folio = '"+noaf_jv+"'";
		rset = stmt.executeQuery(qry_comp_med);
		while (rset.next()) {
			ban_pac = 1;
		}
		
		if (ban_pac==0){
		   if (programa_jv.equals("SP")){
			  stmt.execute("insert into seguro_p2 values ('"+noaf_jv+"','"+ap_jv+"','"+am_jv+"','"+nom_jv+"','"+nombre1_jv+"','-','-','-','"+fechaini+"','"+fechafin+"','"+programa_jv+"','"+edad+"','"+fechana+"','-','"+sexo_jv+"',0)");
		   }
		   else {
			   noaf_jv=programa_jv+df.format(new java.util.Date());
			   stmt.execute("insert into seguro_p2 values ('"+noaf_jv+"','"+ap_jv+"','"+am_jv+"','"+nom_jv+"','"+nombre1_jv+"','-','-','-','2001-01-01','2050-01-01','"+programa_jv+"','"+edad+"','"+fechana+"','-','"+sexo_jv+"',0)");
		   }
		   %>
		   <script>
		   alert("DATOS GUARDADOS")
		   </script>
		   <%
		} else {
			%>
		   <script>
		   alert("Paciente YA EXISTENTE, Folio: <%=noaf_jv%>")
		   </script>
		   <%
		}
     }
// fin proceso guardar -------------------------------
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Crear Nuevo Paciente:.</title>

<script language="javascript" src="pacienteMedico.js"></script>
<script language="javascript" src="list02.js"></script>
<script>

function inicio(){
	document.getElementById('mensaje').style.display="none";
}

function tipo_ser(val) {
	
	if (val!="SP"){
		document.getElementById('f_ini_div').disabled=true;
		document.getElementById('f_fin_div').disabled=true;
		document.getElementById('txtf_noaf').disabled=true;
		document.getElementById('txtf_noaf').value="-";
		document.getElementById('fechadia_id').value="00";
		document.getElementById('fechames_id').value="00";
		document.getElementById('fechaano_id').value="0000";
		document.getElementById('fecha_diav').value="00";
		document.getElementById('fecha_mesv').value="00";
		document.getElementById('fecha_anov').value="0000";
		document.getElementById('mensaje').style.display="block";
		document.getElementById('txtf_noaf').focus();
	}
	else {
		document.getElementById('f_ini_div').disabled=false;
		document.getElementById('f_fin_div').disabled=false;
		document.getElementById('txtf_noaf').disabled=false;
		document.getElementById('mensaje').style.display="none";
	}
}
</script>

<link rel="stylesheet" href="mm_restaurant1.css" type="text/css" />
</head>

<body onload="inicio()">
<form id="form" name="form" method="post" action="paciente.jsp">
  <table width="650" height="335" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
    <tr>
      <td width="731"><table width="650" height="478" border="0" align="center" cellpadding="2">
        <tr>
          <th width="142" height="82" scope="row"><label><img src="imagenes/nay_ima1.jpg" width="142" height="72" /><br />
          </label></th>
          <td colspan="2"><div align="center" class="pageHeader style7">
              <p class="style8">Datos del Paciente </p>
          </div>
            <label></label>
            <label></label></td>
          <td width="163"><img src="imagenes/ssn.jpg" width="162" height="78" /></td>
        </tr>
        <tr>
          <th height="14" colspan="4" bgcolor="#EC3237" scope="row">&nbsp;</th>
          </tr>
        <tr>
          <th height="26" colspan="4" scope="row"><div align="center" style="font-size:12px" >*Si el paciente es de OP o PA NO CAPTURAR No. de Afiliaci&oacute;n, ESCOJA PROGRAMA*</div></th>
          </tr>
        <tr>
          <th height="26" scope="row">&nbsp;</th>
          <td width="161"><span class="style5">
            <label></label>
            </span><div align="left" class="Estilo1"><strong>No. AFILIACION</strong>:
            </div></td>
          <td width="158"><input name="txtf_noaf" type="text" id="txtf_noaf"  onKeyPress="validar(event);"/></td>
          <td><div id="mensaje" >Se generar&aacute; Autom&aacute;ticmaente el no. de Afiliaci&oacute;n</div></td>
        </tr>
        <tr>
          <th height="26" scope="row">&nbsp;</th>
          <td class="bodyText"><div align="left" class="Estilo1"><strong>NOMBRE(s)</strong>:
            <label></label>
          </div></td>
          <td><span class="bodyText"><span class="style5">
            <input name="txtf_nom" type="text" id="txtf_nom" onKeyPress="return handleEnter(this, event)" onChange="mayNom(this.form)"/>
          </span></span></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="26" scope="row">&nbsp;</th>
          <td class="bodyText"><div align="left" class="Estilo1"><strong>APELLIDO PATERNO:</strong>
                <label></label>
          </div></td>
          <td><span class="bodyText"><span class="style5">
            <input name="txtf_ap" type="text" id="txtf_ap" onKeyPress="return handleEnter(this, event)" onChange="mayApep(this.form)"/>
          </span></span></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="26" scope="row">&nbsp;</th>
          <td class="bodyText"><div align="left" class="Estilo1"><strong>APELLIDO MATERNO:</strong>
              <label></label>
          </div></td>
          <td><span class="bodyText"><span class="style5">
            <input name="txtf_am" type="text" id="txtf_am" onKeyPress="return handleEnter(this, event)" onChange="mayApem(this.form)"/>
          </span></span></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="28" scope="row">&nbsp;</th>
          <td class="bodyText"><div align="left" class="Estilo1">FECHA DE NACIMIENTO: </div></td>
          <td><span class="bodyText"><div align="left" class="Estilo1">
            
                  <input name="txtf_t1a" id="txtf_t1a" type="text" onKeyPress="return handleEnter(this, event)" onKeyUp="putDaysa()"  size="1" maxlength="2"/>
			        <strong>                    /</strong>
                    <input name="txtf_t2a" id="txtf_t2a" type="text" size="1" maxlength="2" onKeyUp="putMonthssa()"  onKeyPress="return handleEnter(this, event)" />
                    <strong>                    /</strong>
                    <input name="txtf_t3a" id="txtf_t3a" type="text" size="2" maxlength="4" onKeyUp="putYearssa(this.form)" onKeyPress="return handleEnter(this, event)" />
          </div></span></td>
          <td>&nbsp;</td>
        </tr>
		<tr>
          <th height="26" scope="row">&nbsp;</th>
          <td class="bodyText"><div align="left" class="Estilo1"><strong>EDAD:</strong>
              <label></label>
          </div></td>
          <td><span class="bodyText"><span class="style5">
            <input name="txtf_edad" type="text" id="txtf_edad" onKeyPress="return handleEnter(this, event)" size="1"/>
          </span></span></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="26" scope="row">&nbsp;</th>
          <td class="bodyText"><div align="left" class="Estilo1"><strong>SEXO:</strong>
              <label></label>
          </div></td>
          <td>
            <select name="slct_sexo" id="slct_sexo" class="style13" onChange="focus_inicioVig(this.form)">
              <option value="Escoja Genero">-- Escoja G&eacute;nero --</option>
              <option value="M">Masculino</option>
              <option value="F">Femenino</option>
            </select></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="23" scope="row">&nbsp;</th>
          <td class="style5"><div align="left" class="Estilo1">PROGRAMA: </div></td>
          <td class="style5"><select name="programa" class="style13" id="programa" onchange="tipo_ser(this.value);" >
                                <option value="SP">SEGURO POPULAR</option>
                                <option value="PA">POBLACION ABIERTA</option>
								<option value="OP">OPORTUNIDADES</option>
                              </select></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="11" scope="row">&nbsp;</th>
          <td bordercolor="#FF0000" bgcolor="#CCCCCC" class="style5"><div align="left" class="Estilo1">DATOS DE LA POLIZA</div></td>
          <td class="style5">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="13" scope="row">&nbsp;</th>
          <td><div align="left" class="Estilo1"><strong>FECHA DE INICIO VIGENCIA </strong>: </div></td>
          <td><div align="left" class="Estilo1" id="f_ini_div">
            
                  <input name="txtf_t1b" type="text" id="fechadia_id" onKeyPress="return handleEnter(this, event)" onKeyUp="putDaysb()"  size="1" maxlength="2"/>
			        <strong>                    /</strong>
                    <input name="txtf_t2b" type="text" id="fechames_id" size="1" maxlength="2" onKeyUp="putMonthssb()"  onKeyPress="return handleEnter(this, event)" />
                    <strong>                    /</strong>
                    <input name="txtf_t3b" type="text" id="fechaano_id" size="2" maxlength="4" onKeyUp="putYearssb(this.form)"  onKeyPress="return handleEnter(this, event)" />
          </div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="26" scope="row">&nbsp;</th>
          <td><div align="left" class="Estilo1"><strong>FECHA DE FIN VIGENCIA </strong>:</span></div></td>
          <td><div align="left" class="Estilo1" id="f_fin_div">
            
                  <input name="txtf_t1c" id="fecha_diav" type="text" onKeyPress="return handleEnter(this, event)" onKeyUp="putDaysc()"  size="1" maxlength="2"/>
			        <strong>                    /</strong>
                    <input name="txtf_t2c"  id="fecha_mesv" type="text" size="1" maxlength="2" onKeyUp="putMonthssc()"  onKeyPress="return handleEnter(this, event)" />
                    <strong>                    /</strong>
                    <input name="txtf_t3c"  id="fecha_anov" type="text" size="2" maxlength="4" onKeyUp="putYearssc(this.form)"  onKeyPress="return handleEnter(this, event)" />
          </div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="18" scope="row">&nbsp;</th>
          <td colspan="2"><div align="center"><a href="edita_paciente.jsp" target="_blank">Editar Paciente</a></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="47" scope="row">&nbsp;</th>
          <td colspan="2"><div align="center">
            <input type="submit" name="Submit" value="Guardar" onClick="return verificaPaciente(document.forms.form)" />
          &nbsp;Cerrar Aplicaci�n <button name="boton" type="button" class="style7" onClick="CloseWin()" /><img src="imagenes/borr.jpg" /></button></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th height="47" scope="row">&nbsp;</th>
          <td colspan="2"><div align="left">
          	
            <%
			String fechana2=t1a_jv+"/"+t2a_jv+"/"+t3a_jv;
			if(but.equals("Guardar")){
				out.print("Paciente Capturado:<br>");
				out.print("No de Afiliaci�n: "+noaf_jv);
				out.print("<br>Nombre: "+nombre1_jv);
				out.print("<br>Fecha de nacimiento:"+fechana2);
			}
			%>
            </div></td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
<%
// ----- try que cierra la conexi�n a la base de datos
		 try{
               // Se cierra la conexi�n dentro del try
                 conn__001.close();
	          }catch (Exception e){mensaje=e.toString();}
           finally{ 
               if (conn__001!=null){
                   conn__001.close();
		                if(conn__001.isClosed()){
                             mensaje="desconectado2";}
                 }
             }
			 //out.print(mensaje);
		// ---- fin de la conexi�n	 	  

%>
</body>
</html>
