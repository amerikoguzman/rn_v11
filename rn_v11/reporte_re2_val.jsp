<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="errorbusglob.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% 

        Statement stmt__001 = null;
		Statement stmt_001 = null;
		Statement stmt_paso = null;
    	Statement stmt_date = null;

		ResultSet rset__001 = null;
		ResultSet rset_001=null;
		ResultSet rset_1=null;
		ResultSet rset_paso= null;
		ResultSet rset_date = null;
		
/*---------parametros para la conexion*/
Connection conexion=null;
    String mensaje="";
   /*parametros para la conexion*/
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/r_nayarit";
    String usuario = "root";
    String pass = "eve9397";
/*procedimiento de la conexion*/
    try{
         Class.forName(driver);
    conexion = DriverManager.getConnection(url,usuario,pass);
     
	    stmt__001 = conexion.createStatement();
		stmt_001 = conexion.createStatement();
		stmt_paso = conexion.createStatement();
		
		stmt_date = conexion.createStatement();
	
	 
	 
         /*guardando la conexion en la session*/
        session.setAttribute("conexion",conexion);
       } catch (Exception ex){
        mensaje=ex.toString();
    }
    mensaje="conectado";
    if(conexion.isClosed()){
        mensaje="desconectado";
    }
//-----FIN PARAMETROS -----------



    
/********VARIBALES DE ENTORNO**********/ 

String llamo_cat_jv="",date1_jv="",date2_jv="",date11_jv="",date22_jv="",boton_jv="",date_jv="",sol="",sur="",origen_jv="",origen2_jv="", presentaInfo = "-", ampula ="-", presentacion = "-", clave="";
 int cantidadCajas=0, piezasPorAmpula=0, totalCajasAmpuleo=0,  altaOK=0, sol1=0,sur1=0;
 
/************FIN VARIABLES**************/ 
 
	  try {
       		llamo_cat_jv=request.getParameter("unidad");   
			boton_jv=request.getParameter("boton");   
			date1_jv=request.getParameter("f1"); 
			date2_jv=request.getParameter("f2");
			date11_jv=request.getParameter("f1"); 
			date22_jv=request.getParameter("f2");	
			origen_jv=request.getParameter("org");	   
	  } catch (Exception e) { }
 
 if(origen_jv.equals("1"))
 {
 origen2_jv="SSN";
 }else{
 origen2_jv="SAVI";
 }

     

   
	 
  
     


   
		

	 
 
	
	 

try{
        altaOK=Integer.parseInt(request.getParameter("altaok"));   
       }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
	   
  


	  
%>
<%
rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+date1_jv+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    date1_jv= rset_001.getString("STR_TO_DATE('"+date1_jv+"', '%d/%m/%Y')");
					}
rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+date2_jv+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    date2_jv= rset_001.getString("STR_TO_DATE('"+date2_jv+"', '%d/%m/%Y')");
					}
					
		if(boton_jv.equals("Show ALL"))
	{
 rset__001=stmt__001.executeQuery("select * from receta where unidad='"+llamo_cat_jv+"' and  fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+origen_jv+"' and tipo_receta='rf' order by (fecha_re),folio_re");
	}

%>



<% java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
   
   String date=" "+year;
   date= date+"/"+month;
   date= date+"/"+day;  
  // out.println(altaOK);
 
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<script language="javascript" src="list02.js"></script>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: REPORTE ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="mm_travel2.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------

//<script language="javascript" src="list02.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #000000;
	font-weight: bold;
}
.style33 {font-size: x-small}
.style40 {font-size: 9px}
.style41 {font-size: 9}
.style42 {font-family: Arial, Helvetica, sans-serif}
.Estilo8 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; }
.style43 {
	font-size: x-small;
	color: #FFFFFF;
	font-weight: bold;
}
.style47 {font-size: x-small; font-weight: bold; }
.Estilo5 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
.style50 {color: #000000}
.style51 {color: #BA236A}
.style58 {font-size: x-small; font-weight: bold; color: #666666; }
.style66 {font-size: x-small; font-weight: bold; color: #333333; }
a:hover {
	color: #333333;
}
.style68 {color: #CCCCCC}
.style75 {color: #333333; }
a:link {
	color: #711321;
}
.style76 {color: #003366}
.style77 {
	color: #711321;
	font-weight: bold;
}
.Estilo1 {color: #FFFFFF}
.Estilo5 {font-family: Arial, Helvetica, sans-serif; font-size: medium;}
.Estilo5 {font-size: large; font-family: Arial, Helvetica, sans-serif; }
.Estilo8 {font-family: Arial, Helvetica, sans-serif; font-size: 18px;}
.Estilo8 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; }
-->
</style>
</head>
<body bgcolor="#ffffff" onload="fillCategory2()">
<p>
  <%
    
	 if (altaOK==0)
       { 
	  
      
%>
</p>
<table width="1021" border="0" align="center" cellpadding="2">
  <tr>
    <td width="105"><img src="imagenes/nay_ima1.jpg" width="142" height="72" /></td>
    <td height="63" colspan="2" align="center" valign="bottom" nowrap="nowrap" bgcolor="#FFFFFF" id="logo"><div align="center">
      <span class="Estilo8">GOBIERNO DEL ESTADO DE NAYARIT<br />
      SECRETARIA DE SALUD</br>
	  SAVI DISTRIBUCIONES S.A DE C.V<br />
	  REPORTE DETALLADO DE CONSUMO POR RECETA FARMACIA<br />
    DE LA UNIDAD: <%=llamo_cat_jv%><br />
    PERIODO: <%=date1_jv%> al <%=date2_jv%></span><br />
    <br />
    </div></td>
    <td width="121"><img src="imagenes/ssn.jpg" width="162" height="78" /></td>
  </tr>
  
</table>
<table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td height="25" colspan="7" bgcolor="#D21245" id="dateformat">&nbsp;&nbsp;<span class="style76">
  	  <script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script>
      <a href="reportes_val_rf.jsp" class="style76"><span class="Estilo1">Regresar a Menú</span></a></span>&nbsp;&nbsp;<span class="Estilo1">&nbsp;Exportar</span>&nbsp;<img src="imagenes/exc.jpg" width="37" height="29" border="0" usemap="#Map2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Estilo1">ORIGEN&nbsp;&nbsp;&nbsp;"<%=origen2_jv%>"</span></td>
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

 <tr>
    <td width="4" valign="top" bgcolor="#ffffff">
	
 	 <br />
  	&nbsp;<br />
  	&nbsp;<br />
  	&nbsp;<br /> 	</td>
    <td>&nbsp;</td>
    <td colspan="2" valign="top"><form action="reporte_re2_val.jsp" method="post" name="form" onSubmit="javascript:return ValidateAbas(this)">
    <table width="1160" border="0" align="center">
      <tr>
        <td width="418"><table width="1500" border="1">
            <tr>
              <td width="77" ><span class="Estilo8">Fecha</span></td>
              <td width="62"> <span class="Estilo8">Folio</span></td>
              <td width="107"> <span class="Estilo8">No. Padron </span></td>
              <td width="83"> <span class="Estilo8">Ced. M&eacute;dico </span></td>
              <td width="233"> <span class="Estilo8">Nombre M&eacute;dico </span></td>
              <td width="196"> <span class="Estilo8">Paciente</span></td>
              <td width="82"> <span class="Estilo8">Clave Articulo </span></td>
              <td width="452"> <span class="Estilo8">Descripci&oacute;n</span></td>
              <td width="68"><span class="Estilo8">Lote</span></td>
              <td width="68"><span class="Estilo8">Caducidad</span></td>
              
              <td width="68"> <span class="Estilo8">Cant. Sol </span></td>
              <td width="76"> <span class="Estilo8">Cant. Sur</span></td>
			  
			  
			  
			  
            </tr>
			<%
			
			
			
    while(rset__001.next()) 
                  {		
				  
				  date_jv=rset__001.getString("fecha_re");
				  
                  rset_date = stmt_date.executeQuery("SELECT DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
                    while(rset_date.next())
					
                    date_jv= rset_date.getString("DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')");
					
				
						
						
				 presentacion = null;
			      presentacion ="-";
				  cantidadCajas= 0;
				  presentaInfo =null;
				  presentaInfo ="-";
				  ampula ="-";
				
				
				 rset_paso = stmt_paso.executeQuery(" SELECT cant from  pasti_ampu where clave =  '"+rset__001.getString("clave")+"'"); 	
				 
				 if (rset__001.getString("ampuleo").equals("1")){
						if (rset_paso.next()){
							 
							 
								presentacion = rset_paso.getString("cant");
								
								
								cantidadCajas =  rset__001.getInt("cant_sur") /Integer.parseInt( presentacion) ;
								
								
								
								presentaInfo = String.valueOf(cantidadCajas); 
								
								ampula = "SI";
								
								totalCajasAmpuleo= totalCajasAmpuleo + cantidadCajas;
							
								piezasPorAmpula = rset__001.getInt("cant_sur")+ piezasPorAmpula;
							}
					}else{
					
							ampula = "NO";
							rset_paso = null;
					}	
				 
	%>
            <tr>
              <td class="Estilo8"><%=date_jv%>&nbsp;</td>
              <td><span class="Estilo8"><%=rset__001.getString("folio_re")%></span></td>
              <td><span class="Estilo8"><%=rset__001.getString("folio_sp")%></span></td>
              <td><span class="Estilo8"><%=rset__001.getString("cedula_medi")%></span></td>
              <td><span class="Estilo8"><%=rset__001.getString("nombre_medi")%></span></td>
              <td><span class="Estilo8"><%=rset__001.getString("nombre_pac")%></span></td>
              <td><span class="Estilo8"><%=rset__001.getString("clave")%></span></td>
              <td><span class="Estilo8"><%=rset__001.getString("descrip")%></span></td>
              <td align="center"><span class="Estilo8"><%=rset__001.getString("lote")%></span></td>
              <td align="center"><span class="Estilo8"><%=rset__001.getString("caducidad")%></span></td>
              <td align="center"><span class="Estilo8"><%=rset__001.getString("cant_sol")%></span></td>
			  <td align="center"><span class="Estilo8"><%=rset__001.getString("cant_sur")%></span></td>
			 </tr>
			<%}
			rset_1=stmt__001.executeQuery("select sum(cant_sol),sum(cant_sur) from receta where unidad='"+llamo_cat_jv+"' and fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+origen_jv+"' and tipo_receta='rf'");
			while(rset_1.next()) 
                  {
				  sol=rset_1.getString("sum(cant_sol)");
				  sol1= Integer.parseInt(sol);
  				  sur=rset_1.getString("sum(cant_sur)");
				  sur1= Integer.parseInt(sur);
				  		
				  }
			%>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              
              <td class="Estilo5" align="right">&nbsp;</td>
              <td class="Estilo5" align="center">&nbsp;</td>
              <td class="Estilo5" align="center">PIEZAS</td>
              <td class="Estilo5" align="center"><%=sol1%></td>
              <td class="Estilo5" align="center"><%=sur1%></td>
			   
			  
            
			
			</tr>
           
            <tr>
              <td colspan="16">ADMINISTRADOR DE LA UNIDAD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENCARGADO(A) DE LA FARMACIA &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FILTRO DE LA SECRETARIA DE SALUD DE NAYARIT</td>
              </tr>
              </table>
            </td>
        
      </tr>
    </table>
    </form>   
	  
	  <div align="center">
	    <%
    }
      else
         if (altaOK == 1 )
            { 
	  %>
	  DATOS CAPTURADOS POR EL USUARIO	  </div>
    </td>
    
  </tr>
  <tr>
    <td width="4">&nbsp;</td>
    <td width="68">&nbsp;</td>
    <td width="27">&nbsp;</td>
    <td width="1036"><a href="cap_censos1gtobd.jsp">DESEA CAPTURAR OTRA ENCUESTA?</a> <a href="rep_hos1.jsp">GENERAR REPORTE?</a> </td>
    
  </tr>
</table>
<%

    }
%>
<map name="Map" id="Map">
<area shape="poly" coords="241,165" href="#" />
<area shape="poly" coords="230,40,231,88,270,43" href="#" />
</map>
<map name="Map2" id="Map2">
  <area shape="rect" coords="5,2,32,28" href="repor_receta2_val.jsp?f1=<%=date11_jv%>&f2=<%=date22_jv%>&boton=Show ALL&unidad=<%=llamo_cat_jv%>&org=<%=origen_jv%>" />
</map>
		<%  //----- CIERRE DE LAS CONEXIONES  ------
      try{

conexion.close();
   
    }catch (Exception e) {
                  mensaje=e.toString();
                }
finally { 
if (conexion!=null) {

conexion.close();
                
                 if(conexion.isClosed()){

        mensaje="desconectado";}


      }
}   
//---FIN -----         
%>
</body>
</html>
