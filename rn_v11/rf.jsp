<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.text.SimpleDateFormat" import="java.util.Date" import="java.text.ParsePosition" errorPage="" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<% 
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: rf.jsp
Función      : Valida Claves por fuente de financiamiento, muestra datos del insumo a guardar ,guarda datos 
               de la receta, pantalla principal para guardar una RF. 
   ---------------------------------------------------------------------------------------------------- */

//Conexión a la BDD vía JDBC			
		Class.forName("org.gjt.mm.mysql.Driver");
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
        Statement stmt = conn.createStatement();
		Statement stmtv = conn.createStatement();
		Statement stmt_total = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		Statement stmt_001 = conn.createStatement();
		Statement stmt1og1 = conn.createStatement();
		Statement stmt1og2 = conn.createStatement();
		Statement stmt_og22 = conn.createStatement();
		Statement stmt_o1 = conn.createStatement();
		Statement stmt_o2 = conn.createStatement();
		ResultSet rset = null;
		ResultSet rset_total = null;
		ResultSet rset_001 = null;
		ResultSet rset1 = null;
		ResultSet rsetp = null;
		ResultSet rsetp2 = null;
		ResultSet rset2 = null;
		ResultSet rset3 = null; 
		ResultSet rset_org = null;
		ResultSet rset_org_o1 = null;
		ResultSet rset_org_o2 = null;
// fin conectores -------------------------------------------------			

