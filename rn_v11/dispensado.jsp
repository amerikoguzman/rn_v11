<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date"  import="java.text.NumberFormat" import="java.util.Locale" errorPage="" %>

<%



 Statement stmt = null;
  Statement stmt01 = null;
  Statement stmt02 = null;
  Statement stmt_min_max = null;
  Statement stmt_d = null;
 Statement stmt_day = null;
  
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
     
	    stmt = conexion.createStatement();
		stmt01 = conexion.createStatement();
		stmt02 = conexion.createStatement();
		stmt_min_max = conexion.createStatement();
		stmt_d = conexion.createStatement();
		stmt_day = conexion.createStatement();
		
	
	 
	 
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


String noaf_jv="",nom_jv="",ap_jv="",ap5_jv="",am_jv="",nombre1_jv="",clave_jv="",clave2_jv="",descrip_jv="",origen_jv="",exist_jv="",origen2="",exist2_jv="0",total22_jv="",clave22_jv="",origen22_jv="",descrip22_jv="";
String but="r";
int ban=0,ban_cur=0;
String fecha_1="",fecha_t11="",fecha_t12="",fecha_2="",fechaa1_jv="",fechaa2_jv="";
int cont6=0,am2_jv=0,exist=0,ap2_jv=0,total=0;
ResultSet rset_001=null;
ResultSet rset_002=null;
ResultSet rset_200=null;
String fecha_min="";
String fecha_max="";


String anio1_jv="",mes1_jv="",dia1_jv="",anio2_jv="",mes2_jv="",dia2_jv="",fecha_t1="",fecha_t2="";

String clave1_jv="",descrip1_jv="",origen1_jv="",exist1_jv="", total_disp="";


try { 


        but=""+request.getParameter("Submit");
		//but2=""+request.getParameter("Submit2");
		//out.print("but ="+but);
        
    }catch(Exception e){System.out.print("not");} 
	


