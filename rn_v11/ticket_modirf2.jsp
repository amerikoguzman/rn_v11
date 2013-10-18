<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" import ="java.awt.image.BufferedImage" import ="java.io.*" import ="javax.imageio.ImageIO" import ="net.sourceforge.jbarcodebean.*" import ="net.sourceforge.jbarcodebean.model.*" errorPage="" %>
<%
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: ticket.jsp
Función      : Formato para imprimir el Ticket de Salida de una receta emitida por Farmacia, muestra
               lote y caducidades, según la dispensación
   ---------------------------------------------------------------------------------------------------- */
//Conexión a la BDD vía JDBC	
Class.forName("org.gjt.mm.mysql.Driver");

				  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
                  Statement stmt = conn.createStatement();
				  Statement stmt1 = conn.createStatement();
				  Statement stmt3 = conn.createStatement();
				  ResultSet rset = null;
				  ResultSet rset1 = null;
				  ResultSet rset3 = null;
				  ResultSet rset4 = null;
// fin conexión -----------------------------------				  
// Varibles de entorno				  
String folio_re="",afiliado_jv="",receta1="",encar_jv="",nom_unidad="",no_jur="",juris_jv="",clave_jv="";
String cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",id_med_jv="",part_jv="",mensaje="";
String perfil="",sexo_jv="",t2_jv="";
int tipo_rec=0;

JBarcodeBean barcode = new JBarcodeBean();
// nuestro tipo de codigo de barra
barcode.setCodeType(new Code128());
// fin variables de entorno
// try toma valores enviados como parámteros
try{
		perfil=request.getParameter("perfil");
        folio_re=request.getParameter("folio");
		receta1=request.getParameter("receta5");
		nom_unidad=request.getParameter("uni");
		no_jur=request.getParameter("juris");
		encar_jv=request.getParameter("encar");
		juris_jv=request.getParameter("juris1");
		clave_jv=request.getParameter("clave_uni");
		cv_dgo_jv=request.getParameter("cv_dgo");
		cv_uni_jv=request.getParameter("cv_uni");
		cv_mpio_jv=request.getParameter("cv_mpio");
		
		part_jv=request.getParameter("part");
		id_med_jv=request.getParameter("id_med");
		sexo_jv=request.getParameter("sexo");
		t2_jv=request.getParameter("mes5");
		
		tipo_rec=Integer.parseInt(request.getParameter("ban")); //variable para RF o RC
		
	 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
// fin de try
        barcode.setCode(folio_re);
		barcode.setCheckDigit(true);
        BufferedImage bufferedImage = barcode.draw(new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB));
        // guardar en disco como png
        File file = new File("C://Program Files/Apache Group/Tomcat 4.1/webapps/rn_v11/cb/"+folio_re+".png");
        ImageIO.write(bufferedImage, "png", file);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: Ticket de Salida ::</title>
<style type="text/css">
<!--
.style5 {font-family: Arial, Helvetica, sans-serif; font-size: 12; }
.style6 {font-size: 12}
.style7 {	font-size: 12px;
	font-weight: bold;
}
.style8 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
}
-->
</style>
</head>

