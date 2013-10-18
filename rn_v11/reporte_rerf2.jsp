<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% 

        
		ResultSet rset__001 = null;
		ResultSet rset_001=null;
		ResultSet rset_1=null;
		ResultSet rset_2=null;
        ResultSet rset_date = null; 
		Statement stmt_date = null;
		Statement stmt__001 = null;
		Statement stmt__002 = null;
		Statement stmt_001 = null;

		

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
	 stmt__002 = conexion.createStatement();
	 stmt_001 = conexion.createStatement();
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

 

String llamo_cat_jv="",date1_jv="",date2_jv="",date11_jv="",date22_jv="",boton_jv="",tip_uni_jv="",date_jv="",sol="",sur="",org_jv="",precio="",org1_jv="";
int sol1=0,sur1=0,folio_re2=0,ban_coin=0;
	  try {
       		llamo_cat_jv=request.getParameter("unidad");   
			boton_jv=request.getParameter("boton");   
			date1_jv=request.getParameter("f1"); 
			date2_jv=request.getParameter("f2");
			date11_jv=request.getParameter("f1"); 
			date22_jv=request.getParameter("f2");
			org_jv=request.getParameter("org");
			org1_jv=request.getParameter("org");	   
	  } catch (Exception e) { }
 
 if(org1_jv.equals("1"))
{
org1_jv="SSN";
}else{
	if(org1_jv.equals("2")){
		org1_jv="SAVI";
	}else{
		org1_jv="AMBOS";
		}
}


     

     int x1=0;
     
	 
     int altaOK=0;

     String but="r";
	 String but_juris="e";
	 
