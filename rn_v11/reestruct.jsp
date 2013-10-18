<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" import="java.text.DecimalFormat"%>
<%

//--------------MODULO DE CONEXION--------------------------------------------------------------------
Class.forName("org.gjt.mm.mysql.Driver");
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
//----------------------------------------------------------------------------------------------------

//------------------------------------------
ResultSet rset =null;
Statement stmt = conexion.createStatement();
ResultSet rset2 =null;
Statement stmt2 = conexion.createStatement();
ResultSet rset3 =null;
Statement stmt3 = conexion.createStatement();
//------------------------------------------

//--VARIABLES DE ENTORNO------------------------------------------
String cv_unidad="", no_juris="", qry_upjuris="", qry_upjuris_col="";
//--------------------------------------------


//---------ACTUALIZAR PRECIOS-----------------------------------------------
try{
stmt.execute("update receta set precio = '0', precio_tt='0' where precio = '-';");
stmt.execute("update receta_colectiva set precio = '0', precio_tt='0' where precio = '-';");
String qry_clave_rec="select h_1001.clave, receta.cant_sur from h_1001, receta where h_1001.clave = receta.clave group by h_1001.clave, receta.cant_sur";
//out.print(qry_clave_rec);
rset = stmt.executeQuery(qry_clave_rec);
while(rset.next()){
	String cla_act=rset.getString(1);

	String cant_sur=rset.getString(2);
	String precio="";
	float pre=0, pre_tot=0, cant=0;
	//out.print(cla_act + cant_sur);
	String qry_precio="select precio from h_1001 where clave = '"+cla_act+"'";
//out.print(qry_precio);	
rset2 = stmt2.executeQuery(qry_precio);
	while(rset2.next()){
		precio= rset2.getString("precio");
	}
	if (precio == null){
		precio="0";
	}
	pre=Float.parseFloat(precio);
	cant=Float.parseFloat(cant_sur);
	
	pre_tot=pre*cant;
	String act_precios = "update receta set precio = '"+precio+"', precio_tt= '"+pre_tot+"' where clave = '"+cla_act+"' and cant_sur = '"+cant_sur+"'";
	//out.print(act_precios);
	try{
		stmt2.execute(act_precios);
	} catch (Exception e) {out.println("Error al actualizar precio; "+act_precios);}
}

String qry_clave_recc="select h_1001.clave, receta_colectiva.cant_sur from h_1001, receta_colectiva where h_1001.clave = receta_colectiva.clave group by h_1001.clave, receta_colectiva.cant_sur";

rset = stmt.executeQuery(qry_clave_recc);
while(rset.next()){
	String cla_act=rset.getString("clave");
	String cant_sur=rset.getString("cant_sur");
	String precio="";
	float pre=0, pre_tot=0, cant=0;
	
	String qry_precio="select precio from h_1001 where clave = '"+cla_act+"'";
	rset2 = stmt2.executeQuery(qry_precio);
	while(rset2.next()){
		precio= rset2.getString("precio");
	}
	if (precio == null){
		precio="0";
	}
	pre=Float.parseFloat(precio);
	cant=Float.parseFloat(cant_sur);
	
	pre_tot=pre*cant;
	String act_precios = "update receta_colectiva set precio = '"+precio+"', precio_tt= '"+pre_tot+"' where clave = '"+cla_act+"'";
	try{
		stmt2.execute(act_precios);
	} catch (Exception e) {out.println("Error al actualizar precio; "+act_precios);}
}
} catch ( Exception e){}
//--------------------------------------------------------


//--------Rellenar la clave de la unidad----------------------------------
String qry_unidad="select cve from juris group by juris";
rset = stmt.executeQuery(qry_unidad);
while(rset.next()){
	cv_unidad= rset.getString("cve");
}
String qry_upcve="update receta set clave_uni = '"+cv_unidad+"' ";
String qry_upcve_col="update receta_colectiva set clave_uni = '"+cv_unidad+"' ";

try{
	out.print(qry_upcve+"<br>"+qry_upcve_col+"<br>");
	stmt.execute(qry_upcve);
	stmt.execute(qry_upcve_col);
} catch (Exception e) {out.println("Error al actualizar la unidad; "+cv_unidad);}
//------------------------------------------

//---------ACTUALIZAR JURIS-----------------------------------------------
String qry_no_juris="select no_juris from receta group by no_juris";

rset = stmt.executeQuery(qry_no_juris);
while(rset.next()){
	no_juris= rset.getString("no_juris");
}
if (no_juris.equals("I")){
	qry_upjuris="update receta set juris = 'JURISDICCION SANITARIA I' ";
	qry_upjuris_col="update receta_colectiva set juris = 'JURISDICCION SANITARIA I' ";
}
if (no_juris.equals("II")){
	qry_upjuris="update receta set clave_uni = 'JURISDICCION SANITARIA II' ";
	qry_upjuris_col="update receta_colectiva set juris = 'JURISDICCION SANITARIA II' ";
}
if (no_juris.equals("III")){
	qry_upjuris="update receta set clave_uni = 'JURISDICCION SANITARIA III' ";
	qry_upjuris_col="update receta_colectiva set juris = 'JURISDICCION SANITARIA III' ";
}


try{
	out.print(qry_upjuris+"<br>"+qry_upjuris_col+"<br>");
	stmt.execute(qry_upjuris);
	stmt.execute(qry_upjuris_col);
} catch (Exception e) {out.println("Error al actualizar la jurisdiccion; "+qry_upjuris);}
//--------------------------------------------------------



//-------------------ACTUALIZAR EL MUNICIPIO----------------------------------------------------------
String qry_recmuni="select nombre from juris group by nombre";
rset = stmt.executeQuery(qry_recmuni);
String mpio="", clave_uni="";
while(rset.next()){
	clave_uni= rset.getString("nombre");
}
String qry_mpio="select mun_uni from unidades where uni_ate='"+clave_uni+"'";
rset = stmt.executeQuery(qry_mpio);
while(rset.next()){
  mpio= rset.getString("mun_uni");
}

String qry_upmpio="update receta set aux13 = '"+mpio+"' where aux13 = '-' ";
String qry_upmpio_col="update receta_colectiva set aux13 = '"+mpio+"' where aux13 = '-' ";
try{
	stmt.execute(qry_upmpio);
	stmt.execute(qry_upmpio_col);
} catch (Exception e) {out.println("No se pudo actualizar el municipio");}
//-----------------------------------------------------------
%><script>
alert("Reestructuracion FINALIZADA");
self.location = 'index.jsp';
</script>
<%//response.sendRedirect("index.jsp");
%>
<%
conexion.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
</body>
</html>
