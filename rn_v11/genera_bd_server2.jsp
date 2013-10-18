<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>

<% 
Class.forName("org.gjt.mm.mysql.Driver"); 
NumberFormat nf1 = NumberFormat.getInstance(Locale.US); 
NumberFormat formatter = new DecimalFormat("#0.00"); 
//out.print(mensaje);
//variables para las fechas minimas y maximas calendario
String anio1_jv="",mes1_jv="",dia1_jv="",anio2_jv="",mes2_jv="",dia2_jv="",fecha_t1="",fecha_t2="";


String fecha_1= "",fecha_11= "";
String fecha_2= "",fecha_22= "";
String juris_jv="",juris2_jv="",mpio_jv="",mpio2_jv="",mpio1_jv="",idm_jv="",unidad_jv="",fecha_jv="",clave_jv="",descri_jv="",uni_jv="",costo_jv="",cedis_jv="";
String juris3_jv="",mpio3_jv="",idm3_jv="",unidad3_jv="",fecha3_jv="",clave3_jv="",descri3_jv="",uni3_jv="",costo3_jv="",cedis3_jv="",cldia3_jv="";
String juris4_jv="",fecha4_jv="",uni4_jv="",costo4_jv="",cedis4_jv="";
String juris5_jv="",fecha5_jv="",uni5_jv="",costo5_jv="",cedis5_jv="",mpio5_jv="",clave5_jv="",descri5_jv="",idm5_jv="",slt_jv="",select_jv="",server="",server_jv="";
String but="r";

int ban=0,ban_cur=0;

	ResultSet rset_200 =null;
				ResultSet rset_201 =null;
				ResultSet rset_202 =null;
				ResultSet rset_202s =null;
				ResultSet rset_203 =null;
				ResultSet rset_20 =null;
				ResultSet rset_med =null;
				String cldia_jv="";
	 		
			  Statement stmt_20 = null;
			  Statement stmt_2000 = null;
              Statement stmt_200 = null;
			  Statement stmt_201 = null;
			  Statement stmt_202 = null;
    		  Statement stmt_d = null;
   			  Statement stmt_day = null;
			  Statement stmt_20s = null;
			    Connection conexion=null;
				String mensaje="";
				Connection conexion2=null;
				String mensaje2="";

// conexion forma local 


/*parametros para la conexion*/
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/nayarit";
    String usuario = "";
    String pass = "";
/*procedimiento de la conexion*/
    try{
         Class.forName(driver);
    conexion = DriverManager.getConnection(url);
     stmt_20 = conexion.createStatement();
	 stmt_2000 = conexion.createStatement();
	 stmt_200 = conexion.createStatement();
	  stmt_201 = conexion.createStatement();
	  stmt_202 = conexion.createStatement();
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

// fin conexion local

	  
try { 
        but=""+request.getParameter("Submit");
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}


// extrae la fecha minima y maxima de la tabla, lo cual nos servira para el calendario y hacer el filtro de fecha.


   			rset_200 = stmt_200.executeQuery("SELECT MAX(FECHA),MIN(FECHA),YEAR(min(FECHA)) AS anio1,MONTH(Min(FECHA)) AS mes1 ,DAY(Min(FECHA)) AS dia1,YEAR(MAX(FECHA)) AS anio2,MONTH(MAX(FECHA)) AS mes2 ,DAY(MAX(FECHA)) AS dia2 FROM TOTAL_JURIS_ALL_ACTUALIZACION;");
	  
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
	 fecha_22=rset_200.getString("MAX(fecha)");
	 fecha_11=rset_200.getString("min(fecha)");
	  }
			
		//fin filtro de fechas								
			
// boton por fechas
	  
