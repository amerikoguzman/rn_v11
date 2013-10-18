<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" import="java.util.Date" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%
// Conexión a la BDD
		Class.forName("org.gjt.mm.mysql.Driver");
 		Connection conn = DriverManager.getConnection("jdbc:mysql://166.78.128.202/receta_nay","nayarit_rp","Y58Go0mX35");
		Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
        Statement stmt = conn.createStatement();
		ResultSet rset = null;
		Statement stmt2 = conn2.createStatement();
		ResultSet rset2 = null;
// -----------------   

//-----------------------------------------------------------------
		
//-----------------------------------------------------------------



//----LLENA VALORES DE MEDICO--------------------------------------------------------------
/*
TAMBIEN COMPARA CONTRA LO YA REGISTRADO
PARA NO CARGA MEDICOS DOBLE VEZ
*/
	
	String unidad = "";
	String qry_uni = "select unidad from juris group by unidad";
	rset2 = stmt2.executeQuery(qry_uni);
	while (rset2.next()) {
		unidad = rset2.getString("unidad");
	}

	stmt.execute("DELETE FROM INVENTARIO_UNI WHERE UNIDAD = '"+unidad+"'");	
	
	String qry_inv = "select * from inventario_uni WHERE Existencias != '0'";
	rset2 = stmt2.executeQuery(qry_inv);
	
	while (rset2.next()) {
		
		String cla = rset2.getString("clave");
		String desc = rset2.getString("descrip");
		String lot = rset2.getString("lote");
		String cad = rset2.getString("caducidad");
		String exis = rset2.getString("existencias");
		String ori = rset2.getString("origen");
		String fecha = rset2.getString("fecha");
		
		String qry_sube = "INSERT INTO INVENTARIO_UNI VALUES ('"+unidad+"','"+cla+"','"+desc+"','"+lot+"','"+cad+"','"+exis+"','"+ori+"',CURDATE(),CURTIME(),'0');";
		try {
		stmt.execute(qry_sube);
		} catch (Exception e) {out.print(qry_sube);}
		
	}
	
//--------------------------------------------------------------------------------------
%><script>
alert("CARGA FINALIZADA");
self.location = 'index.jsp';
</script>
<%
%>

<%
conn.close();
conn2.close();
%>