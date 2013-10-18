<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.DecimalFormat" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<%
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: inv_lyc.jsp
Función      : Muestra las existencias del Inventario. 
   ---------------------------------------------------------------------------------------------------- */
//Conexión a la BDD vía JDBC	
  Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost:3306/r_nayarit","root","eve9397");
  Statement stmt = conn__001.createStatement();
  Statement stmt01 = conn__001.createStatement();
  Statement stmt02 = conn__001.createStatement();
  ResultSet rset_001=null;
  ResultSet rset_002=null;
//fin conexión ----------------------------------------------------------------------------------------
// Variables de entorno
String noaf_jv="",nom_jv="",ap_jv="",ap5_jv="",am_jv="",nombre1_jv="",clave_jv="",clave2_jv="",descrip_jv="",origen_jv="",exist_jv="",origen2="",exist2_jv="0",total22_jv="",clave22_jv="",origen22_jv="",descrip22_jv="";
String cant_ps_jv="", clave_ps_jv="", total_cant="", total_cajas="", total_resto="",mensaje="";
int tot_cajas_int=0, tot_resto_int=0;
String but="r";
int cont6=0,am2_jv=0,exist=0,ap2_jv=0,total=0,ban_0=0;
String clave1_jv="",descrip1_jv="",origen1_jv="",exist1_jv="";
NumberFormat nf1 = NumberFormat.getInstance(Locale.US);
// fin variables --------------------------------------------------
// try para obtener valores del botón oprimido
try { 
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
// fin try ---------------------------------------

// proceso omitir 0
if(but.equals("Omitir Existencias en 0"))
     {
		//out.print("Ingreso");
		ban_0=1;
	 }
// fin proceso
// proceso Restaurar
if(but.equals("Existencias con 0"))
     {
		//out.print("Ingreso");
		ban_0=0;
	 }
// fin proceso Restaurar
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: INVENTARIO UNIDAD:.</title>
<script language="javascript" src="list02.js">
function close1()
{//alert("huge");
top.close();  
/*if(navigator.appName=="Microsoft Internet Explorer") { 
this.focus();self.opener = this;self.close(); } 
else { window.open('','_parent',''); window.close(); } 

*/
}
</script>
<script>
function foco_inicial(){
if (document.form.txtf_clave2.value==""){
document.form.txtf_clave.focus();
}
else
{
document.form.txtf_cant.focus();
}
}
</script>
<link rel="stylesheet" href="mm_restaurant1.css" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #E6E6E6;
}
.style1 {color: #000000}
.style2 {
	font-size: 8px;
	color: #009999;
}
.style5 {font-size: 36}
.Estilo8 {
	color: #FFFBF0;
	font-weight: bold;
}
.Estilo9 {font-size: 14px}
.Estilo10 {
	font-size: 12px;
	font-weight: bold;
}
.Estilo11 {font-size: 12px}
.Estilo12 {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}
.Estilo13 {color: #009999}
.Estilo14 {color: #FFFFFF; font-size: 14px; }
-->
</style></head>
<body onLoad="foco_inicial();">
<table width="850" height="346" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
  <tr>
    <td width="650"><form id="form" name="form" method="post" action="inv_lyc.jsp">
        <a href="index.jsp">Regresar a Menú </a>
        <table width="836" height="227" border="0" align="center" cellpadding="2">
        <tr>
          <td height="90" colspan="8" bgcolor="#FFFFFF" class="logo style1">
            <div align="center">
  <img src="imagenes/nay_ima1.jpg" width="142" height="72" />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="Arriba" id="Arriba"></a>&nbsp;Inventario Unidad*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <img src="imagenes/ssn.jpg" width="162" height="78" />
            </div></td>
          </tr>
        <tr>
          <td height="14" colspan="8" bgcolor="#D51045"><span class="style2"><span class="Estilo8"><!--span class="Estilo9">Exportar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span--><!--img src="icono_excel.gif" border="0" usemap="#Map2"/-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span class="Estilo8">&nbsp;&nbsp;<span class="Estilo8"><a href="#Total" class="Estilo8">Ir a Totales</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Exportar a Excel&nbsp;&nbsp;<img src="imagenes/exc.jpg" width="37" height="29" usemap="#Map" border="0" /></span></td>
          </tr>
        <tr>
          <td height="33">&nbsp;</td>
          <td class="bodyText">&nbsp;</td>
          <td colspan="4" align="center"><input name="Submit" type="submit" class="subHeader" value="Omitir Existencias en 0" />&nbsp;&nbsp;<input name="Submit" type="submit" class="subHeader" value="Existencias con 0" /></td>
          </tr>
        <tr>
          <td height="33"><div align="center">CLAVE</div></td>
          <td class="bodyText"><div align="center">DESCRIPCI&Oacute;N</div></td>
          <td><div align="center">LOTE</div></td>
          <td>CADUCIDAD</td>
          <td align="center">CAJAS</td>
          <td><div align="center">ORIGEN</div></td>
        </tr>
		<%
		rset_002=stmt02.executeQuery("select sum(existencias) as suma from inventario_uni ");
		while(rset_002.next())
		{
			total_cant=rset_002.getString("suma");
		}
		if(ban_0==0){
		rset_002=stmt02.executeQuery("select clave,descrip,lote,caducidad,existencias,origen from inventario_uni order by (clave+0),origen+0  ");}
		else
		{rset_002=stmt02.executeQuery("select clave,descrip,lote,caducidad,existencias,origen from inventario_uni where existencias!=0 order by (clave+0),origen+0  ");	}
		
		cant_ps_jv="1";
		while(rset_002.next())
		{
		    clave_jv=rset_002.getString("clave");
			rset_001=stmt01.executeQuery("select clave, cant from pasti_ampu where clave='"+clave_jv+"';");
			while (rset_001.next()){
			
				cant_ps_jv=rset_001.getString("cant");
				clave_ps_jv=rset_001.getString("clave");
			}
		  
		  int cantidad = Integer.parseInt(cant_ps_jv);
		  int presentacion = Integer.parseInt(rset_002.getString("existencias"));
		  int cajas=presentacion/cantidad;
		  int resto=presentacion%cantidad;
		  tot_cajas_int+=cajas;
		  tot_resto_int+=resto;
		  total_cajas=String.valueOf(tot_cajas_int);
		  total_resto=String.valueOf(tot_resto_int);
		  %>
        <tr>
          <td width="85" height="20"><div align="center"><%=rset_002.getString("clave")%></div></td>
          <td width="360" class="bodyText" align="center"><%=rset_002.getString("descrip")%></td>
          <td width="120"><div align="center" class="Estilo10"><%=rset_002.getString("lote")%></div></td>
          <td width="77" align="center"><%=rset_002.getString("caducidad")%></td>
          <td width="85" align="center"><span class="Estilo10"><%=nf1.format(cajas)%></span></td>
          <td width="71"><div align="center"><%=rset_002.getString("origen")%></div></td>
        </tr>
		<%
		cant_ps_jv="1";
		}
		total_cajas=String.valueOf(tot_cajas_int);
			total_resto=String.valueOf(tot_resto_int);
		%>
		<tr>
		<td height="22"><a href="#Arriba">Ir al Inicio</a></td>
		<td>
		  <p align="right" class="Estilo9">&nbsp;</p>		  </td>
		<td><div align="right" class="Estilo12"></div></td>
		<td><span class="Estilo9"><strong><a name="Total" id="Total"></a>Total</strong></span></td>
		<td align="center"><span class="Estilo10"><%=nf1.format(tot_cajas_int)%></span></td>
			<td><div align="center" class="Estilo11"> 
			 &nbsp;
		    </div></td>
		</tr>
      </table>
          </form>
    </td>
  </tr>
</table>
<map name="Map" id="Map">
<area shape="poly" coords="241,165" href="#" />
<area shape="poly" coords="230,40,231,88,270,43" href="#" />
<area shape="rect" coords="0,3,38,29" href="repor_inventario.jsp?boton=Show ALL" />
</map>
<map name="Map2" id="Map2">
  <area shape="rect" coords="4,2,31,28" href="repor_inventario.jsp?boton=Show ALL" />
</map>
<%
// ----- try que cierra la conexión a la base de datos
		 try{
               // Se cierra la conexión dentro del try
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
		// ---- fin de la conexión	 	  

%>

</body>
</html>