if(but.equals("Por Fechas"))
      {	    
	  ban=2;	 
	  ban_cur=1;
	  
// Rutina para fechas
           fecha_1= request.getParameter("txtf_caduc");//fecha minima seleccionada del calendario 
		   fecha_2= request.getParameter("txtf_caduci");//fecha maxima selccionada del calendario
		   slt_jv= request.getParameter("select_u_m");// que es lo que se va a afectar (jurisdicción, municipio, unidades o totales)
		   server= request.getParameter("select_server"); // seleccion el servidor hacia donde se va a insertar la información
	
	// selecciona hacia a donde se se va insertar la información
		 if (slt_jv.equals("1"))
		 {
			select_jv="UNIDADES"; 
		 }
		 if (slt_jv.equals("2"))
		 {
			select_jv="MUNICIPIO"; 
		 }
		 if (slt_jv.equals("3"))
		 {
			select_jv="JURISDICCIONES"; 
		 }
		 if (slt_jv.equals("4"))
		 {
			select_jv="TOTALES"; 
		 }
		 //fin selección
		 
		 // selecciona el servidor 
		 if (server.equals("1"))
		 {
			server_jv="LOCAL"; 
		 }
		 if (server.equals("2"))
		 {
			server_jv="DURANGO 189"; 
		 }
		 if (server.equals("3"))
		 {
			server_jv="NUBE 166"; 
		 }
		// fin seleccion servidor
		   
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
		 if( (month>=1 && (years>=114 || years<=108))  || (month2>=3 && (years2>=114 || years<=108)) )
		     {bancom=3;}
        		 
		   ResultSet rset_d = stmt_d.executeQuery("select MAX(fecha) from total_juris_all_actualizacion;"); 
                    String fechmax="";
					int banexi=1;
					while(rset_d.next()){
                    fechmax=rset_d.getString("MAX(fecha)");
					}
					rset_d = stmt_d.executeQuery("select MIN(fecha) from total_juris_all_actualizacion;"); 
                    String fechmin="";
					while(rset_d.next()){
                    fechmin=rset_d.getString("MIN(fecha)");
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
	   /// fin boton por fechas
	   
// conexión servidor local	   
	    if(server.equals("1"))
{
out.print("local");
   /*parametros para la conexion*/
    driver = "com.mysql.jdbc.Driver";
    url = "jdbc:mysql://localhost:3306/nayarit";
    usuario = "";
    pass = "";
/*procedimiento de la conexion*/
    try{
         Class.forName(driver);
    conexion2 = DriverManager.getConnection(url);
    stmt_20s = conexion2.createStatement();
	
	 
	 
	 
         /*guardando la conexion en la session*/
        session.setAttribute("conexion2",conexion2);
       } catch (Exception ex){
        mensaje2=ex.toString();
    }
    mensaje2="conectado";
    if(conexion2.isClosed()){
        mensaje2="desconectado";
    }
	
}
//fin conexion servidor local

//conexión servidor dgo
if(server.equals("2"))
{
	
out.print("durango");
   /*parametros para la conexion*/
    driver = "com.mysql.jdbc.Driver";
   url = "jdbc:mysql://189.197.187.15:3306/nayarit";
    usuario = "gnkl_rep";
    pass = "Avxkc4";
/*procedimiento de la conexion*/
    try{
         Class.forName(driver);
    conexion2 = DriverManager.getConnection(url,usuario,pass);
    stmt_20s = conexion2.createStatement();
	 
	 
	 
         /*guardando la conexion en la session*/
        session.setAttribute("conexion2",conexion2);
       } catch (Exception ex){
        mensaje2=ex.toString();
    }
    mensaje2="conectado";
    if(conexion2.isClosed()){
        mensaje2="desconectado";
    }
	
}
//fin conexión servidor dgo

// conexión servidor nube
if(server.equals("3"))
{
out.print("nube");
   /*parametros para la conexion*/
    driver = "com.mysql.jdbc.Driver";
    url = "jdbc:mysql://166.78.128.202:3306/nayarit";
    usuario = "";
    pass = "";
/*procedimiento de la conexion*/
    try{
         Class.forName(driver);
    conexion2 = DriverManager.getConnection(url,usuario,pass);
    stmt_20s = conexion2.createStatement();
	
	 
	 
	 
         /*guardando la conexion en la session*/
        session.setAttribute("conexion2",conexion2);
       } catch (Exception ex){
        mensaje2=ex.toString();
    }
    mensaje2="conectado";
    if(conexion2.isClosed()){
        mensaje2="desconectado";
    }
	
}
// FIN CONEXIÓN NUBE
  				 
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="dis1.css" type="text/css" />

<title>LLENADO DE DATOS ISEM ENTREGAS</title>
<style type="text/css">
<!--
.style11 {font-weight: bold}
.style12 {color: #FFFFFF}
-->
</style>
</head>

<body>
<script src="scw.js" type="text/javascript"> </script>
<form name="form" action="genera_bd_server2.jsp" method="post">
<table width="160" border="0">
  <tr>
    <td width="154"><p><a name="ancla2" id="ancla2"></a></p></td>
  </tr>
</table>
<table width="1015" border="1" cellpadding="2" bordercolor="#7D2322" class="ver">
                     <tr>
                       <td width="585"><table width="1005" border="1" cellpadding="0">
                         
                         <tr height="17">
                           <td height="26" colspan="6" background="fon3.jpg" bgcolor="#F0F0F0"><div align="center"><a href="#ancla1" class="style12">LLENADO DE INFORMACI&Oacute;N A LAS TABLAS DE ISEM ENTREGAS</a></div></td>
                         </tr>
                         <tr height="17">
                           <td height="26" colspan="4" background="fon3.jpg" bgcolor="#F0F0F0"><span class="style12"><strong>Rango de fechas</strong>:</span>
                             <input name="txtf_caduc" type="text" id="datepicker" size="10" readonly title="dd/mm/aaaa">                             &nbsp;&nbsp;&nbsp;&nbsp;
                             <label> <span class="style12">al</span>&nbsp;&nbsp;<input name="txtf_caduci" type="text" id="datepicker1" size="10" readonly title="dd/mm/aaaa">
                             </label>
                             <%
		String fechaa1_jv="";
		String fechaa2_jv="";
		      	  
		      			 ResultSet rset_day = stmt_day.executeQuery("SELECT DATE_FORMAT('"+fecha_1+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		      	           while(rset_day.next())
		      	        	   fechaa1_jv= rset_day.getString("DATE_FORMAT('"+fecha_1+"', '%d/%m/%Y')");
						rset_day = stmt_day.executeQuery("SELECT DATE_FORMAT('"+fecha_2+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		      	           while(rset_day.next())
		      	        	   fechaa2_jv= rset_day.getString("DATE_FORMAT('"+fecha_2+"', '%d/%m/%Y')");
							   
							   %>
                             <label></label>
                             <select name="select_u_m">
                               <option value="0">----Seleccione----</option>
                               <option value="1">Unidades</option>
                               <option value="2">Municipio</option>
							    <option value="3">Jurisdicciones</option>
								 <option value="4">Totales</option>
                             </select>
							 
                             <select name="select_server">
                               <option value="0">----Seleccione Servidor----</option>
                               <option value="1">Local</option>
                               <option value="2">Durango 189</option>
							   <option value="3">Nube 166</option>
						     </select>
                             <input type="submit" name="Submit" value="Por Fechas" />
               
                             <span class="style12"><%=!(fecha_1.equals(""))?"Rango desde "+fechaa1_jv+" hasta "+fechaa2_jv:""%></span>                             <input type="submit" name="Submit" value="Val. Iniciales" /></td>
                         </tr>
                         <tr height="17">
                           <td height="26" colspan="4" background="fon3.jpg" bgcolor="#F0F0F0"><span class="style12">Periodo del:</span> <span class="style12"><%=fecha_11%></span>&nbsp;&nbsp;<span class="style12">al</span>&nbsp;<span class="style12">&nbsp;<%=fecha_22%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>SELECCIONO:&nbsp;&nbsp;"<%=select_jv%>"&nbsp;&nbsp;SERVIDOR&nbsp;&nbsp;"<%=server_jv%>"</strong></span></td>
                         </tr>
                         <tr height="17">
                           <td width="137" height="23" bgcolor="#CCCCCC" class="dis2"><div align="center">CLAVE UNIDAD </div></td>
                           <td width="213" height="23" bgcolor="#CCCCCC" class="dis2"><div align="center">JURSICCI&Oacute;N SANITARIA </div></td>
                           <td width="254" bgcolor="#CCCCCC" class="dis2"><div align="center"><span class="style3">MUNICIPIO</span></div></td>
                           
                           <td width="381" bgcolor="#CCCCCC" class="dis2"><div align="center">UNIDAD </div></td>
                         </tr>
                        
                         <%
						 if (slt_jv.equals("0") || server.equals("0"))
							{
							%>
							<script>
							
							alert ("Favor de Seleccionar Juris,Unidad,Municipio O Servidor");
							</script>
							<%
							}
						 rset_20 = stmt_200.executeQuery("select cv_uni,juris,mpio,uni_ate from total_juris_all_actualizacion where cv_uni='1' group by cv_uni order by  (juris),mpio,uni_ate ;");
						 if(!(fecha_1.equals("")) && !(fecha_2.equals(""))){
				 			if (slt_jv.equals("1")) 
							{
				
				rset_20 = stmt_200.executeQuery("select cv_uni,juris,mpio,uni_ate from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' group by cv_uni order by  cv_uni ;");//QUERY PARA SELECCIONAR LAS UNIDADES
				
				            }
				
				if (slt_jv.equals("2"))  
							{
				  rset_20 = stmt_200.executeQuery("select cv_uni,juris,mpio,uni_ate from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' group by mpio order by  mpio ;");//QUERY PARA SELECCIONAR LOS MUNICIPIO
				            }
							if (slt_jv.equals("3")) 
							{
				  rset_20 = stmt_200.executeQuery("select cv_uni,juris,mpio,uni_ate from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' group by juris,cv_uni order by  juris ;");//QUERY PARA SELECCIONAR LOS juris
				            }
							if (slt_jv.equals("4") ) 
							{
				  rset_20 = stmt_200.executeQuery("select cv_uni,juris,mpio,uni_ate from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' group by juris order by  juris ;");//QUERY PARA SELECCIONAR LOS totales
				            }
				 
	}
						 
	
				while (rset_20.next()) 
                {
				
			
				cldia_jv=rset_20.getString("cv_uni");	
				juris2_jv=rset_20.getString("juris");
				mpio2_jv=rset_20.getString("mpio");
				
				mpio1_jv=mpio2_jv.replaceAll(" ", "");
				

				
				//stmt_20.execute("create table u_"+cldia_jv+" (select * from total_juris_all_actualizacion where cv_uni='"+cldia_jv+"' group by cv_uni) ;"); //QUERY PARA GENERAR LAS TABLAS POR UNIDAD POR PRIMERA VEZ
				
				//stmt_20.execute("create table m_"+mpio1_jv+" (select * from total_juris_all_actualizacion where cv_uni='"+mpio2_jv+"' group by MPIO) ;"); //QUERY PARA GENERAR LAS TABLAS POR MUNICIPIO POR PRIMERA VEZ
				
			if (slt_jv.equals("2")  ) 
							{
				rset_203 = stmt_2000.executeQuery("select juris,mpio,id_med,fecha,clave,descri,sum(uni) as uni,sum(costo) as costo,cedis from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' and mpio='"+mpio2_jv+"' group by (mpio),clave,fecha;");
				
			while(rset_203.next())
			{
			    
				juris5_jv=rset_203.getString("juris");
				mpio5_jv=rset_203.getString("mpio");
				idm5_jv=rset_203.getString("id_med");
				fecha5_jv=rset_203.getString("fecha");
				clave5_jv=rset_203.getString("clave");
				descri5_jv=rset_203.getString("descri");
				uni5_jv=rset_203.getString("uni");
				costo5_jv=rset_203.getString("costo");
				cedis5_jv=rset_203.getString("cedis");
				
				if ((server.equals("1")) || (server.equals("2")) || (server.equals("3")))
				{
				stmt_20s.execute("insert into m_"+mpio1_jv+" values('"+juris5_jv+"','"+mpio5_jv+"','"+idm5_jv+"','-','"+fecha5_jv+"','"+clave5_jv+"','"+descri5_jv+"','"+uni5_jv+"','"+costo5_jv+"','"+cedis5_jv+"','-') ;"); //QUERY PARA LLENAR LAS TABLAS POR MUNICIPIO
				}
			
			}
			}
				
				
				if (slt_jv.equals("3")) 
							{
				
				rset_201 = stmt_2000.executeQuery("select juris,mpio,uni_ate,fecha,sum(uni) as uni,sum(costo) as costo,cedis,cv_uni from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' and juris='"+juris2_jv+"' and cv_uni='"+cldia_jv+"' group by (juris),mpio,uni_ate,fecha;");
				
			while(rset_201.next())
			{
				cldia3_jv=rset_201.getString("cv_uni");	
				juris3_jv=rset_201.getString("juris");
				mpio3_jv=rset_201.getString("mpio");
				unidad3_jv=rset_201.getString("uni_ate");
				fecha3_jv=rset_201.getString("fecha");
				uni3_jv=rset_201.getString("uni");
				costo3_jv=rset_201.getString("costo");
				cedis3_jv=rset_201.getString("cedis");
				
		if ((server.equals("1")) || (server.equals("2")) || (server.equals("3")))
			{
				if (juris2_jv.equals("JURISDICCION SANITARIA I"))
				{
				stmt_20s.execute("insert into j1 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J1
				}
				if (juris2_jv.equals("JURISDICCION SANITARIA II"))
				{
				stmt_20s.execute("insert into j2 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J2
				}
				if (juris2_jv.equals("JURISDICCION SANITARIA III"))
				{
				stmt_20s.execute("insert into j3 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J3
				}
				/*if (juris2_jv.equals("J.S.4. TENANGO DEL VALLE"))
				{
				stmt_20s.execute("insert into j4 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J4
				}
				if (juris2_jv.equals("J.S.5. TOLUCA"))
				{
				stmt_20s.execute("insert into j5 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J5
				}
				if (juris2_jv.equals("J.S.6. XONACATLAN"))
				{
				stmt_20s.execute("insert into j6 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J6
				}
				if (juris2_jv.equals("J.S.7. TEJUPILCO"))
				{
				stmt_20s.execute("insert into j7 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J7
				}
				if (juris2_jv.equals("J.S.8. TENANCINGO"))
				{
				stmt_20s.execute("insert into j8 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J8
				}
				if (juris2_jv.equals("J.S.9. VALLE DE BRAVO"))
				{
				stmt_20s.execute("insert into j9 values('"+juris3_jv+"','"+mpio3_jv+"','"+unidad3_jv+"','"+fecha3_jv+"','"+uni3_jv+"','"+costo3_jv+"','"+cedis3_jv+"','"+cldia3_jv+"') ;"); //QUERY PARA LLENAR LA TABLA J9
				}*/
			}
			}	
			}
				
				
				
				if (slt_jv.equals("1")) 
							{
				
				
														
rset_200 = stmt_2000.executeQuery("select juris,mpio,id_med,uni_ate,fecha,clave,descri,uni,costo,cedis,cv_uni from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' and cv_uni='"+cldia_jv+"';");

while (rset_200.next())
{
				cldia_jv=rset_200.getString("cv_uni");	
				juris_jv=rset_200.getString("juris");
				mpio_jv=rset_200.getString("mpio");
				idm_jv=rset_200.getString("id_med");
				unidad_jv=rset_200.getString("uni_ate");
				fecha_jv=rset_200.getString("fecha");
				clave_jv=rset_200.getString("clave");
				descri_jv=rset_200.getString("descri");
				uni_jv=rset_200.getString("uni");
				costo_jv=rset_200.getString("costo");
				cedis_jv=rset_200.getString("cedis");
if ((server.equals("1")) || (server.equals("2")) || (server.equals("3")))
{
stmt_20s.execute("insert into u_"+cldia_jv+" values('"+juris_jv+"','"+mpio_jv+"','"+idm_jv+"','"+unidad_jv+"','"+fecha_jv+"','"+clave_jv+"','"+descri_jv+"','"+uni_jv+"','"+costo_jv+"','"+cedis_jv+"','"+cldia_jv+"') ;"); //QUERY PARA LLENAR LAS TABLAS POR UNIDAD

stmt_20s.execute("insert into total_juris_all values('"+juris_jv+"','"+mpio_jv+"','"+idm_jv+"','"+unidad_jv+"','"+fecha_jv+"','"+clave_jv+"','"+descri_jv+"','"+uni_jv+"','"+costo_jv+"','"+cedis_jv+"','"+cldia_jv+"') ;"); //QUERY PARA LLENAR LA TABLA TOTAL_JURIS_ALL
}
}		}				
						 %>
                       
                         <tr height="17">
                           <td height="17" align="right" width="137"><div align="center"><%=rset_20.getString("cv_uni")%></div>
                           <div align="center"></div></td>
                           <td width="213"><div align="left"><%=rset_20.getString("juris")%></div></td>
                           <td width="254"><%=rset_20.getString("mpio")%></td>
                           <td width="381"><%=rset_20.getString("uni_ate")%></td>
                         </tr>
                         <%
				
		 
				}
				if(!(fecha_1.equals("")) && !(fecha_2.equals(""))){
				
				if (slt_jv.equals("4")) 
							{
				rset_202 = stmt_201.executeQuery("select juris,fecha,sum(uni) as uni,sum(costo) as costo,cedis from total_juris_all_actualizacion  where fecha between '"+fecha_1+"' and '"+fecha_2+"' group by (juris),fecha;");
				
			while(rset_202.next())
			{
				
				juris4_jv=rset_202.getString("juris");
				fecha4_jv=rset_202.getString("fecha");
				uni4_jv=rset_202.getString("uni");
				costo4_jv=rset_202.getString("costo");
				cedis4_jv=rset_202.getString("cedis");
		if ((server.equals("1")) || (server.equals("2")) || (server.equals("3")))
				{	
				out.print(server);	
				stmt_20s.execute("insert into total_juris_all_n values('"+juris4_jv+"','"+fecha4_jv+"','"+uni4_jv+"','"+costo4_jv+"','"+cedis4_jv+"') ;"); //QUERY PARA LLENAR LA TABLA total_juris_all_n
				}
			}	
			}
			}
			
				%>
                <script>
				alert ("DATOS GUARDADOS CORRECTAMENTO");
				</script>
                <%
				
				%>
                
				
                         <tr height="17">
                           <td height="17" valign="top">&nbsp;</td>
                           <td><div align="left"></div>
                             <a href="#ancla2">&nbsp;Ir Encabezado</a></td>
                           <td align="right">&nbsp;</td>
                          
                           <td>&nbsp;</td>
                         </tr>
				    
                       </table></td>
                     </tr>
  </table>
                  
<p>&nbsp;</p>
<table width="602" border="0" cellpadding="0" cellspacing="0" bordercolor="#000033">
  <tr>
    <td width="74">&nbsp;</td>
    <td width="442"><div align="center"></div></td>
    <td width="78"><div align="center"></div></td>
  </tr>
  <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
	<script src="jquery-1.9.0.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/i18n/jquery.ui.datepicker-es.js"></script>
	<script src="ui/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="demos.css">
	<script>
	

         
		 
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
			maxDate:new Date(año2, mes2 - 1, dia2),
			//beforeShowDay: unavailable // dias que no se van a visualizar
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
			maxDate:new Date(año2, mes2 - 1, dia2),
			//beforeShowDay: unavailable  // dias que no se van a visualizar
		});
	});
	</script>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<%    
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
//out.print(""+mensaje);             
%>
</form>
</body>
</html>
