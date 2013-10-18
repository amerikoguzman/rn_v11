<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import="java.io.*" import="javax.swing.filechooser.FileSystemView" import="javax.swing.*" import ="com.csvreader.CsvReader" errorPage="" %>
<%
/*parametros para la conexión*/
    String driver = "org.gjt.mm.mysql.Driver";
    String url = "jdbc:mysql://189.197.187.15:3306/abastos";
    String usuario = "root";
    String clave = "eve9397";
    String mensaje="";
	Connection conexion=null;
	Statement stmt = null;
	ResultSet rset = null;
  /*procedimiento de la conexion*/
  
  
    try{
         Class.forName(driver);
         conexion = DriverManager.getConnection(url, usuario, clave);

         /*guardando la conexion en la session*/

         session.setAttribute("conexion",conexion); 
		 stmt=conexion.createStatement(); 
		 mensaje="conectado";
       } catch (Exception ex){mensaje=ex.toString();}

    if(conexion.isClosed())
        {mensaje="desconectado";}	
		
	/*FINALIZA EL PROCEDIMIENTO DE CONEXION*/
	
	/*Declaracion de Variables*/
	ResultSet rset2 =null;
	Statement stmt2 = null ;
	stmt2 = conexion.createStatement();
	String id_abasto="", folio_abasto="", nombre_abasto="", cveuni_abasto="", fecha_abasto="";
	/*Finaliza la Decladacion de Variables*/
	
	String qry_abastos="select * from abasto_unidades group by folio";
	rset2 = stmt2.executeQuery(qry_abastos); 
	while(rset2.next())
	{
		 id_abasto=rset2.getString("idAbasto");
		 folio_abasto=rset2.getString("Folio");
		 folio_abasto=rset2.getString("NomArc");
		 cveuni_abasto=rset2.getString("ClaUni");
		 fecha_abasto=rset2.getString("FecGen");
		 
		 
		 out.print(id_abasto+"\t"+folio_abasto+"\t"+folio_abasto+"\t"+cveuni_abasto+"\t"+fecha_abasto+"<br>");
		 
	}

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