try{
        altaOK=Integer.parseInt(request.getParameter("altaok"));   
       }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
	   
   try { 
        but=""+request.getParameter("Submit");
        but_juris=""+request.getParameter("option1");
		
		}catch(Exception e){System.out.print("not");}



	  
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
 rset__001=stmt__001.executeQuery("select fecha_re,folio_re,nombre_medi,nombre_pac,clave,descrip,lote,caducidad,cant_sol,cant_sur,  ampuleo from receta where unidad='"+llamo_cat_jv+"' and fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+org_jv+"' and tipo_receta='rf' and cant_sur!=0  order by (fecha_re),folio_re asc");
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
<title>:: REPORTE DIARIO SALIDA POR FARMACIA ::</title>
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
.style32 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; }
.style43 {
	font-size: x-small;
	color: #FFFFFF;
	font-weight: bold;
}
.style47 {font-size: x-small; font-weight: bold; }
.style49 {font-size: x-small; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
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
<table width="662" border="0" align="center" cellpadding="2">
  <tr>
    <td width="102"><img src="imagenes/nay_ima1.jpg" width="142" height="72" /></td>
    <td height="63" colspan="2" align="center" valign="bottom" nowrap="nowrap" bgcolor="#FFFFFF" id="logo"><div align="center">
     <span class="style49"> GOBIERNO DEL ESTADO DE NAYARIT<br />
      SECRETARIA DE SALUD</br>
	  SAVI DISTRIBUCIONES S.A DE C.V<br />
	  REPORTE DETALLADO DE CONSUMO POR RECETA <br />
    DE LA UNIDAD: <%=llamo_cat_jv%><br />
    PERIODO: <%=date1_jv%> al <%=date2_jv%><br /></span>
  
    </div></td>
    <td width="103"><img src="imagenes/ssn.jpg" width="162" height="78" /></td>
  </tr>
  
</table>
<table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td height="25" colspan="7" bgcolor="#D31145" id="dateformat">&nbsp;&nbsp;<span class="style76">
  	  <script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script>
      <a href="reportes_farmacia.jsp" class="style76"><span class="Estilo1">Regresar a Menú</span></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Estilo1">ORIGEN "<%=org1_jv%>"</span></td>
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

 <tr>
    
    <td colspan="2" valign="top"><form action="reporte_rerf2.jsp" method="post" name="form" onSubmit="javascript:return ValidateAbas(this)">
    <table width="618" border="0" align="center">
      <tr>
        <td width="418"><table width="659" border="1">
            <tr>
              <td width="47" ><span class="style49">Fecha</span></td>
              <td width="38"> <span class="style49">Folio</span></td>
              
              
              <td width="68"> <span class="style49">Nombre M&eacute;dico </span></td>
              <td width="57"> <span class="style49">Paciente</span></td>
              <td width="64"> <span class="style49">Clave Articulo </span></td>
              <td width="224"> <span class="style49">Descripci&oacute;n</span></td>
             <td width="59"><span class="style49">Lote</span></td>
              <td width="59"><span class="style49">Caducidad</span></td>
              <!--td width="47"> <span class="style49">Costo Unitario </span></td-->
         
              <td width="59"> <span class="style49">Cant. Sol </span></td>
              <td width="50"> <span class="style49">Cant. Sur</span></td>
			  
			  
			
			  
			
            </tr>
			<%
    while(rset__001.next()) 
                  {		
				 
				ban_coin=1;
				date_jv=rset__001.getString("fecha_re");	
				rset_date = stmt_date.executeQuery("SELECT DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')");
				while(rset_date.next())
                    date_jv= rset_date.getString("DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')");
				
					
	%>
            <tr>
              <td><span class="style49"><%=date_jv%></span></td>
              <td><span class="style49"><%=rset__001.getString("folio_re")%></span></td>
              
             
              <td><span class="style49"><%=rset__001.getString("nombre_medi")%></span></td>
              <td><span class="style49"><%=rset__001.getString("nombre_pac")%></span></td>
              <td><span class="style49"><%=rset__001.getString("clave")%></span></td>
              <td><span class="style49"><%=rset__001.getString("descrip")%></span></td>
              <td><span class="style49"><%=rset__001.getString("lote")%></span></td>
              <td><span class="style49"><%=rset__001.getString("caducidad")%></span></td>
              <!--td align="center"><span class="style49"><%//=precio%>0.0</span></td-->
             
              <td align="center"><span class="style49"><%=rset__001.getString("cant_sol")%></span></td>
              <td align="center"><span class="style49"><%=rset__001.getString("cant_sur")%></span></td>
			  
	 		 
			 

			  

            </tr>
			<%}
		if(ban_coin==1)
		 {	
			rset_1=stmt__001.executeQuery("select sum(cant_sol),sum(cant_sur) from receta where unidad='"+llamo_cat_jv+"' and fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+org_jv+"' and tipo_receta='rf'");
			while(rset_1.next()) 
                  {
				  sol=rset_1.getString("sum(cant_sol)");
				  sol1= Integer.parseInt(sol);
  				  sur=rset_1.getString("sum(cant_sur)");
				  sur1= Integer.parseInt(sur);
				  		
				  }
				  
rset_2=stmt__002.executeQuery("select count(folio_re) from receta where unidad='"+llamo_cat_jv+"' and fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+org_jv+"' and tipo_receta='rf' group by folio_re");
			while(rset_2.next()) 
                  {
				  folio_re2++;
				  		
				  }
				  
		 }
			%>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              
              <td class="style49" align="right">PIEZAS</td>
              <td class="style49" align="center">&nbsp;</td>
              <td class="style49" align="center">&nbsp;</td>
              <td class="style49" align="center"><%=sur1%></td>
              <td class="style49" align="center"><%=sur1%></td>
			  
			  
		
            </tr>

            <tr>
              <td height="24" colspan="5" align="center" class="style49">TOTAL RECETAS EMITIDAS= <%=folio_re2%></td>
              <td colspan="6" class="style49" align="center">TOTAL PIEZAS DISPENSADAS= <%=sur1%></td>
              </tr>
            
          
           
			
            
            
            
            
            
          </table>
            </td>
       
      </tr>
    </table>
    </form>   
	  
	 
</table>
        </div></td>
        </tr>
    </table>    </td>
    <td width="4">&nbsp;</td>
        <td width="6" valign="top"><br />
	&nbsp;<br /></td>
	<td width="96">&nbsp;</td>
  </tr>
  <tr>
    <td width="4">&nbsp;</td>
    <td width="68">&nbsp;</td>
    <td width="27">&nbsp;</td>
    <td width="1036">&nbsp;</td>
    <td width="4">&nbsp;</td>
    <td width="6">&nbsp;</td>
	<td width="96">&nbsp;</td>
  </tr>
</table>
<%

    }
%>

<map name="Map" id="Map">
<area shape="poly" coords="241,165" href="#" />
<area shape="poly" coords="230,40,231,88,270,43" href="#" />
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
