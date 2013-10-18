<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*"
         errorPage="" import="java.io.File" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit", "root", "eve9397");

    Statement stmt = null;
    ResultSet rset = null;
    Statement stmt2 = null;
    ResultSet rset2 = null;
    Statement stmt3 = null;
    ResultSet rset3 = null;

    stmt = conn.createStatement();
    stmt2 = conn.createStatement();
    stmt3 = conn.createStatement();


    String qry_tablas = "show tables";
    String tablas = "", descrip = "";
    String qry_desc = "";
    String escribe_tabla = "";
    int ban_error = 0;

//Creacion de las carpetas de almacenamiento de los respaldos----------------------------------------------------------
    String carpeta = "c:/repaldo_receta";
//out.print(carpeta);
    File file = new File(carpeta);
    boolean directorio = file.mkdir();

    carpeta = "c:/repaldo_receta/respaldo" + df.format(new java.util.Date()) + "";
//out.print(carpeta);
    file = new File(carpeta);
    directorio = file.mkdir();
//----------------------------------------------------------------------------------------------------------------------


    rset = stmt.executeQuery(qry_tablas);
    while (rset.next()) {
        tablas = rset.getString(1);
        //out.print(tablas+"<br>");
        qry_desc = "select * from  " + tablas + " into outfile 'c:/repaldo_receta/respaldo" + df.format(new java.util.Date()) + "/" + tablas + ".csv'  FIELDS TERMINATED BY ','  OPTIONALLY ENCLOSED BY '\"'  LINES TERMINATED BY '\r\n'";
        try {
            stmt3.execute(qry_desc);
            //out.print("<br>"+qry_desc);
        } catch (Exception e) {
            ban_error = 1;
            out.println("Tabla existente en respaldo:  " + tablas + "<br>");
        }

    }
    if (ban_error == 0) {
%>
<script>
    alert("Se genero el respaldo EXITOSAMENTE.");
    location.href = ("index.jsp");
</script>
<%
} else {
%>
<script>
    alert("ERROR al momento de generar el respaldo tablas ya existentes.");
    location.href = ("index.jsp");
</script>
<%
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Untitled Document</title>
</head>

<body>
</body>
</html>