<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
	String date="";
	String date2="",date3=""; 
   String res=""; 
   String day1=""; 
 
 if(month >=1 && month <= 9)  
 {
 res ="0"+month;
   date=" "+day;
   date= date+"/"+res;
   date= date+"/"+year;  
 }
 else 
{
      date=" "+day;
      date= date+"/"+month;
      date= date+"/"+year;  
	  res+=month;
}
 
 
 if(day >=1 && day <= 9)  
 {
 day1 ="0"+day;
// month=Integer.parseInt(res);
   date2=" "+day;
   date2= date2+"/"+day1;
   date2= date2+"/"+year;  
 //out.print(""+res); 
 }
 else 
{
      date2=" "+day;
      date2= date2+"/"+month;
      date2= date2+"/"+year;  
	  day1+=day;
} 
date3=year+"-"+res+"-"+day1; 
 //out.print(""+res); 
 //fecha2=
 
  //Obtención de la hora
        Calendar calendario = new GregorianCalendar();
		//Calendar calendario = Calendar.getInstance();
		
		int hora=0, minutos=0, segundos=0;
		String min_0="",hora_com="";
		hora =calendario.get(Calendar.HOUR_OF_DAY);
		minutos = calendario.get(Calendar.MINUTE);
		segundos = calendario.get(Calendar.SECOND);
		
		if(minutos>=0 && minutos<=9){
		  min_0="0"+minutos;
		  hora_com=hora + ":" + min_0 + ":" + segundos;
		}
		else{
		hora_com=hora + ":" + minutos + ":" + segundos;
		}
// -------------------

%><%

/*----------------------------------------------------------------------------------------------------------------------
Nombre del Archivo: eliminar_inv_alm.jsp
Fecha:2010
Autor: RHW
  ----------------------------------------------------------------------------------------------------------------------*/
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",foliore2_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",ela2_jv="",juris_jv="",clave_jv="",eliminar_jv="",usu_jv="",equipo_jv="",integrantes_jv="",recibe_id_jv="",t1_jv="",t2_jv="",t3_jv="",tfecha_jv="",servicio_jv="",encarser_jv="",lotes_jv="",cadus_jv="",id_inv="",cant_ant="";
int tipo_rec=0;
//String eliminar_jv="";
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="";
String nom_unidad="",no_jur="",cantsur="",clavesur="",partidasur="",descripsur="",cantinv="",cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="";
int cant2_jv=0,cantinv2=0,cont1=0,mtotal=0,cont6=0,cant_receta1=0,cant_receta3=0,totalreceta=0,mtotalreceta=0,cant_pasti1=0,totalreceta2=0,totalreceta3=0,ttcant_surpas_amp2=0,total=0,total2=0,ttcant_surpas_amp=0,cant_sur_neg=0,var_exist=0,var_salidas=0;
String clave_pasti="",cant_pasti="",cant_receta="",cant_receta2="";

String ela_jv="",id_med_jv="",cant_jv="",cv_finan_jv="",financiamiento1="",layout="",part_jv="",resto_jv="",status="";

try {
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
		ela2_jv=request.getParameter("encar");		   
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
        t1_jv=request.getParameter("day5");
		t2_jv=request.getParameter("mes5");
		t3_jv=request.getParameter("aa5");
		servicio_jv=request.getParameter("servicio");
		encarser_jv=request.getParameter("encarser");
		part_jv=request.getParameter("part");
		
		lotes_jv=request.getParameter("lote"); 
		cadus_jv=request.getParameter("cadu"); 
		
		tipo_rec=Integer.parseInt(request.getParameter("ban")); //variable para RF o RC

			       			   
	  } catch (Exception e) { }
	  
	ResultSet rset =null;
	ResultSet rset_re =null;
	ResultSet rset_inv =null;
    Statement stmt = null ;
	Statement stmt_re = null ;
	Statement stmt_inv = null ;
	Statement stmt_inv2 = null ;
	ResultSet rset_receta =null;
	Statement stmt_receta = null ;
	ResultSet rset_receta1 =null;
	Statement stmt_receta1 = null ;
	ResultSet rset_receta2 =null;
	Statement stmt_receta2 = null ;
	ResultSet rset_pasti =null;
	Statement stmt_pasti = null ;
	Statement stmt1 = null ;
	Class.forName("org.gjt.mm.mysql.Driver");
	 Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
stmt = conn_001.createStatement();
stmt1 = conn_001.createStatement();
stmt_re = conn_001.createStatement();
stmt_inv = conn_001.createStatement();
stmt_inv2 = conn_001.createStatement();
stmt_receta = conn_001.createStatement();
stmt_receta1 = conn_001.createStatement();
stmt_receta2 = conn_001.createStatement();
stmt_pasti = conn_001.createStatement();
	
	rset = stmt.executeQuery("SELECT STR_TO_DATE('"+date+"', '%d/%m/%Y')"); 
                    while(rset.next()){
                    date= rset.getString("STR_TO_DATE('"+date+"', '%d/%m/%Y')");
					}	
					
					
//proceso para regresar valores al inventario