rset_200 = stmt_min_max.executeQuery("SELECT MIN(FECHA_RE),MAX(FECHA_RE),YEAR(min(FECHA_RE)) AS anio1,MONTH(Min(FECHA_RE)) AS mes1 ,DAY(Min(FECHA_RE)) AS dia1,YEAR(MAX(FECHA_RE)) AS anio2,MONTH(MAX(FECHA_RE)) AS mes2 ,DAY(MAX(FECHA_RE)) AS dia2 FROM receta;");
	  
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
	  fecha_t11=rset_200.getString("MIN(FECHA_RE)");
	  fecha_t12=rset_200.getString("MAX(FECHA_RE)");
	  
	  }
	  
	  if(but.equals("Por Fechas"))
  {	    
	  ban=2;	 
	  ban_cur=1;
	  
// Rutina para fechas
           fecha_1= request.getParameter("txtf_caduc");
		   fecha_2= request.getParameter("txtf_caduci");
		 
		   
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
		 
		 
		 //out.print("mes1:"+month+"mes2:"+month2+"año1:"+years+"año2:"+years2);
		 if( (month>=1 && (years>=114 || years<=108))  || (month2>=10 && (years2>=114 || years<=108)) )
		     {bancom=3;}
		   ResultSet rset_d = stmt_d.executeQuery("select MAX(fecha_re) from receta_colectiva;"); 
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

		   ResultSet rset_day = stmt_day.executeQuery("SELECT STR_TO_DATE('"+fecha_1+"', '%d/%m/%Y')"); 
                    while(rset_day.next()){
                    fecha_1= rset_day.getString("STR_TO_DATE('"+fecha_1+"', '%d/%m/%Y')");
					}
	       rset_day = stmt_day.executeQuery("SELECT STR_TO_DATE('"+fecha_2+"', '%d/%m/%Y')"); 
                    while(rset_day.next()){
                    fecha_2= rset_day.getString("STR_TO_DATE('"+fecha_2+"', '%d/%m/%Y')"); }
					//select sum(costo),sum(uni) from xjurisixt1 where fecha between '2009-06-10' and '2009-06-12'; 
   					  if(month2>=12 && years2==114)
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
			alert("El rango de fechas no se ha registrado todavía o bien ya se ha borrado, GRACIAS")
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
%>

<%
		
		fecha_min=request.getParameter("txtf_fecha_min"); 
		fecha_max=request.getParameter("txtf_fecha_max"); 
		
		
		//---------------------------------------------------------------
		if (fecha_min==null && fecha_max==null){
		fecha_min="01/01/2013";
		java.util.Calendar fecha = java.util.Calendar.getInstance();
		//out.println(fecha.get(java.util.Calendar.DATE) + "/" + fecha.get(java.util.Calendar.MONTH)    + "/" + fecha.get(java.util.Calendar.YEAR));
		fecha_max=(fecha.get(java.util.Calendar.DATE) + "/" + (fecha.get(java.util.Calendar.MONTH)+1)    + "/"  + fecha.get(java.util.Calendar.YEAR));
		//out.print(fecha_max+" "+fecha_min);
		}
		//---------------------------------------------------------------
		   
		  
	     if((fecha_min!=null) && (fecha_max!=null))
		 {         
		 java.util.Calendar currDate = new java.util.GregorianCalendar();			
		 Date fecha1=new Date();
		 Date fecha2=new Date();
		 Date fecha1_1=new Date();
		 Date fecha2_1=new Date();
	 	 
		 SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		 fecha1=df.parse(fecha_min);
		 fecha2=df.parse(fecha_max);
		 
		 //out.print(fecha1);
		 //out.print(fecha2);
		 
		 String month =String.valueOf((fecha1.getMonth())+1);
		 String month2 =String.valueOf((fecha2.getMonth())+1);
		 String years =String.valueOf((fecha1.getYear()));
		 String years2 =String.valueOf((fecha2.getYear()));
		 String day=String.valueOf((fecha1.getDate()));
		 String day2=String.valueOf((fecha2.getDate()));
		 
		 //out.print("mes1: "+month+" mes2: "+month2+" año1: "+years+" año2: "+years2+" dia: "+day+" dia2: "+day2); %> <br /> <%
		 years="2013";
		 years2="2013";
		 
		 
		 if (month.length() == 1){
		 	
			month= "0"+month;
			 
		 }
		 
		 if (day.length() == 1){
		 	
			day= "0"+day;
			 
		 }
		 
		if (month2.length() == 1){
		 	
			month2= "0"+month2;
			 
		 }
	 
	 	if (day2.length() == 1){
		 	
			day2= "0"+day2;
			 
		 }
		 
		 fecha_min=years+"-"+month+"-"+day;
		
		 
		 
		 fecha_max=years2+"-"+month2+"-"+day2;
		 
		 //out.println(fecha_min);
		 
		 //out.println(fecha_max);
		 
		 SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
		 //fecha1_1=df2.parse(fecha1);
		 //fecha2_1=df2.parse(fecha2);
		 /*int month = (fecha1.getMonth())+1;
		 int month2 = (fecha2.getMonth())+1;
		 int years = (fecha1.getYear());
		 int years2 = (fecha2.getYear());
		 */
		 //out.print(fecha_min);
		 }
		 
		 
		 
		//---------------------------------------------------------------
		
		
		%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.:CONSUMO PROMEDIO:.</title>

<script src="scw.js" type="text/javascript"> </script>
<script language="javascript" src="list02.js">


function close1()
{//alert("huge");


top.close();  
/*if(navigator.appName=="Microsoft Internet Explorer") { 
this.focus();self.opener = this;self.close(); } 
else { window.open('','_parent',''); window.close(); } 

*/
}



</script>
<script>
function foco_inicial(){
if (document.form.txtf_clave2.value==""){
document.form.txtf_clave.focus();
}
else
{
document.form.txtf_cant.focus();
}
}
</script>
<link rel="stylesheet" href="mm_restaurant1.css" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #E6E6E6;
}
.style1 {color: #000000}
.style2 {
	font-size: 8px;
	color: #009999;
}
.style5 {font-size: 36}
.Estilo8 {font-size: 12px}
-->
</style></head>

<body onLoad="foco_inicial();">
<table width="783" height="346" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
  <tr>
  
    <td width="780"><form id="form" name="form" method="get" action="dispensado.jsp">
	<a href="index_reporte_consumo.jsp">Regresar a Menú </a>
      <table width="775" height="281" border="0" align="center" cellpadding="2">
        <tr>
          <td height="90" bgcolor="#FFFFFF" class="logo style1"><div align="center" class="logo style1">
            <img src="imagenes/nay_ima1.jpg" width="125" height="63" />
          </div></td>
          <td height="90" bgcolor="#FFFFFF" class="logo style1"><div align="center">Dispensado por Clave Receta Farmacia</div></td>
          <td height="90" bgcolor="#FFFFFF" class="logo style1"><img src="imagenes/ssn.jpg" width="143" height="65" /></td>
        </tr>
        <tr>
          <td height="14" colspan="3" bgcolor="#D31145"><span class="style2">iiiiii</span></td>
          </tr>
            <%

		      	 						 		   		    						      			 ResultSet rset_day = stmt_day.executeQuery("SELECT DATE_FORMAT('"+fecha_1+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		      	           while(rset_day.next())
		      	        	   fechaa1_jv= rset_day.getString("DATE_FORMAT('"+fecha_1+"', '%d/%m/%Y')");
						rset_day = stmt_day.executeQuery("SELECT DATE_FORMAT('"+fecha_2+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		      	           while(rset_day.next())
		      	        	   fechaa2_jv= rset_day.getString("DATE_FORMAT('"+fecha_2+"', '%d/%m/%Y')");
							   
							   %>
		  <tr>
		  <td height="50">
		    <div align="right"></div></td>
		  <td><!--input type='text' name='txtf_fecha_min' id='txtf_fecha_min' title='DD/MM/AAAA' size='10' maxlength='10' onclick='scwShow(this, event);' readonly="false"/>
        <img src="calendar.jpg" width="27" height="26" border="0" onClick="scwShow(scwID('txtf_caduc'),event);"/> &nbsp;&nbsp;&nbsp;&nbsp;
         al&nbsp;&nbsp;<input type='text' name='txtf_fecha_max' id='txtf_fecha_max' title='DD/MM/AAAA' size='10' maxlength='10' onclick='scwShow(this, event);' readonly="false"/>
		  <img src="calendar.jpg" width="27" height="26" border="0" onClick="scwShow(scwID('txtf_caduci'),event);"/>
		  <input name="Fechas" type="submit" value="Fechas"/-->
		  
		  <label>Rango de fechas del:&nbsp;&nbsp;
                  <input name="txtf_caduc" type="text" id="datepicker" size="10" readonly title="dd/mm/aaaa">
              </label>                  &nbsp;&nbsp;&nbsp;&nbsp;
              <label> al&nbsp;&nbsp;
                <input name="txtf_caduci" type="text" id="datepicker1" size="10" readonly title="dd/mm/aaaa">
		
        </label>              <input type="submit" name="Submit" value="Por Fechas"/><%if(but.equals("Por Fechas") && (! fecha_1.equals("")) && (! fecha_2.equals(""))){%><%=!(fecha_1.equals(""))?"Rango desde "+fechaa1_jv+" hasta "+fechaa2_jv:""%><input type="submit" name="Submit2" value="Valores Inicial"/><%}%>
          		  </td>
		  <td>
		    <div align="center"><%if (but.equals("Por Fechas") && (! fecha_1.equals("")) && (! fecha_2.equals(""))){%><a href="repor_dispensado.jsp?boton=Show ALL&date1=<%=fecha_1%>&date2=<%=fecha_2%>"><img src="imagenes/exc.jpg" width="37" height="29" border="0" alt="Exportar a Excel" /></a><%}else{%><a href="repor_dispensado.jsp?boton=Show ALL&date1=<%=fecha_t11%>&date2=<%=fecha_t12%>"><img src="imagenes/exc.jpg" width="37" height="29" border="0" alt="Exportar a Excel" /></a><%}%>
	        </div></td>
		  </tr>
		  <tr>
		  <td height="33">		  </td>
		  <td>
		    <div align="center" class="Estilo8">Rango 
		      <%out.print(fecha_t1);%> 
		      del al 
		      <% out.print(fecha_t2);%> 
	          </div></td>
		  <td>
		  </td>
		  </tr>
        <tr>
          <td height="20"><div align="center">CLAVE</div></td>
          <td class="bodyText"><div align="center">DESCRIPCI&Oacute;N</div></td>
          <td><div align="center">CANTIDAD</div></td>
        </tr>
		 <%
		
		 rset_002=stmt01.executeQuery ("select sum(cant_sur) from receta group by juris");
		if(!(fecha_1.equals("")) && !(fecha_2.equals("")))

         {
			 rset_002=stmt01.executeQuery ("select sum(cant_sur) from receta where fecha_re between '"+fecha_1+"' and '"+fecha_2+"' group by juris");
		 }
		while(rset_002.next()){
		 total_disp=rset_002.getString("sum(cant_sur)");
		 }
		 rset_001=stmt.executeQuery ("select clave, descrip, sum(cant_sur) from receta where cant_sur!=0 group by clave order by (clave+0)");
		 if(!(fecha_1.equals("")) && !(fecha_2.equals("")))

         {
			 rset_001=stmt.executeQuery ("select clave, descrip, sum(cant_sur) from receta where cant_sur!=0 and fecha_re between '"+fecha_1+"' and '"+fecha_2+"' group by clave order by (clave+0)");
		 }
		 
		 while (rset_001.next())
		 {
		 %>
        <tr>
          <td width="142" height="20"><div align="center"><%=rset_001.getString("clave") %></div></td>
          <td width="470" class="bodyText"><%=rset_001.getString("descrip") %></td>
          <td width="143"><div align="center"><%=rset_001.getString("sum(cant_sur)") %></div></td>
        </tr>
		<%
		}
		//out.print("hola");
			
		 %>
		  <tr>
          <td width="142" height="20"><div align="center"></div></td>
          <td width="470" class="bodyText"><div align="right">Total</div></td>
          <td width="143"><div align="center"><%=total_disp%></div></td>
        </tr>
      </table>
          <div align="center"></div>
    </form>
    </td>
  </tr>
    <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
	<script src="jquery-1.9.0.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/i18n/jquery.ui.datepicker-es.js"></script>
	<script src="ui/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="demos.css">
	<script>
//--FUNCIÓN PARA EL CALENDARIO SOLO SE VISUALIZA LA FECHA MINIMA Y MAXIMA SELECCIONADA ANTERIORMENTE	
	$(function() {
	
	var año1=<%=anio1_jv%>;
	var mes1=<%=mes1_jv%>;
	var dia1=<%=dia1_jv%>;
	var año2=<%=anio2_jv%>;
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
			minDate:new Date(año1, mes1 - 1, dia1),
			//maxDate: '+0m',
			maxDate:new Date(año2, mes2 - 1, dia2)
		});
		$( "#datepicker1" ).datepicker({
			//defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			showOn: "button",
			buttonImage: "calendar.gif",
			buttonImageOnly: true,
			//numberOfMonths: 1,
			minDate:new Date(año1, mes1 - 1, dia1),
			//maxDate: '+0m',
			maxDate:new Date(año2, mes2 - 1, dia2)
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