// Para obtener la fecha
   java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
   String date="";
   String date2=""; 
   String res=""; 
   String day1=""; 
   String status_surt="";
 
 if(month >=1 && month <= 9)  
 {
 res ="0"+month;
   date=" "+day;
   date= date+"/"+res;
   date= date+"/"+year;  
   //out.print(""+res);
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
// fin obtención de fecha -------------------------------------
%>

<%
// variables de entorno ---------------------------------------
String hora_ini_jv="",mensaje="";
String lugar_jv="";
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",foliore2_jv="",foliore3_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",encar_jv="",juris_jv="",clave_jv="",eliminar_jv="",usu_jv="",equipo_jv="",integrantes_jv="",recibe_id_jv="",cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",id_med_jv="",part_jv="",layout="",cv_finan_jv="",financiamiento1="",precio_jv="",monto_jv="",exi_jv="",lote2_jv="",cant_jv="",date2_jv="",precio="",carnet_jv="-",programa_jv="",fechanew="",partida_o1_jv="",partida_o2_jv="",cant_o1_jv="",cant_o2_jv="",sumatotal="",lotes_jv="",cadus_jv="";
String but="r";
String but2="r"; 
String but3=""; 
String nom_unidad="",no_jur="";
int cont1=0,cont2=0,cont3=0,cv_med2=0,cv_med3=0,pos=0,posf=0,x1=0,sur2=0,sol2=0,cant2_jv=0,resto_jv=0,cant2_o1_jv=0,cant2_o2_jv=0,mtotalot=0,mtotalotsur=0,mtotalotsur2=0,resto22_jv=0,ban_clave=0;
double monto2=0.0,precio2=0.0,ptotal=0.0,mtotal=0.0,ptotal2=0.0;
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="0",present1_jv="",clave1_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="",t1_jv="",t2_jv="",t3_jv="",tfecha_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="",status="",sexo_jv="";

String financiamiento[]= new String[5000];
String afiliado[]= new String[5000];
String afiliadoEdad[]= new String[5000];
String origen[]= new String[5000];
String lotes[]= new String[5000];
String exis[]= new String[5000];
String org[]= {"1","2"};
//array para fuentes
String finan[] = {"SEGURO POPULAR","OPORTUNIDADES","FASSA","ASE","SMNG","Gasto Catastróficos"};
String encontrado="",oring="";
int ban=0,ban2=0,afi=0;
financiamiento[0]="";
afiliado[0]="";
origen[0]="";
int cont=0,cont5=0;
String perfil="";
String turno="";
String vigencia = "";
int tipo_rec=0;
String cv_financ1="";
int ban_imp=0;

//variables de lotes.jsp
 String clave_bus="",cant_sur_vacio="",cant_por_surtir="",valor_exis="",indi="",corte="",ampuleo="";
 
 int existe=0,vacio=0,vacio_sur=0,suma_exis=0,origen_1=0,origen_2=0,cant_x_sutir=0,cant_x_sutir_neg=0,salida=0,valor_exis_num=0,salidas_num=0,exis_total_num=0,total_salidas=0,sur1_1_jv=0,exis_restantes=0,resto=0,exist_may=0,salidas_may=0,exist_0=0,cantxsur_may=0,entrar_exis_0=0,sum_exis=0,var_salidas=0,sum_salidas=0,pen_sur=0,exis_may=0;

//----

// fin variable de entorno
// toma los valores mandados como parámetros, series de try - catch
try{
		perfil=request.getParameter("perfil");
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
        uni_jv=request.getParameter("univer");
		cedu_jv=request.getParameter("cedu");
		nomed_jv=request.getParameter("nomed");
		cv_dgo_jv=request.getParameter("cv_dgo");
		cv_uni_jv=request.getParameter("cv_uni");
		cv_mpio_jv=request.getParameter("cv_mpio");
		part_jv=request.getParameter("part");
		id_med_jv=request.getParameter("id_med");
		t1_jv=request.getParameter("day5");
		t2_jv=request.getParameter("mes5");
		t3_jv=request.getParameter("aa5");
		carnet_jv=request.getParameter("carnet");
		programa_jv=request.getParameter("programa");  
		sexo_jv=request.getParameter("sexo"); 
		tipo_rec=Integer.parseInt(request.getParameter("ban")); //variable para RF o RC
		but3=request.getParameter("but");
}catch(Exception e){ System.out.print("Doesn't make the altaOK"); }

//out.print(""+but3);
try{
      nom_unidad=request.getParameter("uni");   
}catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
try{
      no_jur=request.getParameter("juris");   
}catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
try { 
      but=""+request.getParameter("Submit");
}catch(Exception e){System.out.print("not");} 
foliore3_jv=request.getParameter("txtf_foliore");
// fin try -catch
// Cuando se oprime Mostrar- proceso
if(but.equals("Mostrar"))
     {
	  //out.print("ingreso A MOSTRAR");
	  cb_jv=request.getParameter("txtf_cb");
	  foliore_jv=request.getParameter("txtf_foliore");
	  carnet_jv=request.getParameter("txtf_carnet");
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  tfecha_jv=t1_jv+t2_jv+t3_jv;
	 rset3= stmt.executeQuery("select * from receta where folio_re='"+foliore_jv+"' ");
	 while(rset3.next())
	 {
	 	cont5++;
	 }
	 if (cont5>0)
	 {
	 %>
	 <script>
	 alert("RECETA EXISTENTE")
	 </script>
	 <%
	 foliore_jv="";
	 edad_jv="0";
	 } else
	 { 
	 rsetp= stmt.executeQuery("select * from seguro_p2 where folio='"+cb_jv+"'    ");
	 rsetp2= stmtv.executeQuery("select * from seguro_p2 where folio='"+cb_jv+"'  and f_fin >= sysdate() ");
	 
	 if(!rsetp2.next())
	{
			vigencia = "false";		 
	}
	 String strFecha = "";
	 Date fechaActual = new Date();
	 SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yyyy");
     strFecha = formatoDeFecha.format(fechaActual);
 	 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");  
 	 Date fecha1 = sdf.parse(strFecha , new ParsePosition(0));
	 
	while(rsetp.next())
		{
				  String fechaLocal =formatoDeFecha.format(rsetp.getDate("f_fin"));
				  Date fecha2 = sdf.parse(fechaLocal , new ParsePosition(0));
				if (fecha1.before(fecha2)){
					vigencia = "false";
				}else{
					vigencia = "true";		
				}	
				if ( strFecha.equals(fechaLocal) ){
					vigencia = "false";
				}
					  afiliado[afi]=rsetp.getString("nombre");    
					  afiliadoEdad[afi]=rsetp.getString("nombre")+","+rsetp.getString("edad") +","+ vigencia +","+ rsetp.getString("folio") +","+ rsetp.getString("f_fin")+","+ rsetp.getString("sexo");    
                     afi++;
					 folio_jv=rsetp.getString("folio");
					 programa_jv=rsetp.getString("programa");
	     }// fin while
	  }	 
	cb_jv="";
	clave1_jv="";
	descrip1_jv="";
	part_jv="";
	edad_jv="";
 
}
// fin Mostrar- proceso
// inicio proceso Médico
if(but.equals("Médico"))
     {
	 	//out.print("hi");
	  medico_jv=request.getParameter("txtf_medico");
	  foliore_jv=request.getParameter("txtf_foliore");
	  nombre_jv=request.getParameter("txtf_paciente");
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  carnet_jv=request.getParameter("txtf_carnet");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  sexo_jv=request.getParameter("txtf_sexo");
	  	  
	 rset1= stmt.executeQuery("select * from medico where cedula='"+medico_jv+"'");
	  
	  while(rset1.next())
				     {
					 //uni_jv=rset1.getString("num");
 					 cedu_jv=rset1.getString("cedula");
					 nomed_jv=rset1.getString("nombre");
	  
	                 }
	clave1_jv="";
	descrip1_jv="";
	part_jv="";
	
	%>
	<script>
	// alert("hi");
	 document.form.a.focus();
	</script>
	
	<%
 
}	
if(but.equals("Borrar Datos"))
     {
t1_jv="";
t2_jv="";
t3_jv="";
foliore_jv="";
nombre_jv="";
folio_jv="";
nomed_jv="";
cedu_jv="";
clave1_jv="";
descrip1_jv="";
sol1_jv="";
sur1_jv="";
carnet_jv="-";
}

// fin proceso Médico

// inicio proceso clave
if(but.equals("Clave"))
  { // inicio de if but
    //out.print("Ingreso A CLAVE");
	ban_clave=1;
	// variables de la receta
	med1_jv=request.getParameter("txtf_med1");
	  //cause_jv=request.getParameter("txtf_cause");
	  //uni_jv=request.getParameter("txtf_uni");	
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  foliore_jv=request.getParameter("txtf_foliore");
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  nombre_jv=request.getParameter("txtf_paciente");	
	  carnet_jv=request.getParameter("txtf_carnet");	
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  sexo_jv=request.getParameter("txtf_sexo");
	// ----------
	
	clave_bus=request.getParameter("txtf_med1");
	  // Si el campo está vacío
	  if(clave_bus.equals(""))
		  {
			  vacio++;
		  %>
<script>
		  alert('CAMPO VACÍO, Ingrese una CLAVE');
		  //document.form.txtf_sol1.focus();
		  </script>
<%
		 
		  }
		 // checa si la clave está en el catálogo de insumos
		 if(vacio==0)
		  {
		   rset= stmt.executeQuery("select clave,descrip,present,id_med from clave_med where clave='"+clave_bus+"' ");
	  	     while(rset.next())
		 	  {
				clave1_jv=rset.getString("clave"); 
				descrip1_jv=rset.getString("descrip"); 
				present1_jv=rset.getString("present");
				id_med_jv=rset.getString("id_med");
				existe++;
			  }
		  
		  if(existe==0)
		    {
			%>
<script>
		  		alert('CLAVE FUERA DE CATÁLOGO, Ingrese una CLAVE VÁLIDA');
		  		</script>
		    <%
			
			}
		  else
		   {
			//out.print("sigue el proceso");
			// se obtiene las fuentes de financiamiento de la clave a dispensar
			rset= stmt.executeQuery("select descrip_finan from h_1001 where clave='"+clave_bus+"'");
	 		while(rset.next())
	 			{
	   				financiamiento[pos]=rset.getString("descrip_finan");     
       				pos++;
	  	  		}
		    // fin de while se guardan las fuentes en el arreglo financiamiento		
	  //Rutina para obtener la fuente de financiamento
	  for(int k=0;k<6;k++)
	      {
		     for(int z=0;z<pos;z++)
			   {
			     if(financiamiento[z].equals(finan[k]))
				   {
				     encontrado=financiamiento[z];
					 ban=1;
					 
					 if (encontrado.equals("SEGURO POPULAR")){
						 cv_financ1="032";
					 }
					 if (encontrado.equals("FASSA")){
						 cv_financ1="011";
					 }
					 break;
				   }
				   if(ban==1)
				      break;
			   }//fin for z
			   if(ban==1)
			      break;
		  } // fin for k
	//fin rutina de toma de fuentes de financ	
	//rutina para odernar clave por caducidad y origen 
		rset= stmt.executeQuery("select clave,lote,caducidad,existencias,origen from inventario_uni where clave='"+clave_bus+"' order by clave+0,origen+0,caducidad;");
	  
	  while(rset.next())
	  {
	  	sumatotal=rset.getString("existencias"); 
		suma_exis=suma_exis+Integer.parseInt(sumatotal);
		if(rset.getString("origen").equals("1"))
					   origen_1=origen_1+Integer.parseInt(rset.getString("existencias"));
					else
					   origen_2=origen_2+Integer.parseInt(rset.getString("existencias"));  
		// Si ya no hay existencias
	 	    
	  }
	// code
	 if(suma_exis==0)
		  {
			 
		  %>
<script>
		  alert('CLAVE SIN EXISTENCIA, CAPTURA LA CANTIDAD SOLICITADA Y EL ESTATUS DE LA RECETA SERÁ PENDIENTE POR SURTIR');
		  </script>
		  <%
		// break;
		  }// fin if		
	// fin code
	   
	   }// fin else	
	}// if campo vacio	
%>
<script>
		//alert("SIII");
		//focusLocus();
    </script>  
<%
sol1_jv="";
  }// fin if Clave

// fin proceso clave

if(but.equals("Corte"))
{

 
	
		

		int turnoNext   = 0;
		String turnoActual = "";
		boolean banderaTurno = false;
		
		try{
			rset2= stmt2.executeQuery("select turno  from historial_corte_receta where idCorte =(select max(idCorte) from historial_corte_receta where fecha_corte = SYSDATE() and unidad= '"+clave_jv+"')");
			 
			
			 if (rset2.next()){
			 	turnoActual =  rset2.getString("turno");
				rset2 = null;
			 }else{
			 	turnoActual = "-1";
			 }
			 
			
			 
			 if (turnoActual.equals("1")){
						
					turnoNext= 2;		
						
			   }
			   if (turnoActual.equals("2")){
						
						
					turnoNext= 3;	
						
			  }
			 if (turnoActual.equals("3")){
						
					turnoNext= 1;	
				
			 }
			 
			  if (turnoActual.equals("-1")){
						
					turnoNext= 3;	
				
			 }
			 
			
			 
			 	 
			 
		 			stmt.execute("insert into historial_corte_receta (encargado,fecha_corte,unidad, turno,idReceta) values ('"+encar_jv+"',sysdate(),'"+clave_jv+"','"+turnoNext+"',(select max(id) from receta))");
	  	
			 		stmt.execute("update receta_valores_default set valor = 0 where parametro='CORTE_UNIDAD_"+clave_jv+"'");

			
			
					  if (turnoNext == 1 ){
						
						 %>	
<script>
							
							 alert("Turno guardado  : Matutino se redireccionara al menu principal"  	);
							  self.location.href='index.jsp'
						 </script>
						 <%	
						
					   }
					   if (turnoNext == 2 ){
						
						 %>	
<script>
							
							 alert("Turno guardado  : Vespertino se redireccionara al menu principal"  	);
							 self.location.href='index.jsp'
						 </script>
						 <%	
						
					   }
			 			if (turnoNext == 3 ){
						
						 %>	
						 <script>
						 	
							 alert("Turno guardado  : Nocturno se redireccionara al menu principal"  	);
							 self.location.href='index.jsp'
						 </script>
						 <%	
						
					   }
			     
	
			
			 

		}catch(Exception e){ 
			System.out.print("Doesn't make the altaOK"); 
		}finally{
		
			System.out.print("Corte terminado");
		}


}

// inicio proceso Capturar
if(but.equals("Capturar"))
  { // inicio de if but
    //out.print("Ingreso");
	// variables de la receta
		
	  foliore_jv=request.getParameter("txtf_foliore");
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
	  nombre_jv=request.getParameter("txtf_paciente");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  //uni_jv=request.getParameter("txtf_uni");	
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  clave1_jv=request.getParameter("txtf_clave1");
	  descrip1_jv=request.getParameter("txtf_descrip1");
	  sol1_jv=request.getParameter("txtf_sol1");
	  sur1_jv=request.getParameter("txtf_sur1");
	  radiopro_jv=request.getParameter("radio_pro");
	  radiosur_jv=request.getParameter("radiosur");
	  cause_jv=request.getParameter("txtf_cause");
	  
	  present1_jv=request.getParameter("txtf_present");
	  id_med_jv=request.getParameter("txtf_idmed");
	  part_jv=request.getParameter("txtf_part");
	  cv_finan_jv=request.getParameter("txtf_finan");
	  
	  reloj_jv=request.getParameter("reloj");
	  date_jv=request.getParameter("txtf_date");
	  cant_jv=request.getParameter("txtf_exist");
	  
	  financiamiento1=request.getParameter("txtf_ff");
	  
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  tfecha_jv=t1_jv+"/"+t2_jv+"/"+t3_jv;
	  carnet_jv=request.getParameter("txtf_carnet");
	  fechanew=request.getParameter("txtf_date1");
	  sexo_jv=request.getParameter("txtf_sexo");
	// fin variables --------
	
	cant_sur_vacio=request.getParameter("txtf_sol1");
	sol1_jv=request.getParameter("txtf_sol1");
	encontrado=request.getParameter("txtf_ff");
	//clave_bus=request.getParameter("txtf_clave1");
	clave1_jv=request.getParameter("txtf_clave1");
	descrip1_jv=request.getParameter("txtf_descrip1");
	
	 rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}
	 rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+tfecha_jv+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    tfecha_jv= rset_001.getString("STR_TO_DATE('"+tfecha_jv+"', '%d/%m/%Y')");
					}
					
			if(tipo_rec==2)
			   		{fechanew=tfecha_jv;}
	
	  // Si el campo está vacío
	  if(cant_sur_vacio.equals(""))
		  {
			  vacio_sur++;
		  %>
<script>
		  alert('FALTA INGRESAR DATOS EN EL CAMPO CANTIDAD SOLICITADA');
		  </script>
<%
		 
		  }// fin if (cant_sur_vacio.equals(""))
		  if(foliore_jv.equals(""))
		  {
			  vacio_sur++;
		  %>
<script>
		  alert('FALTA INGRESAR EL NO DE FOLIO EN EL CAMPO FOLIO');
		  </script>
<%
		 
		  }// fin if (cant_sur_vacio.equals(""))

		 // checa si la clave está en el catálogo de insumos
	if(vacio_sur==0)
	   {	
	 
// incluir proceso para facturación

// --------------------------------
		    
  // para disminuir la dispensación
  
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
			   
		    cant_por_surtir=request.getParameter("txtf_sol1");
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
      rset= stmt.executeQuery("select clave,descrip,lote,caducidad,existencias,ingreso,salidas,origen,id from inventario_uni where clave='"+clave1_jv+"' order by clave+0,origen+0,STR_TO_DATE(caducidad, '%d/%m/%Y') asc;");
	  
	  while(rset.next())
	  {
		 valor_exis= rset.getString("ingreso");
		 valor_exis_num=Integer.parseInt(valor_exis);
		 exis_restantes=Integer.parseInt(rset.getString("existencias"));
		 //out.print("exis:"+valor_exis+"resto"+resto);
		 if(resto==0)
		 {
		 	cant_por_surtir=request.getParameter("txtf_sol1");
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
					  stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','"+exis_total_num+"','"+df.format(new java.util.Date())+"','"+encar_jv+"','SALIDA DE INSUMO','SALIDA DE INSUMO EN RECETA POR FARMACIA',current_timestamp,'"+foliore_jv+"','-','1','-','"+present1_jv+"','"+exis_total_num+"',0)");						 
					 // fin tabla modi 	
				
		if(resto==0)
		  {sur1_1_jv=cant_x_sutir;
		  //hacer un insert a receta
	
		
		status_surt="SI";
		resto_jv=Integer.parseInt(request.getParameter("txtf_sol1"));
		status="SURTIDO COMPLETO";
		indi=request.getParameter("txtf_ind");
		
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant_x_sutir+"','"+sur1_1_jv+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	

				// fin insert a receta
		  
		  }
		else
		  { 
			
			//hacer un insert a receta
	
		
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		indi=request.getParameter("txtf_ind");
		
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant_por_surtir+"','"+cant_por_surtir+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	

				// fin insert a receta
		    cant_por_surtir=request.getParameter("txtf_sol1");
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
				   			   
				stmt1.execute("insert into movimientos_salidas values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','1','"+exis_restantes+"','"+rset.getString("origen")+"','-','"+df.format(new java.util.Date())+"','"+reloj_jv+"','1')"); 
				// fin insert a movimientos_salida
				
		//Se hace el update para la tabla inventario_uni
		 stmt1.execute("update inventario_uni set cajas='"+exist_may+"',existencias='"+exist_may+"', salidas='"+total_salidas+"' where id='"+rset.getString("id")+"'");	
		//fin rutina de update
		
		
		
		// se agrega info a la tabla modificacion
				      cant_x_sutir_neg=exis_restantes*-1;
					  stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','"+exist_may+"','"+df.format(new java.util.Date())+"','"+encar_jv+"','SALIDA DE INSUMO','SALIDA DE INSUMO EN RECETA POR FARMACIA',current_timestamp,'"+foliore_jv+"','-','1','-','"+present1_jv+"','"+exis_total_num+"',0)");						 
					 // fin tabla modi 	
			
				   sur1_1_jv=cant_x_sutir;
				   
				   //hacer un insert a receta
		
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		indi=request.getParameter("txtf_ind");
		
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+exis_restantes+"','"+exis_restantes+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	

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
		resto_jv=Integer.parseInt(request.getParameter("txtf_sol1"));
		status="PENDIENTE POR SURTIR";
		indi=request.getParameter("txtf_ind");
		
		// se hace el insert a la tabla receta
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+sol1_jv+"','"+sur1_1_jv+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+part_jv+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','-','-','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
		// fin de insert----------------------
		
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
				stmt1.execute("insert into movimientos_salidas values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_may+"','1','"+exis_may+"','"+rset.getString("origen")+"','-','"+df.format(new java.util.Date())+"','"+reloj_jv+"','1')"); 
				// fin insert a movimientos_salida
		
		//Se hace el update para la tabla inventario_uni
		 stmt1.execute("update inventario_uni set cajas='0',existencias='0', salidas='"+sum_salidas+"' where id='"+rset.getString("id")+"'");	
		//fin rutina de update
		
		// se agrega info a la tabla modificacion
				      cant_x_sutir_neg=exis_may*-1;
					  stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_may+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','0','"+df.format(new java.util.Date())+"','"+encar_jv+"','SALIDA DE INSUMO','SALIDA DE INSUMO EN RECETA POR FARMACIA',current_timestamp,'"+foliore_jv+"','-','1','-','"+present1_jv+"','0',0)");						 
					 // fin tabla modi 	
		
		// insert para receta, caso existencias menor a cantidad a surtir
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		indi=request.getParameter("txtf_ind");
		
		
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+exis_may+"','"+exis_may+"','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RF','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
		// fin insert
		
		
		  }
		// out.print("exis:"+valor_exis+"resto"+resto);
		 	
	  }
		pen_sur=cant_x_sutir-sum_exis;
		sur1_1_jv=sum_exis;
		status_surt="NO";
		status="PENDIENTE POR SURTIR";
		part_jv="2";
	// se hace el insert a la tabla receta para el resto y cant_sol
		stmt1.execute("insert into receta values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+pen_sur+"','0','"+status_surt+"','"+encar_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+part_jv+"','"+present1_jv+"','"+pen_sur+"','"+status+"','RF','-','-','-','-','"+carnet_jv+"','-','"+fechanew+"','A','"+sexo_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
		// fin de insert----------------------		
		
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
  }// fin if vacio
  
  
}// fin if(Capturar)

// -- fin proceso Capturar


if(but.equals("Imprimir"))
     {
	  foliore2_jv=request.getParameter("txtf_foliore");
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
	  sexo_jv=request.getParameter("txtf_sexo");
	  
	  
	  nombre_jv="";
	  edad_jv="";
	  folio_jv="";
	  uni_jv="";
	  cedu_jv="";
	  nomed_jv="";
	  clave1_jv="";
	  descrip1_jv="";
	  sol1_jv="";
	  sur1_jv="";
	  radiopro_jv=request.getParameter("radio_pro");
	  radiosur_jv=request.getParameter("radiosur");
	  cause_jv="";
	  reloj_jv=request.getParameter("reloj");
	  date_jv=request.getParameter("txtf_date");
	  %>
	  <script>
	  self.location='ticket.jsp?folio=<%=foliore2_jv%>&receta5=RF&encar=<%=encar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&ban=<%=tipo_rec%>';
	  
	  </script>
	  <%
	  foliore_jv="";
	  //
	   	/*  foliore_jv=request.getParameter("txtf_foliore");
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
	  nombre_jv=request.getParameter("txtf_paciente");
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  uni_jv=request.getParameter("txtf_uni");	
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  clave1_jv=request.getParameter("txtf_clave1");
	  descrip1_jv=request.getParameter("txtf_descrip1");
	  sol1_jv=request.getParameter("txtf_sol1");
	  sur1_jv=request.getParameter("txtf_sur1");
	  radiopro_jv=request.getParameter("radio_pro");
	  radiosur_jv=request.getParameter("radiosur");
	  cause_jv=request.getParameter("txtf_cause");
	  reloj_jv=request.getParameter("reloj");
	  date_jv=request.getParameter("txtf_date");
	   */
}


	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.:Captura Receta FECHA AUTOMATICA:.</title>
<script language="javascript" src="list02.js"></script>
<script type="text/javascript">



function validar(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
  patron = /\d/; // Solo acepta números



  //SOLO LETRAS-->patron =/[A-Za-z\s]/; // 4
  //SOLO LETRAS Y NUMEROS --> patron = /\d/; // Solo acepta números
  //numeros y letras --> patron = /\w/; // Acepta números y letras
//no aceptan numeros --> patron = /\D/; // No acepta números
//aceptan las letras ñÑ --> patron =/[A-Za-zñÑ\s]/; // igual que el ejemplo, pero acepta también las letras ñ y Ñ  
//determinado letras y numeros --> patron = /[ajt69]/;//También se puede hacer un patrón que acepte determinados caracteres, poniendolos entre corchetes. Veamos un ejemplo para validar que solo se acepte a, j, t, 6 y 9:
   
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
} 

function foco_inicial(){
	
	
	if(document.form.txtf_med1.value==""){
	window.scrollTo(100,800);	
    document.form.txtf_sol1.focus();
	document.form.txtf_med1.focus();
	}
	else if(document.form.txtf_sol1.value==""){
	window.scrollTo(100,800);	
	document.form.txtf_sol1.focus();
	}
	else if(document.form.txtf_medico.value==""){
	document.form.txtf_medico.focus();
	}
	if((document.form.txtf_foliosp!="")&&(document.form.txtf_nomed.value=="")){
	document.form.slct_afiliados.focus();
	}
	if(document.form.txtf_foliosp.value==""){
	document.form.txtf_cb.focus();
	}
	/*if (document.form.txtf_t1.value==""){
	document.form.txtf_t1.focus();*/
	//alert("Entra");
	/*if (document.form.txtf_t1.value==""){
	document.form.txtf_t1.focus();
	}*/
	
	if (document.form.txtf_foliore.value==""){
	document.form.txtf_foliore.focus();
	}
	//alert("Entra");
	
	
	mueveReloj();
}


</script>

<style type="text/css">
<!--
.style2 {
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
}
.style4 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	text-align: left;
}
.style5 {font-size: 14px}
.style7 {
	font-size: 16px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style11 {font-size: 12px}
.style13 {
	font-size: 12px;
	color: #990000;
	font-weight: bold;
}
.Estilo1 {color: #000000}
.Estilo4 {
	color: #000066;
	font-weight: bold;
}
.Estilo5 {
	font-size: 16px;
	font-weight: bold;
}
.Estilo6 {color: #000099}
.Estilo7 {
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
	color: #000099;
	font-weight: bold;
}
.Estilo8 {color: #003399}
cen {
	text-align: center;
}
cen2 {
	text-align: center;
}
.style4 table {
	text-align: center;
}
-->
</style>
</head>

<body onLoad="foco_inicial();">
<form name="form" method="post" action="rf.jsp?uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&but=<%=but3%>&ban=<%=tipo_rec%>">
<a href="index.jsp" class="style2">REGRESAR A MENÚ</a>
<table width="972" height="644" border="3" align="center" cellpadding="2">
<input type="hidden" name="vigencia" />
  <tr>
    <td width="956" height="114"><table width="837" border="0" align="center" cellpadding="2">

      <tr>
        <td width="114" height="59"><img src="imagenes/nay_ima1.jpg" width="203" height="78" /></td>
        <td width="339"><div align="center" class="style7">RECETA M&Eacute;DICA<br />
        DIRECCI&Oacute;N DE ATENCI&Oacute;N M&Eacute;DICA</div>
          <span class="style13"><span class="Estilo1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Estilo6">&nbsp;</span></span></span><span class="Estilo7">&nbsp;BIENVENIDO (A):</span><span class="style2"><span class="Estilo4">&nbsp;<%=encar_jv%></span></span></td>
        <td width="225"><div align="right"><img src="imagenes/ssn.jpg" width="219" height="89" /></div>
          <!--input name="Submit"  type="reset" class="bodyText" value="Borrar Datos" /--></td>
      </tr>
    </table>
      <table width="854" height="45" border="0" align="center" cellpadding="2">
        <tr>
          <td width="311" height="41">
            <table width="270" height="0%" border="0" cellpadding="2">
              <tr>
			
                <td width="221" height="100%" class="style2">FECHA:&nbsp;
             <% 
			 if (tipo_rec==1)
               {
			 %>
                <input name="txtf_date1" type="text" size="20" value="<%= day1 %>/<%=res%>/<%= year %>" onKeyUp="putFecha(this.form)" onKeyPress="return handleEnter(this, event)" readonly/></td>
             <%
			   }else{
			 %>  
              <input name="txtf_date" type="text" class="style13" onKeyPress="return handleEnter(this, event)" value="<%=day1%>/<%=res%>/<%= year %>" size="1" readonly style="visibility:hidden"/>
                  &nbsp;
                  <input name="txtf_t1" type="text" onKeyPress="return handleEnter(this, event)" onKeyUp="putDays()" value="<%=t1_jv%>" size="1" maxlength="2"/>
			       <input name="txtf_t2" type="text" size="1" maxlength="2" onKeyUp="putMonthss()" value="<%=t2_jv%>" onKeyPress="return handleEnter(this, event)" />
                    <strong>                    /</strong>
                    <input name="txtf_t3" type="text" size="2" maxlength="4" value="2013" onBlur="foco_fecha();" onKeyPress="return foco_fecha();" readonly/><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;<span class="Estilo7">&nbsp;&nbsp;DD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AAAA</span></strong>
               <%
			   }
			   %>
                     
              </tr>
          </table>          </td>
          <td width="197"><table width="167" height="0%" border="0" cellpadding="2">
            <tr>
              <td width="225" height="100%" class="style2">HORA:
                <input name="reloj" type="text" class="style13" onKeyPress="return handleEnter(this, event)" size="15" readonly ></td>
            </tr>
          </table>          </td>
          <td width="326" align="center" class="style2">Ingrese No. Folio
            <input name="txtf_foliore" id="txtf_foliore" type="text" class="style13"  value="<%=foliore_jv%>" size="20" onKeyPress="return handleEnter(this, event)"/>
            <!--onKeyPress="return validar(event)"-->
           <a href="reimp.jsp?uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&carnet=-&part=<%=part_jv%>" target="_blank">Reimprir Ticket</a>
            <table width="152" height="0%" border="0" align="right" cellpadding="2">
          </table></td>
        </tr>
    </table>    </td>
  </tr>
        <tr>
          <td height="2" colspan="3" class="style4"><div id="item7" style="display:block" align="justify" ></div></td>
        </tr>
        <tr>
          <td height="41" colspan="3" class="style4"><table width="710" border="0" align="center" cellpadding="2">
            <tr>
              <td width="533" class="style2">UNIDAD DE SALUD
              <input type="text" name="txtf_unidadmed" size="60" colspan="3" class="style13"  value="<%=nom_unidad%>" readonly onKeyPress="return handleEnter(this, event)"/></td>
              <td width="170"><table width="170" border="0" align="left" cellpadding="2">
                <tr>
                  <td width="162" align="center"><div align="center" class="style2">JURISDICCION&nbsp;&nbsp;<input name="txtf_njuris" type="text" class="style13" value="<%=no_jur%>" size="1" readonly onKeyPress="return handleEnter(this, event)"/>
                  </div></td>
                </tr>
              </table></td>
            </tr>
            
          </table></td>
        </tr>
        <tr>
          <td height="91" colspan="3" class="style4"><table width="901" border="0" align="center" cellpadding="2">
            <tr>
              <td height="27" colspan="5" class="style2">Introduzca C&oacute;digo  Paciente: 
                <input name="txtf_cb" type="text" id="txtf_cb"  onchange="<%=but="Mostrar"%>" />
              <input name="Submit" type="submit" class="subHeader" value="Mostrar" onClick="return verifica_FOLIO(document.forms.form);"/>&nbsp;&nbsp;
              <select name="slct_afiliados" id="slct_afiliados" class="style2" onkeypress="return handleEnter(this, event)" onChange="putNom(this.form)">
                <option>---- AFILIADOS------</option>
                <%
		   if(afi>0)
		   {
		%>
                <span class="style2">AFILIADOS
                  
					
                <%
		     
             for(x1=0;x1<afi;x1++)
                {
                  // out.print(""+x1);
           %>
                <option value="<%=afiliadoEdad[x1]%>"><%=afiliado[x1]%></option>
                <%
					  }
					%>
                <%
					  }
					%>
              </select>
              <a href="paciente.jsp" target="_blank">Nuevo paciente</a></td>
            </tr>
            <tr>
              <td width="146" height="52" class="style2">NOMBRE DEL PACIENTE:
                <label> </label>
                <span class="style5">
                <label> </label>
                </span>
                <label><span class="style2">
</span></label></td>
              <td width="318" class="style2"><span class="style5">
                <input name="txtf_paciente" type="text" class="style13" value="<%=nombre_jv%>" size="50"  onkeypress="return handleEnter(this, event)" onChange="mayPaciente(this.form)" readonly/><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />NOMBRE(S)&nbsp;&nbsp;APELLIDO PATERNO &nbsp;APELLIDO MATERNO
              </span></td>
              <td width="112" class="style2">Carnet:&nbsp;
              <input name="txtf_carnet" type="text" class="style13" value="<%=carnet_jv%>" size="8"  onkeypress="return handleEnter(this, event)"/></td>
              <td width="121" class="style2">Sexo:
              <input name="txtf_sexo" type="text" class="style13" value="<%=sexo_jv%>" size="8"  onkeypress="return handleEnter(this, event)" onChange="maySexo(this.form)" readonly/></td>
              <td width="172"><table width="137" border="0" align="right" cellpadding="2">
                <tr>
                  <td width="129"><div align="left"><span class="style2">
                   
                EDAD</span><span class="style2">
                    <input name="txtf_edad" type="text" class="style13" value="<%=edad_jv%>" size="5"  onkeypress="return handleEnter(this, event)" readonly/>
                    </span></div></td>
                </tr>
              </table></td>
            </tr>
          </table>          </td>
        </tr>
        <tr>
          <td height="82" colspan="3" class="style4"><table width="733" border="0" align="center" cellpadding="2">
            <tr>
              <td width="87"  class="style2"><div align="center">POBLACION ABIERTA </div></td>
              <td width="135" class="style2"><div align="center">OPORTUNIDADES</div></td>
              <td width="140" class="style2"><div align="center">SEGURO POPULAR </div></td>
              <td width="345" class="style2"><div align="center">No. DE FOLIO S.P. </div></td>
            </tr>
            <tr>
              <td class="style11"><label> <br />
                    <input name="radio_pro" type="radio" value="PA" onKeyPress="return handleEnter(this, event)" />
              </label></td>
              <td class="style11"><label>
                <input name="radio_pro" type="radio" value="OP" onKeyPress="return handleEnter(this, event)" />
                <img src="imagenes/oportunidades.jpg" width="107" height="32" /></label></td>
              <td class="style11"><label>
                <input name="radio_pro" type="radio" value="SP" checked="checked" onKeyPress="return handleEnter(this, event)" />
                <img src="imagenes/salud_seguro_popu.jpg" width="107" height="32" /></label></td>
              <td class="style11"><input name="txtf_foliosp" type="text" readonly class="style13" value="<%=folio_jv%>" size="50" onKeyPress="return handleEnter(this, event)"/></td>
            </tr>
            
          </table></td>
        </tr>
        <tr>
          <td height="38" colspan="3" class="style4"><table width="763" border="0" align="center" cellpadding="2">
            <tr>
              <td width="755" class="style2"><a href="medico.jsp" target="_blank">CÓDIGO</a>: 
                <input name="txtf_medico" type="text" size="10"  onchange="<%=but2="Medico"%>" onKeyPress="return handleEnter(this, event)" /><input name="Submit" type="submit" class="subHeader" value="Médico" onClick="return verifica_FOLIO(document.forms.form);" />
              NOMBRE:
              <input name="txtf_nomed" id="txtf_nomed" type="text" class="style13" value="<%=nomed_jv%>" size="35"  onKeyPress="return handleEnter(this, event)" readonly />
              <span class="style2">C&Eacute;DULA: 
              <input name="txtf_cedu" id="a" type="text" class="style13" value="<%=cedu_jv%>" size="10"  onKeyPress="return handleEnter(this, event)" readonly/>
              </span></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="219" colspan="3" class="style4">
          
          <table width="875" border="0" align="center" cellpadding="2">
            
           <tr class="style2">
    <td colspan="4" class="style11" align="left">Ingrese Clave:
              <input type="text" name="txtf_med1" id="txtf_med1" size="10" value="<%=med1_jv%>" onKeyPress="return handleEnter(this, event)"/><input name="Submit" type="submit" class="subHeader" value="Clave" onClick="return verifica_FOLIO(document.forms.form);"/>&nbsp;<a href="index_carga_clave.jsp" target="_blank">Agregar Clave</a>| <a href="existencias.jsp" target="_blank">Ver Existencias</a></td>
               <td colspan="5" class="style11"><span class="style2"><span class="Estilo8">TOTAL EXISTENCIAS:</span><span class="Estilo5"> <%=suma_exis%>*<br />Origen 1=<%=origen_1%>&nbsp;Origen 2=<%=origen_2%></span></span></td>
              <td colspan="2" class="style11"><label>
                <div align="center">
                  <input type="text" name="txtf_idmed" size="1" value="<%=id_med_jv%>" style="visibility:hidden" />
                 <span class="style2">FUENTE                </span>
                  <input type="text" name="txtf_present" size="1" value="<%=present1_jv%>" style="visibility:hidden"/>
                  
                  <input type="text" name="txtf_finan" size="1" value = "<%=cv_financ1%>"  style="visibility:hidden"/>
                  
                  <input type="text" class="style2" name="txtf_ff" value="<%=encontrado%>" readonly />
                </div>
                
              </label></td>
      </tr>
      <tr>
        <td width="70" class="style11"><span class="letras"><span class="style2">CLAVE</span></span></td>
              <td colspan="2" class="style11"><span class="letras"><span class="style2">DESCRIPCI&Oacute;N</span></span></td>
              <td width="68" class="style11"><span class="letras"><span class="style2">CANT SOL</span></span></td>
              <td colspan="2" class="style11"><span class="letras"><span class="style2">CANT SUR</span></span></td>
              <td colspan="3" class="style11"><span class="style2">INDICACIONES</span></td>
              <td colspan="2" class="style11"><span class="letras"><span class="style2">CAUSES: <input name="txtf_cause" type="text" class="style13" onKeyPress="return handleEnter(this, event)" value="<%=cause_jv%>" size="1" onClick="putEmpty()" /></span></span></td>
            </tr>
            <tr>
              <td class="style11"><input type="text" name="txtf_clave1" size="10" class="style2" value="<%=clave1_jv%>"  readonly="true"/></td>
              <td colspan="2" class="style11"><textarea name="txtf_descrip1" cols="50"  class="style2" readonly><%=descrip1_jv%></textarea></td>
              <td class="style11"><input type="text" name="txtf_sol1" id="txtf_sol1" size="5" value="<%=sol1_jv%>" onKeyPress="return validar(event)"  /></td>
              <td colspan="2" class="style11"><input type="text" name="txtf_sur1" size="5" value="<%=sur1_1_jv%>"  onchange="setSur(this.form)" onKeyPress="return validar(event)" readonly/></td>
              <td colspan="3" class="style11"><div align="center">
                <label for="textfield"></label>
                <input type="text" name="txtf_ind" id="txtf_ind" value="-" />
                
              </div></td>
              <td colspan="2" class="style11">&nbsp;
               <% 
			 if (tipo_rec==1)
               {
			 %>   
              <input name="Submit" type="submit" id="capturaid" class="but" value="Capturar" onClick="return verificaN_Fa(document.forms.form);" onChange="setSur(this.form)"/>
             <%
			   }else{
			 %>	
              <input name="Submit" type="submit" id="capturaid" class="but" value="Capturar" onClick="return verificaN_Fa22(document.forms.form);" onChange="setSur(this.form)"/>
              <%
			      }
			   %>    
		</td>
             <tr class="letras">
              <td colspan="9" class="style11"><hr /></td>
            </tr>
            <tr class="letras">
              <td class="style11"><span class="style2">CLAVE</span></td>
              <td width="213" class="style11"><span class="style2">DESCRIPCI&Oacute;N</span></td>
              <td width="67" class="style11"><span class="style2">LOTE</span></td>
              <td class="style11"><span class="style2">CADUCIDAD</span></td>
              <td colspan="2" class="style11"><span class="style2">CANT. SOL</span></td>
              <td width="68" class="style11"><span class="style2">CANT. SUR</span></td>
              <td width="56" class="style11"><span class="style2">ESTATUS</span></td>
              <td width="48" class="style11"><span class="style2">ORIGEN</span></td>
              <td width="161" class="style11">&nbsp;</td>
            </tr>
            <tr class="letras">
              <td colspan="9" class="style11"><hr /></td>
            </tr>
    <%
			rset=stmt.executeQuery("select clave,descrip,lote,caducidad,cant_sol,cant_sur,surtido,id,partida from receta where folio_re='"+foliore_jv+"'");
 
   while(rset.next()) 
        {
			ban_imp=1; 
    %>              
            <tr>
              <td class="style2"><%=rset.getString("clave")%></td>
              <td class="style2"><%=rset.getString("descrip")%></td>
              <td class="style2"><%=rset.getString("lote")%></td>
              <td class="style2"><%=rset.getString("caducidad")%></td>
              <td colspan="2" class="style2"><%=rset.getString("cant_sol")%></td>
              <td class="style2"><%=rset.getString("cant_sur")%></td>
              <td class="style2"><%=rset.getString("surtido")%></td>
              <td class="style2"><%=rset.getString("partida")%></td> 
			  <%
			    eliminar_jv=rset.getString("id");
				lotes_jv=rset.getString("lote");
				cadus_jv=rset.getString("caducidad");
				sol1_jv=rset.getString("cant_sol");
				sur1_jv=rset.getString("cant_sur");
				clave1_jv=rset.getString("clave");
				part_jv=rset.getString("partida");
				
			  %>
              <td class="style2">
          
              <input  type="button" id="btn_<%=eliminar_jv%>" name="btn_<%=eliminar_jv%>" class="subHeader" value="Eliminar" onclick='location.href="eliminar_fecha.jsp?id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&clave2=<%=clave2_jv%>&descrip2=<%=descrip2_jv%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=sol2_jv%>&sur2=<%=sur2_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&programa=<%=programa_jv%>&perfil=<%=perfil%>&sexo=<%=sexo_jv%>&lote=<%=lotes_jv%>&cadu=<%=cadus_jv%>&ban=<%=tipo_rec%>"'/>&nbsp;
              </td>
             
              </tr>
    <%
		}
	%>
    <tr class="letras">
              <td colspan="9" class="style11"><hr /></td>
            </tr>
    <tr>
              <td height="28" class="style11">&nbsp;</td>
              <td class="style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11"><div >
                <% 
			 if (tipo_rec==1)
               {
			 %>
              <input name="Submit" <%if (ban_imp==0) {out.print("disabled='disabled'");}%>  type="submit" class="subHeader" value="Imprimir" onClick="return verificaN_Fa2(document.forms.form);" />
              <%
			   }else{
			 %>  
               <input name="Submit" <%if (ban_imp==0) {out.print("disabled='disabled'");}%> type="submit" class="subHeader" value="Imprimir" onClick="return verificaN_Fa3(document.forms.form);" />
               
               <%
			      }
			   %></div>
              </td>
            </tr>
    
        </table></td>
  </tr>
</table></td>
  </tr>
        </tr>
</table>
			
 </form>
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