<body>
<table width="384" height="490"  border="3" align="left" cellpadding="2">
  <tr>
    <td width="372" height="92"><table width="370" border="0" cellpadding="2">
      <tr>
        <td width="362" class="style7"><div align="center"><strong><span class="style5"><a href="modi3_receta.jsp?encar=<%=encar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&nombre=&edad=&folio=&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&clave2=&descrip2=&present2=&indica2=&sol2=&sur2=&clave3=&descrip3=&present3=&indica3=&sol3=&sur3=&foliore=&univer=&cedu=&nomed=&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&id_med=<%=id_med_jv%>&cause=SC&part=&day5=&carnet=-&mes5=<%=t2_jv%>&aa5=&perfil=<%=perfil%>&sexo=&ban=<%=tipo_rec%>" accesskey="q">*</a>SAVI DISTRIBUCIONES  S.A DE C.V.* </span></strong></div></td>
      </tr>
      <tr>
        <td class="style7"><div align="center"><strong><span class="style5">AV. MAGNOCENTRO No. 11, PISO 5<br /> COL. CENTRO URBANO HUIXQUILUCAN

 </span></strong><strong><span class="style5"></span></strong></div></td>
      </tr>
      <tr>
        <td class="style7"><div align="center">ESTADO DE M&Eacute;XICO, C.P. 52760 </div></td>
      </tr>
      
      <tr>
        <td class="style7"><div align="center"><%=nom_unidad%> </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="254"><table width="370" border="0" cellpadding="2">
      <tr>
	  
        <td width="364"><div align="right" class="style6 style8">FECHA DE VENTA:&nbsp;&nbsp; &nbsp;  </div></td>
      </tr>
	  <%
	  rset=stmt.executeQuery("select * from receta where folio_re='"+folio_re+"' group by folio_re");
 
   while(rset.next()) 
                  { 
				  afiliado_jv=rset.getString("afiliado");
				  if (afiliado_jv.equals("SP"))
				  {
				  afiliado_jv="SEGURO POPULAR";
				  }else if (afiliado_jv.equals("PA"))
				  {
				  afiliado_jv="POBLACION ABIERTA";
				  } else if (afiliado_jv.equals("OP"))
				  {
				  afiliado_jv="OPORTUNIDADES";
				  }
	  %>
      <tr>
        <td><table width="364" border="0" cellpadding="2">
          <tr>
            <td width="196" class="style8">FOLIO:
              <%=receta1%>&nbsp;-&nbsp;<%=rset.getString("clave_uni")%>&nbsp;-&nbsp;<%=rset.getString("folio_re")%></td>
            <td width="77" class="style8"><%=rset.getString("fecha_re")%></td>
            <td width="71" class="style8">
              <%=rset.getString("hora")%></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><span class="style8">CLIENTE:
           <%=afiliado_jv%></span></td>
      </tr>
      <tr>
        <td class="style8">SUB-CLIENTE: 
          SERVICIOS DE SALUD DE NAYARIT</td>
      </tr>
      
      <tr>
        <td class="style8"><table width="352" border="0" cellpadding="2">
          <tr>
            <td width="89" class="style8">BENEFICIARIO:</td>
            <td width="249" class="style8"><%=rset.getString("nombre_pac")%></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="style8">SEXO: <%=rset.getString("aux7")%> </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="style8">FOLIO REFERENCIA: 
              <%=rset.getString("folio_sp")%></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="style8">RECETA: 
              <%=rset.getString("folio_re")%></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td class="style8">FECHA DE RECETA: 
              <%=rset.getString("fecha_re")%></td>
          </tr>
		   <%
		 }
		 rset4=stmt.executeQuery("select * from receta where folio_re='"+folio_re+"' group by fuente");
 
   while(rset4.next()) 
                  { 
				  %>
          <tr>
            <td class="style8">PROGRAMA:</td>
            <td class="style8">SP<%//=rset4.getString("fuente")%></td>
          </tr>
          <tr>
            <td class="style8">SUB-PROGRAMA:</td>
            <td class="style8">SP<%//=rset4.getString("fuente")%></td>
          </tr>
		  <%}%>
        </table></td>
      </tr>

    </table></td>
  </tr>
  <tr>
    <td height="25"><table width="375" border="0" cellpadding="2">
      <tr>
        <td width="263" class="style8">DESCRIPCION</td>
        <td width="52" class="style8"><div align="center">CANTIDAD</div></td>
        <td width="40" class="style8"><div align="center">ORIGEN</div></td>
		
      </tr>
	  <%
	  rset1=stmt1.executeQuery("select * from receta where folio_re='"+folio_re+"' and cant_sur!=0");
 
   while(rset1.next()) 
                  { 
	  %>
      <tr>
     	<td height="21" class="style8"><%=rset1.getString("clave")%> - <%=rset1.getString("descrip")%></td>
        <td class="style8" align="center"><%=rset1.getString("cant_sur")%></td>
        <td height="21" class="style8" align="center"><%=rset1.getString("partida")%></td>
		
			<td class="style8" align="center">Caja</td>
		
      </tr>
       <tr>
     	<td height="21" class="style8">LOTE:&nbsp;<%=rset1.getString("lote")%> - CADUCIDAD:&nbsp;<%=rset1.getString("caducidad")%></td>
        <td class="style8" align="center">&nbsp;</td>
        <td height="21" class="style8" align="center">&nbsp;</td>
		
			<td class="style8" align="center"></td>
		
      </tr>
      <%}%>

    </table></td>
  </tr>
  
  <tr>
    <td height="77"><table width="369" border="0" cellpadding="2">
      <tr>
        <td width="361"></td>
      </tr>
      <tr>
        <td class="style8"><div align="center">FIRMA DE RECIBIDO </div></td>
      </tr>
      <%
	  rset3=stmt.executeQuery("select * from receta where folio_re='"+folio_re+"' group by folio_re");
 
   while(rset3.next()) 
                  { 
				  
	  %>
      
      <tr>
        <td class="style8">ENCARGADO(A): 
          <%=rset3.getString("encargado")%></td>
      </tr>
      <tr>
        <td class="style8">FECHA DE IMPRESION: 
          <%=rset3.getString("fecha_re")%>&nbsp;-&nbsp;<%=rset3.getString("hora")%></td>  
		   <td class="style8" align="center">&nbsp;</td>
		  
      </tr>
      <tr>
        <td class="style8" align="center"><img src="cb/<%=folio_re%>.png"  /></td>
        <td class="style8" align="center">&nbsp;</td>
      </tr>
	  <%}%>
    </table></td>
  </tr>
  
</table>
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
