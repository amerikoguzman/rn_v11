<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% 
NumberFormat nf1 = NumberFormat.getInstance(Locale.US);
DecimalFormat formateador = new DecimalFormat("###,###,###.##");

 
        Statement stmt__001 = null;
		Statement stmt_4 = null;
		Statement stmt_001 = null;
		ResultSet rset__001 = null;
		ResultSet rset_7 = null;
		ResultSet rset_001=null;
		ResultSet rset_1=null;

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
		stmt_4 = conexion.createStatement();
		stmt_001 = conexion.createStatement();
		
	
	 
	 
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


String llamo_cat_jv="",date1_jv="",date2_jv="",date11_jv="",date22_jv="",boton_jv="",sol="",sur="",org_jv="",dest="",precio="",present="",sur111="",clave="";
int sol1=0,sur1=0,present2=0,multi=0,total2=0,total3=0,resto=0,sur222=0,present22=0,resto_jv=0,altaOK=0,ban_entro=0;
double present1=0.0,sur22=0.0;


	  try {
       		llamo_cat_jv=request.getParameter("unidad");   
			boton_jv=request.getParameter("boton");   
			date1_jv=request.getParameter("f1"); 
			date2_jv=request.getParameter("f2");
			date11_jv=request.getParameter("f1"); 
			date22_jv=request.getParameter("f2");
			org_jv=request.getParameter("org");	   
	  } catch (Exception e) { }
 

	 

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
 rset__001=stmt__001.executeQuery("select clave,descrip,lote,caducidad,sum(cant_sol),sum(cant_sur),present from receta where unidad='"+llamo_cat_jv+"' and fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+org_jv+"'  and tipo_receta='rf' and cant_sur!=0 group by (clave),lote,caducidad order by (clave+0)");
   while(rset__001.next())
     {ban_entro=1;}
	}

