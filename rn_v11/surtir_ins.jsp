<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<% 
/*----------------------------------------------------------------------------------------------------------------------
Nombre del Archivo: surtir_ins.jsp
------------------------------------------------------------------------------------------------------------------------*/
// Conexión a la BDD
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");	  
	ResultSet rset =null;
    Statement stmt = null ;
	ResultSet rset_re =null;
	ResultSet rset_inv =null;
	Statement stmt_re = null ;
	Statement stmt_inv = null ;
	Statement stmt_inv2 = null ;
	Statement stmt1 = null;
	stmt = conn_001.createStatement();
	stmt_re = conn_001.createStatement();
	stmt_inv = conn_001.createStatement();
	stmt_inv2 = conn_001.createStatement();
	stmt1 = conn_001.createStatement();
// fin conexión
// obtención de fecha y hora por java
   java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
   String date="";
   String date2=""; 
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
%>
<%
//Variables para realizar la dispensación y el update para receta
String sumatotal="",valor_exis="",cant_por_surtir="",status_surt="",status="",cv_finan_jv="",financiamiento1="",layout="",indi="",ampuleo="",fuente="",mensaje="";
int suma_exis=0,valor_exis_num=0,exis_restantes=0,cant_x_sutir=0,salidas_num=0,total_salidas=0,exis_total_num=0,origen_1=0,cantxsur_may=0,origen_2=0,exist_0=0,entrar_exis_0=0,resto=0,sur1_1_jv=0,resto_jv=0,exist_may=0,sum_exis=0,exis_may=0,sum_salidas=0,pen_sur=0,ban_regreso=0,ban_sp=0,cant_x_sutir_neg=0;
//---------------------------------------------------------------

