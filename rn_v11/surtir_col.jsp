<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.DecimalFormat" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: surtir_col.jsp
Funci�n      : Archivo puente para recibir los valores de la receta colectiva anterior (PS), direcciona a 		   surtir_ins_col.jsp si se quiere surtir la receta, si no, regresa a receta_por_surtir.jsp
 ---------------------------------------------------------------------------------------------------- */
 // variables de entorno
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",foliore2_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",encar_jv="",juris_jv="",clave_jv="",eliminar_jv="",usu_jv="",equipo_jv="",integrantes_jv="",recibe_id_jv="",lotes_jv="",cadus_jv="",fechanew="",afiliado_jv="",fuente="",servicio_jv="",encarser_jv="",ela2_jv="",mensaje="";
int tipo_rec=0;
//String eliminar_jv="";
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="",carnet_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="";
String nom_unidad="",no_jur="";
String cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",id_med_jv="",part_jv="",t1_jv="",t2_jv="",t3_jv="",programa_jv="";
String perfil="",sexo_jv="";
// fin variables de entorno
// try para cachar las variables
 	  try {
	    perfil=request.getParameter("perfil");
       	eliminar_jv = request.getParameter("id_prov");
		nombre_jv=request.getParameter("nombre");
		edad_jv=request.getParameter("edad");      
		folio_jv=request.getParameter("folio");
		descrip1_jv=request.getParameter("descrip1");
		indica1_jv=request.getParameter("indica1");   
		present1_jv=request.getParameter("present1");   
		sol1_jv=request.getParameter("sol1");   
		sur1_jv=request.getParameter("sur1");   
		clave1_jv=request.getParameter("clave1");
		descrip2_jv=request.getParameter("descrip2");
		indica2_jv=request.getParameter("indica2");   
		present2_jv=request.getParameter("present2");   
		sol2_jv=request.getParameter("sol2");   
		sur2_jv=request.getParameter("sur2");   
		clave2_jv=request.getParameter("clave2"); 
		descrip3_jv=request.getParameter("descrip3");
		indica3_jv=request.getParameter("indica3");   
		present3_jv=request.getParameter("present3");   
		sol3_jv=request.getParameter("sol3");   
		sur3_jv=request.getParameter("sur3");   
		clave3_jv=request.getParameter("clave3");
		cause_jv=request.getParameter("cause");
		foliore_jv=request.getParameter("foliore");
		encar_jv=request.getParameter("encar");		   
		juris_jv=request.getParameter("juris1");
		clave_jv=request.getParameter("clave_uni");	
		nom_unidad=request.getParameter("uni"); 
		no_jur=request.getParameter("juris");
		uni_jv=request.getParameter("univer");
		cedu_jv=request.getParameter("cedu");
		nomed_jv=request.getParameter("nomed");
		
		cv_dgo_jv=request.getParameter("cv_dgo");
		cv_uni_jv=request.getParameter("cv_uni");
		cv_mpio_jv=request.getParameter("cv_mpio");
		
		part_jv=request.getParameter("part");
		id_med_jv=request.getParameter("id_med");
		t1_jv=request.getParameter("day5");
		carnet_jv=request.getParameter("carnet");
		t2_jv=request.getParameter("mes5");
		t3_jv=request.getParameter("aa5");
		programa_jv=request.getParameter("programa"); 
		sexo_jv=request.getParameter("sexo");
		lotes_jv=request.getParameter("lote"); 
		cadus_jv=request.getParameter("cadu"); 
		
		//tipo_rec=Integer.parseInt(request.getParameter("ban")); //variable para RF o RC
		
		fechanew=request.getParameter("fecha");
		afiliado_jv=request.getParameter("afi");
		fuente=request.getParameter("fuente");
		servicio_jv=request.getParameter("servicio");
		encarser_jv=request.getParameter("encarser");
		ela2_jv=request.getParameter("encar");   
	  } catch (Exception e) {mensaje=e.toString(); }
// fin try
//out.print("---"+encarser_jv);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: Surtiendo Colectiva ::</title>
</head>
<body>
<form action="surtir_col.jsp?id_prov=<%=eliminar_jv%>&fecha=<%=fechanew%>&afi=<%=afiliado_jv%>&fuente=<%=fuente%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>" method="post" name="form" onSubmit="javascript:return ValidateFar1(this)">
<script>
var entrar =  confirm("�DESEA SURTIR EL INSUMO PARA LA RECETA COLECTIVA?");
if(entrar==true)
{
	self.location='surtir_ins_col.jsp?encar=<%=ela2_jv%>&id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&id_med=<%=id_med_jv%>&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&lote=<%=lotes_jv%>&cadu=<%=cadus_jv%>&part=<%=part_jv%>&ban=<%=tipo_rec%>&fecha=<%=fechanew%>&afi=<%=afiliado_jv%>&fuente=<%=fuente%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>';
}
else
{
	alert("PROCESO TERMINADO, INSUMO NO SURTIDO");
	self.location='receta_col_surtir.jsp?encar=<%=ela2_jv%>&foliore=<%=foliore_jv%>&id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=&descrip1=&present1=&indica1=&sol1=&sur1=&cause=<%=cause_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&id_med=<%=id_med_jv%>&part=&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&ban=<%=tipo_rec%>&fecha=<%=fechanew%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>'

	
}
</script>
</form>
<%//out.print("ingreso"+encarser_jv);%>
</body>
</html>