out.print("sol:"+sol1_jv+" sur: "+sur1_jv);
	// cuando cant_sur sea 0, indica que no hay existencias pero se capturó la cant_sol
		if(sur1_jv.equals("0"))
		{
			stmt.execute("delete from receta_colectiva where id='"+eliminar_jv+"'");
		}
	// fin de proceso -----------------------------------------------------------------				
		if(sol1_jv.equals(sur1_jv))
		{
			cant_sur_neg=Integer.parseInt(sur1_jv);
			cant_sur_neg=(cant_sur_neg)*(-1);
			// agregar a movimientos salidas la cantidad a regresar en negativo
			stmt1.execute("insert into movimientos_salidas values ('"+clave1_jv+"','"+descrip1_jv+"','"+lotes_jv+"','"+cadus_jv+"','"+cant_sur_neg+"','1','"+cant_sur_neg+"','"+part_jv+"','-','"+hora_com+"','"+date2+"','3')"); 
			// fin agregar
			rset_re = stmt_re.executeQuery("select cajas,existencias,salidas,id from inventario_uni where clave='"+clave1_jv+"' and lote='"+lotes_jv+"' and caducidad='"+cadus_jv+"' and origen='"+part_jv+"'; ");
			while (rset_re.next())
			{
				var_exist=Integer.parseInt(rset_re.getString("existencias"));
				var_exist+=Integer.parseInt(sur1_jv);
				var_salidas=Integer.parseInt(rset_re.getString("salidas"));
				var_salidas=var_salidas-Integer.parseInt(sur1_jv);
				id_inv=rset_re.getString("id");
			}
			 stmt1.execute("update inventario_uni set salidas='"+var_salidas+"',cajas='"+var_exist+"', existencias='"+var_exist+"' where id='"+id_inv+"'");	
			 
			  // se agrega info a la tabla modificacion
			stmt1.execute("insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','"+lotes_jv+"','"+cadus_jv+"','"+cant_ant+"','"+part_jv+"','"+sur1_jv+"','"+var_exist+"','"+date3+"','"+ela2_jv+"','ELIMINACION DE INSUMO','REINTEGRACION DE SALIDA DE INSUMO AL INVENTARIO',current_timestamp,'"+foliore_jv+"','-','10','-','"+present1_jv+"','"+var_exist+"',0)");						 
					 // fin tabla modi 	
		}				
// fin proceso regresar ---------------------			
			
			

%>
<%!
String clave1_jv="",descrip1_jv="",lote21_jv="",cad21_jv="",ubi1_jv="",cajas1_jv="",pzas1_jv="",resto1_jv="",exi1_jv="";
int correct1=0;

public int ban=0;
public void eliminarReg(String id_inv,int ban) {
  
  System.out.print("valor"+id_inv);
  //int aux=0;
 //aux=Integer.parseInt(request.getParameter("id_dat_aux"));
 if(ban==1){ 
 System.out.print("dato eliminado"+id_inv);
 String idDS="0";
 idDS=id_inv;
 
 //veces=1;
 ResultSet rset__002=null;
	Statement stmt__001 = null ;
    ResultSet rset_elimDS =null;
	Statement stmt_elimDS = null ;
	


	try {
		Connection conn = 
     		// cambie hoy DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
			DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit");         
     		stmt_elimDS = conn.createStatement();
			
			stmt__001 = conn.createStatement();
			System.out.print("id2"+idDS); 
			
					
			rset_elimDS = stmt_elimDS.executeQuery(" DELETE FROM receta_colectiva WHERE id='"+id_inv+"'"); 				  		
			System.out.print("Entra");
			
		while(rset_elimDS.next()){			
			rset_elimDS.deleteRow();
		}
		//conn.close();

	}catch(Exception e){}				  
  
  }
}%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<form action="eliminar_re_col_fecha.jsp?id_prov=<%=eliminar_jv%>&foliore=<%=foliore_jv%>&encar=<%=ela2_jv%>&juris=<%=no_jur%>&uni=<%=nom_unidad%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&clave1=&descrip1=&sur1=&sol1=&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>&ban=<%=tipo_rec%>" method="post" name="form" onSubmit="javascript:return ValidateFar1(this)">
<%eliminarReg(eliminar_jv,1);%>
<%
if(!(eliminar_jv.equals("0"))){
	
	correct1=4;
		    
	
	//stmt.execute("insert into eliminar_issemym values ('"+usu_jv+"','"+correct1+"','"+date+"','"+clave1_jv+"','"+descrip1_jv+"','"+lote21_jv+"','"+cad21_jv+"','"+ubi1_jv+"','"+cajas1_jv+"','"+pzas1_jv+"','"+resto1_jv+"','"+exi1_jv+"',0)");
	
	%>
<script>
alert("El dato ha sido Eliminado");
self.location='rc.jsp?id_prov=<%=eliminar_jv%>&foliore=<%=foliore_jv%>&encar=<%=ela2_jv%>&juris=<%=no_jur%>&uni=<%=nom_unidad%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&clave1=&descrip1=&sur1=&sol1=&part=&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>&ban=<%=tipo_rec%>'
</script>
<%}else{%><script>
self.location='rc.jsp?id_prov=<%=eliminar_jv%>&foliore=<%=foliore_jv%>&encar=<%=ela2_jv%>&juris=<%=no_jur%>&uni=<%=nom_unidad%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&clave1=&descrip1=&sur1=&sol1=&part=&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>&ban=<%=tipo_rec%>'
</script>
<%}%>
<input name="txtf_date1" type="text" size="20" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onkeypress="return handleEnter(this, event)" readonly="true"/>
</form>
</body>

</html>
