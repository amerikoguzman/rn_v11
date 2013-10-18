<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" import ="java.awt.image.BufferedImage" import ="java.io.*" import ="javax.imageio.ImageIO" import ="net.sourceforge.jbarcodebean.*" import ="net.sourceforge.jbarcodebean.model.*" errorPage="" %>
<%
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
	Statement stmt = conn.createStatement();
	ResultSet rset = null;
	JBarcodeBean barcode = new JBarcodeBean();
	
	String mensaje="",but="r",folio_re="";
	try { 
      but=""+request.getParameter("Submit");
}catch(Exception e){System.out.print("not");} 
if(but.equals("Crear CODIGO DE BARRAS"))
     {
		//out.print("cb");
		
		// nuestro tipo de codigo de barra
		barcode.setCodeType(new Code128());  
		 rset=stmt.executeQuery("select distinct folio_re from receta group by folio_re union all select distinct folio_re from receta_colectiva group by folio_re order by folio_re+0;");
		while(rset.next()) 
                  { 
				     folio_re=rset.getString("folio_re");
				  	 barcode.setCode(folio_re);
					 barcode.setCheckDigit(true);
        			 BufferedImage bufferedImage = barcode.draw(new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB));
        				// guardar en disco como png
        			 File file = new File("C://Program Files/Apache Group/Tomcat 4.1/webapps/rn_v11/cb/"+folio_re+".png");
        			 ImageIO.write(bufferedImage, "png", file);	
				  }
	 
	 }
	 
if(but.equals("Crear"))
     {
		 folio_re=request.getParameter("txtf_cb");
		 barcode.setCode(folio_re);
		 barcode.setCheckDigit(true);
         BufferedImage bufferedImage = barcode.draw(new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB));
        // guardar en disco como png
         File file = new File("C://Program Files/Apache Group/Tomcat 4.1/webapps/rn_v11/cb/"+folio_re+".png");
         ImageIO.write(bufferedImage, "png", file);	
	 }
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: CREAR CB ::</title>
<style type="text/css">
.c {
	text-align: center;
}
</style>
</head>

<body>
<form method="post" name="form" action="ccb.jsp">
<table width="429" height="132" border="1" align="center">
  <tr>
    <td height="23" colspan="3" class="c">DESARROLLO GNKL</td>
  </tr>
  <tr>
    <td width="98" align="center">Dar click -&gt;<br /></td>
    <td width="315" align="left"><input type="submit" name="Submit" id="Submit" value="Crear CODIGO DE BARRAS" /></td>
    
  </tr>
  <tr>
    <td align="center"><br />
      Crear CB:</td>
    <td align="left"><input name="txtf_cb" type="text" />
      <input type="submit" name="Submit" id="Submit" value="Crear" /></td>
    
  </tr>
</table>
</form>
<%
// ----- try que cierra la conexión a la base de datos
		 try{
               // Se cierra la conexión dentro del try
                 conn.close();
	          }catch (Exception e){mensaje=e.toString();}
           finally{ 
               if (conn!=null){
                   conn.close();
		                if(conn.isClosed()){
                             mensaje="desconectado2";}
                 }
             }
			 //out.print(mensaje);
		// ---- fin de la conexión	 	  

%>
</body>
</html>