String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",foliore2_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",encar_jv="",juris_jv="",clave_jv="",eliminar_jv="",usu_jv="",equipo_jv="",integrantes_jv="",recibe_id_jv="",t1_jv="",t2_jv="",t3_jv="",programa_jv="",lotes_jv="",cadus_jv="",id_inv="",afiliado_jv="";
//String eliminar_jv="";
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="";
String nom_unidad="",no_jur="";
String cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",id_med_jv="",part_jv="";
String cantsur="",clavesur="",partidasur="",cantinv="",descripsur="",carnet_jv="",fechanew="",folio_re_jv="";
int cantinv2=0,cont1=0,cant2_jv=0,mtotal=0,cant_sur_neg=0,var_exist=0,var_salidas=0;
int    corte  = 0;
int tipo_rec=0;
 String perfil="",sexo_jv="";
 
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
		tipo_rec=Integer.parseInt(request.getParameter("ban")); //variable para RF o RC 
		fechanew=request.getParameter("fecha");
		afiliado_jv=request.getParameter("afi");
		fuente=request.getParameter("fuente");
		  			   
	  } catch (Exception e) { }

	
	//fechanew=request.getParameter("txtf_date1");	     
	  //out.print(""+fechanew);
	rset = stmt.executeQuery("SELECT STR_TO_DATE('"+date2+"', '%d/%m/%Y')"); 
                    while(rset.next()){
                    fechanew= rset.getString("STR_TO_DATE('"+date2+"', '%d/%m/%Y')");
					}	
	out.print("SAVI/GNKL Software, Todos los Derechos Reservados");
	//out.print("sol:"+sol1_jv+" sur: "+sur1_jv+"clave: "+clave1_jv);
	// proceso para hacer la dispensación auto en una receta con estatus PS
	 // se obtiene el total de existencias de la clave
	 	rset= stmt.executeQuery("select existencias,origen from inventario_uni where clave='"+clave1_jv+"' order by clave+0,origen+0,STR_TO_DATE(caducidad, '%d/%m/%Y') asc;");
	  
	  while(rset.next())
	  {
	  	sumatotal=rset.getString("existencias"); 
		suma_exis=suma_exis+Integer.parseInt(sumatotal);
		if(rset.getString("origen").equals("1"))
					   origen_1=origen_1+Integer.parseInt(rset.getString("existencias"));
					else
					   origen_2=origen_2+Integer.parseInt(rset.getString("existencias"));   
					   
			
	   	   
	  }// fin while
	 // fin obtención del total
	 
	 // code
	 if(suma_exis==0)
			  { exist_0=1;entrar_exis_0=1;}	
			   
		    cant_por_surtir=sol1_jv;
		 	cant_x_sutir=Integer.parseInt(cant_por_surtir);
			cant_x_sutir_neg= cant_x_sutir;// para conversión a neg tabla mod	 
			 if(cant_x_sutir>suma_exis ) //if pendiente por surtir 2
			 	{
					exist_0=1;
					cantxsur_may=1;
				}
	 // fin code
 
 if( exist_0 == 0 )
  {
	  //out.print("CS:"+cant_x_sutir+"ingreso"+exist_0);
      rset= stmt.executeQuery("select clave,descrip,lote,caducidad,existencias,ingreso,salidas,origen,id from inventario_uni where clave='"+clave1_jv+"' order by clave+0,origen+0,STR_TO_DATE(caducidad, '%d/%m/%Y') asc;");
	  
	  while(rset.next())
	  {
		 valor_exis= rset.getString("ingreso");
		 valor_exis_num=Integer.parseInt(valor_exis);
		 exis_restantes=Integer.parseInt(rset.getString("existencias"));
		 //out.print("exis:"+valor_exis+"resto"+resto);
		 if(resto==0)
		 {
		 	cant_por_surtir=sol1_jv;
		 	cant_x_sutir=Integer.parseInt(cant_por_surtir);
			cant_x_sutir_neg=cant_x_sutir;
		 }
		 else
		   {cant_x_sutir=resto;
		    cant_por_surtir=String.valueOf(cant_x_sutir);
			cant_x_sutir_neg=Integer.parseInt(cant_por_surtir);
		   }
		    if(cant_x_sutir<=exis_restantes)
			{
				//out.print("ingreso"+cant_x_sutir+" r: "+exis_restantes);
			 	//valor_resta=valor_exis-cant_x_sutir;
				salidas_num=Integer.parseInt(rset.getString("salidas"));
				total_salidas=salidas_num+cant_x_sutir;
				//out.print("total salidas:"+total_salidas+" = "+salidas_num+"+"+cant_x_sutir);
				exis_total_num=valor_exis_num-total_salidas;
				//out.print("exis:"+exis_total_num+" = "+valor_exis_num+" - "+total_salidas);	
				
				
				//hacer un insert a movimientos_salida
				stmt1.execute("insert into movimientos_salidas values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+cant_por_surtir+"','1','"+cant_por_surtir+"','"+rset.getString("origen")+"','-','"+df.format(new java.util.Date())+"','"+reloj_jv+"','1')"); 
				// fin insert a movimientos_salida
				
		//Se hace el update para la tabla inventario_uni
		 stmt1.execute("update inventario_uni set salidas='"+total_salidas+"',cajas='"+exis_total_num+"', existencias='"+exis_total_num+"' where id='"+rset.getString("id")+"'");	
		//fin rutina de update
		
		 // se agrega info a la tabla modificacion
				cant_x_sutir_neg*=-1;
				stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','"+exis_total_num+"','"+df.format(new java.util.Date())+"','"+encar_jv+"','PENDIENTE POR SURTIR','SURTIENDO INSUMO CON ESTATUS PENDIENTE POR SURTIR',current_timestamp,'"+foliore_jv+"','-','3','-','"+present1_jv+"','"+exis_total_num+"',0)");						 
					 // fin tabla modi 	
		if(resto==0)
		  {sur1_1_jv=cant_x_sutir;
		  //hacer un insert a receta
	
		
		status_surt="SI";
		resto_jv=Integer.parseInt(sol1_jv);
		status="SURTIDO COMPLETO";
		//update para receta y surtir la receta
		stmt1.execute("update receta set cant_sur='"+sur1_1_jv+"',surtido='"+status_surt+"',cant_pendi='"+resto+"',partida='"+rset.getString("origen")+"', status_receta='"+status+"',lote='"+rset.getString("lote")+"', caducidad='"+rset.getString("caducidad")+"',dias='"+fechanew+"' where id='"+eliminar_jv+"'");	
		// fin update -------------------------
		
		/*
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant_x_sutir+"','"+sur1_1_jv+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	*/

				// fin insert a receta
		  
		  }
		else
		  { 
			
			//hacer un insert a receta
	
		
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		//out.print("que show");
		/*
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant_por_surtir+"','"+cant_por_surtir+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
      */
				// fin insert a receta
		    cant_por_surtir=sol1_jv;
		 	cant_x_sutir=Integer.parseInt(cant_por_surtir);
			sur1_1_jv=cant_x_sutir;
		 
		         }//fin else  
			break;
			}// fin de if (cant_x_sutir<=exis_restantes)
			else
			{
				//out.print("Cantidad a Surtir Mayor a Existencias"+cant_x_sutir+" "+valor_exis_num+" "+suma_exis);
			if( !(exis_restantes==0) )
				   {
				   //out.print("Existencias:"+exis_restantes+"Total de Exis: "+suma_exis);
				   resto=cant_x_sutir-exis_restantes;
				   total_salidas=Integer.parseInt(rset.getString("salidas"))+exis_restantes;
				   exist_may=valor_exis_num-total_salidas;
				   //salidas_may=total_salidas+exis_restantes;
				   //out.print("EXIST_MAY:"+exis_may+"salidas_may: "+salidas_may+"salidas"+salidas_may+total_salidas+exis_restantes);
				   //se hace un insert a movimientos_salida
				   			   
				stmt1.execute("insert into movimientos_salidas values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','1','"+exis_restantes+"','"+rset.getString("origen")+"','-','"+df.format(new java.util.Date())+"','"+hora_com+"','1')"); 
				// fin insert a movimientos_salida
				
		//Se hace el update para la tabla inventario_uni
		 stmt1.execute("update inventario_uni set cajas='"+exist_may+"',existencias='"+exist_may+"', salidas='"+total_salidas+"' where id='"+rset.getString("id")+"'");	
		//fin rutina de update
				// se agrega info a la tabla modificacion
				      cant_x_sutir_neg=exis_restantes*-1;
					  stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','"+exist_may+"','"+df.format(new java.util.Date())+"','"+encar_jv+"','PENDIENTE POR SURTIR','SURTIENDO INSUMO CON ESTATUS PENDIENTE POR SURTIR',current_timestamp,'"+foliore_jv+"','-','3','-','"+present1_jv+"','"+exis_total_num+"',0)");						 
					 // fin tabla modi 	
				   sur1_1_jv=cant_x_sutir;
				   
				   //hacer un insert a receta
		
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		
		// update a receta
		
		// --------------

		/*
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+exis_restantes+"','"+exis_restantes+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indica3_jv+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
*/
				// fin insert a receta
				   	
				   }// fin de if
			}// fin else
		 
	  }// fin while
  	}//fin if exist_0
	else
	  {//out.print("Rutina para ingresar cant soli a receta (Pendiente por Surtir 1 Exis 0)\n");
	    if(entrar_exis_0 == 1)//
		{//out.print("existencias 0 solo insert en receta");
		// se toman los valores de los campos faltantes
		status_surt="NO";
		part_jv="2";
		resto_jv=Integer.parseInt(sol1_jv);
		status="PENDIENTE POR SURTIR";
		ban_regreso=1;
		%>
        <script>
			alert("Clave: "+<%=clave1_jv%>+" está sin EXISTENCIAS, no se puede Surtir el INSUMO")
		</script>
        <%
		/*
		// se hace el insert a la tabla receta
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+sol1_jv+"','"+sur1_1_jv+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+part_jv+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','-','-','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
		// fin de insert----------------------
		*/
		}
		else
		{//out.print("cantidad a surtir mayor a existencias");
		 
		  // ordena por caducidad y origen 
		  rset= stmt.executeQuery("select clave,descrip,lote,caducidad,existencias,ingreso,salidas,origen,id from inventario_uni where clave='"+clave1_jv+"' order by clave+0,origen+0,STR_TO_DATE(caducidad, '%d/%m/%Y') asc;");
		 
   while(rset.next())
	  {
		 sum_exis+=Integer.parseInt(rset.getString("existencias"));
		 exis_may=Integer.parseInt(rset.getString("existencias"));
		 var_salidas=Integer.parseInt(rset.getString("salidas"));
		 sum_salidas=var_salidas+exis_may;
		 
		 if( !(exis_may==0) )
		 {
		  //se hace un insert a movimientos_salida
				stmt1.execute("insert into movimientos_salidas values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_may+"','1','"+exis_may+"','"+rset.getString("origen")+"','-','"+df.format(new java.util.Date())+"','"+hora_com+"','1')"); 
				// fin insert a movimientos_salida
		
		//Se hace el update para la tabla inventario_uni
		 stmt1.execute("update inventario_uni set cajas='0',existencias='0', salidas='"+sum_salidas+"' where id='"+rset.getString("id")+"'");	
		//fin rutina de update
		// se agrega info a la tabla modificacion
	     cant_x_sutir_neg=exis_may*-1;
		 stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_may+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','0','"+df.format(new java.util.Date())+"','"+encar_jv+"','PENDIENTE POR SURTIR','SURTIENDO INSUMO CON ESTATUS PENDIENTE POR SURTIR',current_timestamp,'"+foliore_jv+"','-','3','-','"+present1_jv+"','0',0)");						 
					 // fin tabla modi 	
		// insert para receta, caso existencias menor a cantidad a surtir
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		
		//update tabla receta
		// -----------------
		
		programa_jv=sol2_jv;
		financiamiento1=descrip2_jv;
		sexo_jv=indica2_jv;
		reloj_jv=clave2_jv;
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+hora_com+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+exis_may+"','"+exis_may+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indica3_jv+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
		// fin insert
		  ban_sp=1;
		
		  }
		// out.print("exis:"+valor_exis+"resto"+resto);
		 	
	  }
		pen_sur=cant_x_sutir-sum_exis;
		sur1_1_jv=sum_exis;
		status_surt="NO";
		status="PENDIENTE POR SURTIR";
		part_jv="2";
		reloj_jv=clave2_jv;
//update para receta y surtir la receta
//out.print("hace el update");
		stmt1.execute("update receta set cant_sol='"+pen_sur+"',surtido='"+status_surt+"',cant_pendi='"+pen_sur+"',status_receta='"+status+"',dias='"+fechanew+"' where id='"+eliminar_jv+"'");	
		// fin update -------------------------
			
		
	/*
	// se hace el insert a la tabla receta para el resto y cant_sol
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+pen_sur+"','0','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+part_jv+"','"+present1_jv+"','"+pen_sur+"','"+status+"','RF','-','-','-','-','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indica3_jv+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
		// fin de insert----------------------		
		*/
		  %>
<script>
		  alert('CANTIDAD SOLICITADA A SURTIR EXCEDE DE LAS EXISTENCIA DE LA CLAVE, EL ESTATUS DE LA RECETA SERÁ PENDIENTE POR SURTIR, SE DISPENSARAN '+<%=sur1_1_jv%>+' CAJAS');
		  </script>
		  <%  
		  
		}// fin else inmediato
	  }//fin else
	  // toma valores de existencias
	  //out.print("ddd"+clave1_jv);
  rset= stmt.executeQuery("select clave,lote,caducidad,existencias,origen from inventario_uni where clave='"+clave1_jv+"' order by clave+0,origen+0,caducidad;");
	 suma_exis=0;
	 origen_1=0;
	 origen_2=0;
	  
	  while(rset.next())
	  {
	  	sumatotal=rset.getString("existencias"); 
		suma_exis=suma_exis+Integer.parseInt(sumatotal);
		if(rset.getString("origen").equals("1"))
					   origen_1=origen_1+Integer.parseInt(rset.getString("existencias"));
					else
					   origen_2=origen_2+Integer.parseInt(rset.getString("existencias"));  
	  }
	  
  // fin toma valores
  sol1_jv="";
  sur1_1_jv=0;
	// fin proceso --------------------------------------------------------
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: Surtir Receta Pendiete ::</title>
<script language="javascript" src="code_jsn.js"></script>
</head>

<body onload="mueveReloj();">
<form action="surtir_ins.jsp?id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&ban=<%=tipo_rec%>&fecha=<%=fechanew%>&afi=<%=afiliado_jv%>&fuente=<%=fuente%>" method="post" name="form" onSubmit="javascript:return ValidateFar1(this)">
<%//eliminarReg(eliminar_jv,1);%>
<%
eliminar_jv="0";
if(ban_regreso==1){
%>
<script>
alert(" NO SE SURTIÓ EL INSUMO");
self.location='receta_por_surtir.jsp?id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&id_med=<%=id_med_jv%>&part=&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&ban=<%=tipo_rec%>'
</script>
<%}else{

if(ban_sp==0)
{
%>
<script>
alert("SE REALIZÓ EL SURTIMIENTO DEL INSUMO");
self.location='receta_por_surtir.jsp?id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&id_med=<%=id_med_jv%>&part=&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&ban=<%=tipo_rec%>'
</script>
<%}else{%>
<script>
alert("SE REALIZÓ EL SURTIMIENTO DEL INSUMO DE FORMA PARCIAL");
self.location='receta_por_surtir.jsp?id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&id_med=<%=id_med_jv%>&part=&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&ban=<%=tipo_rec%>'
</script>
<%}
}%>
<input name="reloj" type="text" class="style13" onKeyPress="return handleEnter(this, event)" size="15" readonly >
<input name="txtf_date1" type="text" size="20" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>"onkeypress="return handleEnter(this, event)" readonly="true"/>
</form>
<%
// ----- try que cierra la conexión a la base de datos
		 try{
               // Se cierra la conexión dentro del try
                 conn_001.close();
	          }catch (Exception e){mensaje=e.toString();}
           finally{ 
               if (conn_001!=null){
                   conn_001.close();
		                if(conn_001.isClosed()){
                             mensaje="desconectado2";}
                 }
             }
			 //out.print(mensaje);
		// ---- fin de la conexión	 	  
%>

</body>

</html>
