<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date"  import="java.text.NumberFormat" import="java.util.Locale" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<% 

 Statement stmt1 = null;
 ResultSet rset1= null;
 Statement stmt_d = null;
 ResultSet rset_d = null;
 Statement stmt_day = null;
 ResultSet rset_day = null;
 ResultSet rset_200 = null;
 Statement stmt_min_max=null;

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
     
	 stmt1 = conexion.createStatement();
	 stmt_d = conexion.createStatement();
	 stmt_day = conexion.createStatement();
	 stmt_min_max= conexion.createStatement();
	
	 
	 
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

/********VARIBLES DE ENTORNO********/
String anio1_jv="",mes1_jv="",dia1_jv="",anio2_jv="",mes2_jv="",dia2_jv="",fecha_t1="",fecha_t2="", but="r", finan_jv="",org_jv="", fecha_1= "", fecha_2= "",reporte_jv="",unidad_jv="",fecha_1_jv="",fecha_2_jv="";

int x1=0,afi=0, ban=0, ban_cur=0, cont=0;

String cad1[]=new String[1000];  //array for show clients 

/*********FIN VARIABLE*********/    
	 
	 
	
	 
	 try { 
        but=""+request.getParameter("Submit");
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}
	 
/*
rset_200 = stmt_min_max.executeQuery("SELECT YEAR(min(FECHA_RE)) AS anio1,MONTH(Min(FECHA_RE)) AS mes1 ,DAY(Min(FECHA_RE)) AS dia1,YEAR(MAX(FECHA_RE)) AS anio2,MONTH(MAX(FECHA_RE)) AS mes2 ,DAY(MAX(FECHA_RE)) AS dia2 FROM receta_colectiva;");
	  
	  while(rset_200.next())
	  {
	  anio1_jv=rset_200.getString("anio1");
	  mes1_jv=rset_200.getString("mes1");
	  dia1_jv=rset_200.getString("dia1");
	  anio2_jv=rset_200.getString("anio2");
	  mes2_jv=rset_200.getString("mes2");
	  dia2_jv=rset_200.getString("dia2");
	  fecha_t1=dia1_jv+"/"+mes1_jv+"/"+anio1_jv;
	  fecha_t2=dia2_jv+"/"+mes2_jv+"/"+anio2_jv;
	  }
	*/  
 rset1= stmt1.executeQuery("select unidad from receta_colectiva group by unidad ");
	  
	  while(rset1.next())
				     {
					 cad1[afi]=rset1.getString("unidad");     
                     afi++;
}

     
%>
<%



  	 
if(but.equals("Por Fechas"))
      {	    
	  ban=2;	 
	  ban_cur=1;
	  
// Rutina para fechas
           fecha_1= request.getParameter("txtf_caduc");
		   fecha_2= request.getParameter("txtf_caduci");
		   unidad_jv=request.getParameter("select");
		 
		   
		 int bancom =1;  
	     if(!(fecha_1.equals("")) && !(fecha_2.equals(""))){         
		 java.util.Calendar currDate = new java.util.GregorianCalendar();			
		 Date fecha1=new Date();
		 Date fecha2=new Date();
	 	 
		 SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		 fecha1=df.parse(fecha_1);
		 fecha2=df.parse(fecha_2);
		 
		 int month = (fecha1.getMonth())+1;
		 int month2 = (fecha2.getMonth())+1;
		 int years = (fecha1.getYear());
		 int years2 = (fecha2.getYear());
		 
		 if(years>years2){
		 	 bancom=2;
		 }
		 if(month>month2){
		    if(years>=years2)
		       bancom=2;
		 } 
		 
		 
		 //out.print("mes1:"+month+"mes2:"+month2+"a�o1:"+years+"a�o2:"+years2);
		 if( (month>=1 && (years>=113 || years<=108))  || (month2>=11 && (years2>=113 || years<=108)) )
		     {bancom=4;}
		 rset_d = stmt_d.executeQuery("select MAX(fecha_re) from receta_colectiva;"); 
                    String fechmax="";
					int banexi=1;
					while(rset_d.next()){
                    fechmax=rset_d.getString("MAX(fecha_re)");
					}
					rset_d = stmt_d.executeQuery("select MIN(fecha_re) from receta_colectiva;"); 
                    String fechmin="";
					while(rset_d.next()){
                    fechmin=rset_d.getString("MIN(fecha_re)");
					}
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
		Date fechaMa=new Date();
		Date fechaMi=new Date();
		
		fechaMa=df2.parse(fechmax);
   	    fechaMi=df2.parse(fechmin);
 		
		int monthMa = (fechaMa.getMonth())+1;
		int monthMi = (fechaMi.getMonth())+1;
		int yearMa =  (fechaMa.getYear());
		int yearMi =  (fechaMi.getYear());
		if(monthMa < month || month < monthMi){
		 banexi=0;
		 }
		
		if(monthMa < month2 || month < monthMi){
		 banexi=0;
		 }

		 		  rset_day = stmt_day.executeQuery("SELECT STR_TO_DATE('"+fecha_1+"', '%d/%m/%Y')"); 
                    while(rset_day.next()){
                    fecha_1= rset_day.getString("STR_TO_DATE('"+fecha_1+"', '%d/%m/%Y')");
					}
	       rset_day = stmt_day.executeQuery("SELECT STR_TO_DATE('"+fecha_2+"', '%d/%m/%Y')"); 
                    while(rset_day.next()){
                    fecha_2= rset_day.getString("STR_TO_DATE('"+fecha_2+"', '%d/%m/%Y')"); }
					//select sum(costo),sum(uni) from xjurisixt1 where fecha between '2009-06-10' and '2009-06-12'; 
   					  if(month2>=12 && years2==113)
						{
						  banexi=2;
						}  				
		
					    				
		   	 if(bancom==2){
		   fecha_1="";
			fecha_2="";
			
			%>
			<script>
			alert("Verifica las fechas, La primera fecha debe ser menor a la segunda, GRACIAS")
			</script>
			<%
		   }
		   
		   if(banexi==2){
		   fecha_1="";
			fecha_2="";
			%>
			<script>
			alert("El rango de fechas no se ha registrado todav�a o bien ya se ha borrado, GRACIAS")
			</script>
			<%
		   }
		    if(bancom==3){
		   fecha_1="";
			fecha_2="";
			
			%>
			<script>
			alert("Verifica las fechas, ESTAN FUERA DE RANGO, GRACIAS")
			</script>
			<%
		   }
		}else{
		   //fecha_1="";
			//fecha_2="";
			%>
			<script>
			alert("Debes ingresar un rango de fechas")
			</script><%
		   }
	  
	  	
	   	   	
	   }
 if(unidad_jv.equals("-----------------------Escoja un unidad-------------------------"))
{
%>
<script>
alert("FAVOR DE SELECCIONAR UNA UNIDAD");
</script>
<%	
}else
{	   
if(!(fecha_1.equals("")) && !(fecha_2.equals("")))

{
				  	
					reporte_jv=request.getParameter("reporte");
					unidad_jv=request.getParameter("select");
					fecha_1_jv=request.getParameter("txtf_caduc");
					fecha_2_jv=request.getParameter("txtf_caduci");
					finan_jv=request.getParameter("finan");
					org_jv=request.getParameter("selector");
					
					if((reporte_jv.equals("receta2")) && (!(org_jv.equals("ambos"))))
					{
					%>
					<script>
				self.location='reporte_re2_rc_val.jsp?reporte=<%=reporte_jv%>&unidad=<%=unidad_jv%>&f1=<%=fecha_1_jv%>&f2=<%=fecha_2_jv%>&org=<%=org_jv%>&boton=Show ALL';
					</script>
					
					<%
					}else if((reporte_jv.equals("receta2")) && ((org_jv.equals("ambos"))))
					{
					%>
					<script>
				self.location='reporte_re_val.jsp?reporte=<%=reporte_jv%>&unidad=<%=unidad_jv%>&f1=<%=fecha_1_jv%>&f2=<%=fecha_2_jv%>&org=<%=org_jv%>&boton=Show ALL';
					</script>
					
					<%
					 }
					  else if((reporte_jv.equals("global2")) && (!(org_jv.equals("ambos"))))
					{
					%>
					<script>
				self.location='reporte_glob_rc_val.jsp?reporte=<%=reporte_jv%>&unidad=<%=unidad_jv%>&f1=<%=fecha_1_jv%>&f2=<%=fecha_2_jv%>&org=<%=org_jv%>&boton=Show ALL';
					</script>
					<%
					 }else if((reporte_jv.equals("global2")) && ((org_jv.equals("ambos"))))
					{
					%>
					<script>
				self.location='reporte_global_rc_val.jsp?reporte=<%=reporte_jv%>&unidad=<%=unidad_jv%>&f1=<%=fecha_1_jv%>&f2=<%=fecha_2_jv%>&org=<%=org_jv%>&boton=Show ALL&boton2=Show ALL2';
					</script>
					<%
					 }
					 
        }
					 
	}
				  
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Sistema de Reportes WEB ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="mm_health_nutr.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Deciembre");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------
</script>
<script language="javascript" src="list02.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 12px}
body {
	background-image: url();
	background-color: #E1E1E1;
}
.style2 {font-family: Arial, Helvetica, sans-serif}
a:link {
	color: #000000;
}
a:visited {
	color: #990000;
}
a:hover {
	color: #0000FF;
}
.style5 {
	font-size: 36px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.style6 {font-size: 18px}
.style7 {font-size: 12px; font-family: Arial, Helvetica, sans-serif; }
-->
</style>
</head>
<body onload="hora_Inv()">
<script src="scw.js" type="text/javascript"> </script>
<table width="103%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bgcolor="#D5EDB3">
    <td colspan="2" bgcolor="#FFFFFF">&nbsp;
        <img src="imagenes/nay_ima1.jpg" width="142" height="72" /></td>
    <td height="50" colspan="3" align="center" valign="bottom" nowrap="nowrap" bgcolor="#FFFFFF" id="logo"><div align="right">
      <table width="946" border="0" align="left" cellpadding="2">
        <tr>
          <td width="796"><div align="center" class="style5 style6">SISTEMA REPORTEADOR DE VALIDACIONES POR MES RECETA COLECTIVA </div></td>
          <td width="136" height="67"><img src="imagenes/ssn.jpg" width="162" height="78" /></td>
        </tr>
        </table>
    </div></td>
    <td width="4" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#99CC66">
    <td height="20" colspan="7" background="fn1.jpg" bgcolor="#FFFFFF" id="dateformat">&nbsp;&nbsp;
        <script language="JavaScript" type="text/javascript">
      document.write(TODAY);	</script></td>
  </tr>
  <tr>
    <td width="165" valign="top" bgcolor="#FFFFFF"><table border="0" cellspacing="0" cellpadding="0" width="165" id="navigation">
    </table>
      ����<br />
      &nbsp;<br />
      &nbsp;<br />
      &nbsp;<br />
    </td>
    <td width="4">&nbsp;</td>
    <td colspan="2" valign="top"><div align="center"></div>
        <div align="left"></div>
      <div align="left"></div>
      <table width="925" border="3" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td width="453" class="bodyText"><table width="917" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="37" colspan="4" bgcolor="#FFFFFF"><div align="center">
                      <p align="center"><img src="imagenes/ima_main.jpg" width="508" height="94" /></p>
                  </div></td>
                </tr>
                <tr>
                  <td width="4" nowrap bgcolor="#FFFFFF">&nbsp;</td>
                  <td width="4" bgcolor="#FFFFFF">&nbsp;</td>
                  <td width="638"><div align="center">
                      <table width="687" border="0" align="center" cellpadding="2" cellspacing="3">
                        <form action="reportes_val_rc.jsp" method="post" >
                          <tr>
                            <td colspan="14"><div id="item21" style="display:none" align="justify" >
                                <input type="text" name="txtf_hf" id="txtf_hf" size="10" readonly="true"/>
                            </div></td>
                          </tr>
                          <tr>
                            <td colspan="14" class="style1"><div align="left"><a href="index_reporte_val.jsp">Regresar a Men�</a></div></td>
                          </tr>
                          <tr>
                            <td colspan="14" class="style1"><div align="center">Tipo de Reporte:</div></td>
                          </tr>
                          <tr>
                            <td colspan="16" class="style1" ><input name="reporte" type="radio" value="global2"  checked="checked"/>
Global Receta Colectiva
                              
                          
                              
                            
                            <input name="reporte" type="radio" value="receta2" />
                            Desglose  Receta Colectiva                            </td>
                          </tr>
                          <tr>
                            <td colspan="2" align="right">&nbsp;</td>
                            <td colspan="12" align="right" class="style1">&nbsp;</td>
                          </tr>
                          <tr>
                            <td colspan="2" align="right">&nbsp;</td>
                            <td colspan="12" align="right" class="style1">&nbsp;</td>
                          </tr>
                          <tr>
                            <td colspan="2" align="right">&nbsp;</td>
                            <td colspan="12" align="right" class="style1"><div align="left"></div>
                              <label>

                              <div align="center"><span class="style2">Unidad</span>:
                                  <select name="select" class="style1">
                                    <option selected="selected">-----------------------Escoja un unidad-------------------------</option>
                                    <%
		   if(afi>0)
		   {
		%>
                                    
                                    
                                    <%
		     
             for(x1=0;x1<afi;x1++)
                {
                 
           %>
                                                  <option value="<%=cad1[x1]%>"><%=cad1[x1]%></option>
                                    <%
					  }
					%>
                                    
                                    <%
					  }
					%> 
                                  </select>
                                Origen
                                <select name="selector" class="style1">
                                    <!--option value="ambos">Ambos</option-->
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                                </div>
                                </label></td>
                          </tr>
                          <tr>
                            <td bgcolor="#FFFFFF" colspan="15" class="style1">&nbsp;</td>
                          </tr>
                          <tr>
                            <td bgcolor="#FFFFFF" colspan="15" class="style1">Rango de fechas del:&nbsp;&nbsp;<label>
                  <input name="txtf_caduc" type="text" id="txtf_caduc" size="10" readonly title="dd/mm/aaaa">
                  </label><img src="imagenes/cal.jpg" width="26" height="27" border="0" onClick="scwShow(scwID('txtf_caduc'), event)" />                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <label> al&nbsp;&nbsp;
                  <input name="txtf_caduci" type="text" id="txtf_caduci" size="10" readonly title="dd/mm/aaaa">
                  </label> <img src="imagenes/cal.jpg" width="26" height="27" border="0" onClick="scwShow(scwID('txtf_caduci'), event)" />                 &nbsp;&nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;
         <%
		String fechaa1_jv="";
		String fechaa2_jv="";
		      	  rset_day = stmt_day.executeQuery("SELECT DATE_FORMAT('"+fecha_1+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		      	           while(rset_day.next())
		      	        	   fechaa1_jv= rset_day.getString("DATE_FORMAT('"+fecha_1+"', '%d/%m/%Y')");
						rset_day = stmt_day.executeQuery("SELECT DATE_FORMAT('"+fecha_2+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		      	           while(rset_day.next())
		      	        	   fechaa2_jv= rset_day.getString("DATE_FORMAT('"+fecha_2+"', '%d/%m/%Y')");
							   
							   %>
        </label>
                  <input type="submit" name="Submit" value="Por Fechas" class="style1"/>
        
          <label></label>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="26" class="style1 style2">&nbsp;</td>
                            <td width="23" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td colspan="7" class="style1 style2"><%=!(fecha_1.equals(""))?"Rango desde "+fechaa1_jv+" hasta "+fechaa2_jv:""%></td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="324" colspan="2"><div align="left"></div></td>
                          </tr>
                          <tr>
                            <td class="style1 style2">&nbsp;</td>
                            <td class="style1 style2">&nbsp;</td>
                            <td class="style1 style2">&nbsp;</td>
                            <td class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td width="22" class="style1 style2">&nbsp;</td>
                            <td class="style1 style2">&nbsp;</td>
                            <td colspan="2"><div align="left"></div></td>
                          </tr>
                          <tr>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td colspan="2"><div align="left"></div></td>
                          </tr>
                          <tr>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2">&nbsp;</td>
                            <td align="right" class="style1 style2"><div align="left"></div></td>
                            <td colspan="2"><div align="left"></div></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                          </tr>
                          <input type="hidden" name="cmd" value="1" />
                        </form>
                      </table>
                  </div></td>
                  <td width="179" nowrap bgcolor="#FFFFFF"><img src="imagenes/px.gif" width="1" height="1" alt="" border="0" /></td>
                </tr>
                <tr>
                  <td colspan="4">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="497" border="0" cellpadding="2">
          <tr>
            <td width="489">&nbsp;</td>
          </tr>
      </table></td>
  </tr>
</table>
�<br />
	&nbsp;<br />
<td width="190" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
        <td width="266" bordercolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td width="165">&nbsp;</td>
    <td width="50">&nbsp;</td>
    <td width="4">&nbsp;</td>
    <td width="301">&nbsp;</td>
    <td width="50">&nbsp;</td>
    <td width="190">&nbsp;</td>
	<td width="266">&nbsp;</td>
  </tr>
  <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
	<script src="jquery-1.9.0.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/i18n/jquery.ui.datepicker-es.js"></script>
	<script src="ui/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="demos.css">
	<script>
//--FUNCI�N PARA EL CALENDARIO SOLO SE VISUALIZA LA FECHA MINIMA Y MAXIMA SELECCIONADA ANTERIORMENTE	
	$(function() {
	
	var a�o1=<%=anio1_jv%>;
	var mes1=<%=mes1_jv%>;
	var dia1=<%=dia1_jv%>;
	var a�o2=<%=anio2_jv%>;
	var mes2=<%=mes2_jv%>;
	var dia2=<%=dia2_jv%>;
	var ft1=<%=dia1_jv%>+"/"+<%=mes1_jv%>+"/"+<%=anio1_jv%>;
	
	
		$( "#datepicker" ).datepicker({
			//defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			showOn: "button",
			buttonImage: "calendar.gif",
			buttonImageOnly: true,
			//numberOfMonths: 1,
			defaultDate: ft1,
			minDate:new Date(a�o1, mes1 - 1, dia1),
			//maxDate: '+0m',
			maxDate:new Date(a�o2, mes2 - 1, dia2)
		});
		$( "#datepicker1" ).datepicker({
			//defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			showOn: "button",
			buttonImage: "calendar.gif",
			buttonImageOnly: true,
			//numberOfMonths: 1,
			minDate:new Date(a�o1, mes1 - 1, dia1),
			//maxDate: '+0m',
			maxDate:new Date(a�o2, mes2 - 1, dia2)
		});
	});
  
  </script>
</table>

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
