<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
		
		Class.forName("org.gjt.mm.mysql.Driver"); 
		Connection conne_100 = null;
		Statement stmt_200 = null;
		ResultSet rset_200 =null;
		conne_100 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
		stmt_200 = conne_100.createStatement();
		rset_200=stmt_200.executeQuery("select * from juris group by cve");			
		String mensaje="";		

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: UNIDADES DE ATENCION ::</title>
<style type="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
}
.style3 {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #990000;
}
-->
</style>
</head>

<body>
<div align="left"><img src="imagenes/nay_ima1.jpg" width="228" height="79" /><br /><br />
<span class="style3">DE CLIC EN CLAVE DE LA UNIDAD DESEADA</span></div>
<table width="384" border="1">
 
  <tr>
    <th class="style1" scope="col">Clave</th>
    <th class="style1" scope="col">Nombre de Unidad </th>
  </tr> 
  <%
    while (rset_200.next()) 
    {              
  %>
  <tr>
    <th width="51" height="37" class="style1" scope="col">&nbsp;
    <div align="center"><a href="index.jsp?cve=<%=rset_200.getString("cve")%>"><%=rset_200.getString("cve")%></a></div></th>
    <th width="317" class="style1" scope="col">&nbsp;
    <div align="left"><%=rset_200.getString("nombre")%></div></th>
  </tr>
  <%
  }
  %>
  <%
// ----- try que cierra la conexión a la base de datos
		 try{
               // Se cierra la conexión dentro del try
                 conne_100.close();
	          }catch (Exception e){mensaje=e.toString();}
           finally{ 
               if (conne_100!=null){
                   conne_100.close();
		                if(conne_100.isClosed()){
                             mensaje="desconectado2";}
                 }
             }
			// out.print(mensaje);
		// ---- fin de la conexión	 	  

%>
</table>
</body>
</html>