if (org_jv.equals("1"))
{
dest="SSN";
}else
{
dest="SAVI";
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
<title>:: REPORTE CONCENTRADO::</title>
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
.Estilo3 {color: #000000; font-size: 14px; }
.Estilo6 {font-family: Arial, Helvetica, sans-serif; font-size: 14px;}
.Estilo9 {font-family: Arial, Helvetica, sans-serif; font-size: 16px;}
.Estilo13 {font-size: 16px; font-family: Arial, Helvetica, sans-serif; font-weight: bold; }
.Estilo14 {font-size: 16px}
-->
</style>
</head>
<body bgcolor="#ffffff" onload="fillCategory2()">
<p>
  <%
    
	 if (altaOK==0 && ban_entro==1)
       { 
	  
      
%>
</p>
<table width="1048" border="0" align="center" cellpadding="2">
  <tr>
    <td width="104"><img src="imagenes/nay_ima1.jpg" width="142" height="72" /></td>
    <td height="63" colspan="2" align="center" valign="bottom" nowrap="nowrap" bgcolor="#FFFFFF" id="logo"><div align="center">
      <span class="Estilo14">GOBIERNO DEL ESTADO DE NAYARIT<br />
      SECRETARIA DE SALUD</br>
	  SAVI DISTRIBUCIONES S.A DE C.V<br />
	  REPORTE GLOBAL DE CONSUMO<br />
    DE LA UNIDAD: <%=llamo_cat_jv%><br />
    PERIODO: <%=date1_jv%> al <%=date2_jv%></span><br />
    <br />
    </div></td>
    <td width="96"><img src="imagenes/ssn.jpg" width="162" height="78" /></td>
  </tr>
  
</table>
<table width="20%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td height="25" colspan="7" bgcolor="#D31145" id="dateformat">&nbsp;&nbsp;<span class="style76">
  	  <script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script>
      <a href="reportes_val_rf.jsp" class="style76"><span class="Estilo1">Regresar a Menú</span></a></span>&nbsp;<span class="Estilo1">&nbsp;&nbsp;Exportar</span></span>&nbsp;<img src="imagenes/exc.jpg" width="37" height="29" border="0" usemap="#Map2"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Estilo1">ORIGEN&nbsp;"<%=dest%>"</span></td>
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

 <tr>
    
    
    <td colspan="2" valign="top"><form action="reporte_glob_val.jsp" method="post" name="form" onSubmit="javascript:return ValidateAbas(this)">
    <table width="1008" border="0" align="center">
      <tr>
        <td width="418"><table width="980" border="1">
            <tr>
              
              <td width="83"> <span class="Estilo13">Clave</span></td>
              <td width="392"> <div align="center"><span class="Estilo13">Descripci&oacute;n</span></div></td>
              
              
              <td width="125"><div align="center"><span class="Estilo13">UM </span></div></td>
              <td width="108"><div align="center"><span class="Estilo13">LOTE </span></div></td>
              <td width="121"><div align="center"><span class="Estilo13">CADUCIDAD </span></div></td>
              
              
              <td width="111"><div align="center"><span class="Estilo13">Total Cajas </span></div></td>
            </tr>
			<%
			present="1";
	rset__001=stmt__001.executeQuery("select clave,descrip,lote,caducidad,sum(cant_sol),sum(cant_sur),present from receta where unidad='"+llamo_cat_jv+"' and fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+org_jv+"'  and tipo_receta='rf' and cant_sur!=0 group by (clave),lote,caducidad order by (clave+0)");
    while(rset__001.next()) 
                  {		
				  clave= rset__001.getString("clave");
				  	
				  
				  rset_7=stmt_4.executeQuery("select cant from pasti_ampu where clave='"+clave+"' group by clave;");
					while(rset_7.next())
					{
					present=rset_7.getString("cant");
					present22=Integer.parseInt(present);
					
					}
					present1=Double.parseDouble(present);
					present2=Integer.parseInt(present);
					//out.print(""+present2);
					sur111=rset__001.getString("sum(cant_sur)");
					sur22=Double.parseDouble(sur111);
					sur222=Integer.parseInt(sur111);
					
					if(present2==0)
					{
					present="1";
					present2=1;
					}
					
					total3=sur222/present2;
					multi=total3*present2;
					resto=sur222-multi;
					
					total2+=total3;
					resto_jv+=resto;
					
								
	%>
            <tr>
              
              <td class="Estilo6"><%=rset__001.getString("clave")%>&nbsp;</td>
              <td class="Estilo6"><%=rset__001.getString("descrip")%>&nbsp;</td>
              
              
              <td align="center" class="Estilo9"><%//=precio%><%=rset__001.getString("present")%></td>
              <td align="center" class="Estilo9"><%=rset__001.getString("lote")%></td>
              <td align="center" class="Estilo9"><%=rset__001.getString("caducidad")%></td>
              
              
              <td align="center" class="Estilo9"><%=formateador.format(total3)%></td>
              
            </tr>
			<%
			present="1";
			
			}
			rset_1=stmt__001.executeQuery("select sum(cant_sol),sum(cant_sur) from receta where unidad='"+llamo_cat_jv+"' and fecha_re between '"+date1_jv+"' and '"+date2_jv+"' and partida='"+org_jv+"' and tipo_receta='rf'");
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
              <td></td>
              <td align="center" class="Estilo9">&nbsp;</td>
              <td align="center" class="Estilo9">&nbsp;</td>
              <td align="center" class="Estilo9">Total</td>
              
              
              <td align="center" class="Estilo9"><%=formateador.format(total2)%></td>
             
            </tr>
            <tr>
              <td colspan="9">&nbsp;</td>
              </tr>
            <tr>
              
              
              <td colspan="9"><div align="left" class="Estilo3">ADMINISTRADOR&nbsp;DE LA UNIDAD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENCARGADO(A) DE LA FARMACIA &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FILTRO DE LA SSN</div></td>
              </tr>
            
             
          </table>
            </td>
        
        
      </tr>
    </table>
    </form>   
	  
	  <div align="center"></div>
    </td>
    
  </tr>
 
</table>
<%

    }
	if(ban_entro==0)
	 {
%>
NO SE ENCONTRARON COINCIDENCIAS EN LA CONSULTA, INTENTE NUEVAMENTE<br />
<a href="reportes_val_rf.jsp">Regresar a Men&uacute;</a>
<%
}
%>
<map name="Map" id="Map">
<area shape="poly" coords="241,165" href="#" />
<area shape="poly" coords="230,40,231,88,270,43" href="#" />
</map>
<map name="Map2" id="Map2">
  <area shape="rect" coords="6,5,33,31" href="repor_receta3.jsp?f1=<%=date11_jv%>&f2=<%=date22_jv%>&boton=Show ALL&unidad=<%=llamo_cat_jv%>&org=<%=org_jv%>" />
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
