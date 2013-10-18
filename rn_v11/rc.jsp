<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.DecimalFormat" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<% 
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: rc.jsp
Función      : Valida Claves por fuente de financiamiento, muestra datos del insumo a guardar ,guarda datos 
               de la receta colectiva, pantalla principal para guardar una RC. 
   ---------------------------------------------------------------------------------------------------- */
//Conexión a la BDD vía JDBC		
	Class.forName("org.gjt.mm.mysql.Driver");
	NumberFormat nf1 = NumberFormat.getInstance(Locale.US); 
	DecimalFormat formateador = new DecimalFormat("###,###,###.####");

				  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
                  Statement stmt = conn.createStatement();
				  Statement stmt1 = conn.createStatement();
				  Statement stmt_001 = conn.createStatement();
				  Statement stmt_01= conn.createStatement();
				  Statement stmt_0001= conn.createStatement();
				  Statement stmt_00001= conn.createStatement();
				  Statement stmt_elimDS= conn.createStatement();
				  Statement stmt_total= conn.createStatement();
				  Statement stmt1og1= conn.createStatement();
				  Statement stmt_og22= conn.createStatement();
				  Statement stmt1og2= conn.createStatement();
				  ResultSet rset = null;
				  ResultSet rset_total = null;
				  ResultSet rset_001 = null;
				  ResultSet rset_org = null;
				  ResultSet rset1 = null;
				  ResultSet rset2 = null;
				  ResultSet rset3 = null; 
				  ResultSet rset_elimDS=null;
				  //ResultSet stmt1og1=null;
				  Statement stmt_o1 = conn.createStatement();
				  ResultSet rset_org_o1 = null;
				  Statement stmt_o2 = conn.createStatement();
				  ResultSet rset_org_o2 = null;
// fin conexión
// Se obtiene fecha y hora
    java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
   String date="";
   String date2=""; 
   String res="";
   String day1=""; 
   String foliore2_jv="";
   String clave_jv="1001";
   String status_surt="";
   
 if(month >=1 && month <= 9)  
 {
 res ="0"+month;
// month=Integer.parseInt(res);
   date=" "+day;
   date= date+"/"+res;
   date= date+"/"+year;  

 ////out.print(""+res); 
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
 ////out.print(""+res); 
 }
 else 
{
      date2=" "+day;
      date2= date2+"/"+month;
      date2= date2+"/"+year;  
	  day1+=day;
}
// fin fecha ----------------------------------------------------- 
// Variables de entorno
String cad1[]=new String[1000];
String financiamiento[]= new String[5000];
String origen[]= new String[5000];
String finan[] = {"SEGURO POPULAR","OPORTUNIDADES","FASSA","ASE","SMNG","Gasto Catastróficos"};
String org[]= {"1","2"};
financiamiento[0]="";
origen[0]="";

String carnet_jv="-",sexo_jv="-",corte="-",ampuleo="-",programa_jv="-";

int pos=0,tam2=0,x1=0,cont3=0,ban=0,posf=0,ban2=0,cant2_jv=0,cv_med2=0,cv_med3=0,cont1=0,cont5=0,cont6=0,sur2=0,sol2=0,mtotal=0,total2=0,total=0,flag=0,customerIds=0,cant_pasti_ampu=0,cant_surpas_amp=0,ttcant_surpas_amp=0,ttcant_surpas_amp2=0,ban_clave=0,tipo_rec=0,cant_x_sutir_neg=0;
String encontrado="",cant_jv="",financiamiento1="",cv_finan_jv="",layout="",status="",cant_pasti="",cant_surpas="",count_cv="",servicio_jv="",fechanew="",sumatotal="",cant_sur_vacio="",valor_exis="",indi="",mensaje="";

String f_gnk=request.getParameter("txtf_fol2");
String partida_o1_jv="",cant_o1_jv="",partida_o2_jv="",cant_o2_jv="",lotes_jv="",cadus_jv="",cant_por_surtir="";
int cant2_o1_jv=0,cant2_o2_jv=0,mtotalot=0,mtotal_col=0,mtotalotsur=0,mtotalotsur2=0,resto22_jv=0,vacio=0,existe=0,vacio_sur=0;

int suma_exis=0,origen_1=0,origen_2=0,cant_x_sutir=0,salida=0,valor_exis_num=0,salidas_num=0,exis_total_num=0,total_salidas=0,sur1_1_jv=0,exis_restantes=0,resto=0,exist_may=0,salidas_may=0,exist_0=0,cantxsur_may=0,entrar_exis_0=0,sum_exis=0,var_salidas=0,sum_salidas=0,pen_sur=0,exis_may=0;
//double ttcant_surpas_amp2=0.0;				  
String hora_ini_jv="";
String lugar_jv="";
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",eliminar_jv="",clave_bus="";
String but="r";
String nom_unidad="",no_jur="",juris_jv="";
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="",desdmed_jv="",descripmed_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="",t1_jv="",t2_jv="",t3_jv="",tfecha_jv="",encarser_jv="";
String ela_jv="", ela2_jv="";
int cont2=0,resto_jv=0;
String fol2_jv="";
String fol2_vi_jv="";
String cv_financ1="";
// fin variables de entorno
// serie de try para obtener datos
 	  try {
       		fol2_vi_jv = request.getParameter("fol_vi");       			   
	  } catch (Exception e) { }
String folgnk_vi_jv="";
 	  try {
       		folgnk_vi_jv = request.getParameter("fol_gnk_vi");       			   
	  } catch (Exception e) { }


String cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",part_jv="",id_med_jv="";
try{
        nombre_jv=request.getParameter("nombre");
		edad_jv=request.getParameter("edad");      
		folio_jv=request.getParameter("folio");
		descrip1_jv=request.getParameter("descrip1");
		indica1_jv=request.getParameter("indica1");   
		present1_jv=request.getParameter("present1");   
		sol1_jv=request.getParameter("sol1");   
		sur1_jv=request.getParameter("sur1");   
		clave1_jv=request.getParameter("clave1");
		cause_jv=request.getParameter("cause");
		foliore_jv=request.getParameter("foliore");		   
        clave_jv=request.getParameter("clave_uni");
		ela2_jv=request.getParameter("encar");   
		no_jur=request.getParameter("juris");
		nom_unidad=request.getParameter("uni");
		juris_jv=request.getParameter("juris1");   
		
		cv_dgo_jv=request.getParameter("cv_dgo");
		cv_uni_jv=request.getParameter("cv_uni");
		cv_mpio_jv=request.getParameter("cv_mpio");
		part_jv=request.getParameter("part");
		id_med_jv=request.getParameter("id_med");
		
		t1_jv=request.getParameter("day5");
		t2_jv=request.getParameter("mes5");
		t3_jv=request.getParameter("aa5");
		servicio_jv=request.getParameter("servicio");
		encarser_jv=request.getParameter("encarser");
		
		tipo_rec=Integer.parseInt(request.getParameter("ban"));
		
		 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
try { 
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
// fin de try --------------------------------------------------------------
// proceso Ver
if(but.equals("Ver"))
{
      descripmed_jv=request.getParameter("select_servi2");
      med1_jv=request.getParameter("txtf_med1");
	  cause_jv=request.getParameter("txtf_cause");
	  uni_jv=request.getParameter("txtf_uni");	
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  foliore_jv=request.getParameter("txtf_foliore");
	  ela2_jv=request.getParameter("txtf_ela");
	  servicio_jv=request.getParameter("txtf_servicio");
	  encarser_jv=request.getParameter("txtf_encarser");	 
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  tfecha_jv=t1_jv+t2_jv+t3_jv;
		////out.print("hi"+med1_jv);
	  //_jv=request.getParameter("txtf_");		
	  	   tfecha_jv=t1_jv+t2_jv+t3_jv;
	 rset1= stmt.executeQuery("select * from clave_med where descrip='"+descripmed_jv+"' ");
	  
	  while(rset1.next())
				     {
					 clave2_jv=rset1.getString("clave");
					 cont2++;
					 }
					 if (cont2>0)
					 {
					 
					 rset3= stmt1.executeQuery("select * from h_"+clave_jv+" where clave='"+clave2_jv+"'");
		while(rset3.next())
	  {
	  //cv_finan_jv=rset3.getString("cv_finan");
	  financiamiento[pos]=rset3.getString("descrip_finan");     
                     pos++;
	  cont3++;
	 
	  }
	  //Rutina para obtener la fuente de financiamento
	  for(int k=0;k<6;k++)
	      {
		     for(int z=0;z<pos;z++)
			   {
			     if(financiamiento[z].equals(finan[k]))
				   {
				     encontrado=financiamiento[z];
					 ban=1;
					 break;
				   }
				   if(ban==1)
				      break;
			   }
			   if(ban==1)
			      break;
		  }
	  //
					 
			if (cont3>0)
					 {
					 
					 
		rset= stmt.executeQuery("select * from inventario_uni where clave='"+clave2_jv+"' ");
	  
	  while(rset.next())
	  {
	   //cant_jv=rset.getString("cant");
	   //cant2_jv=Integer.parseInt(cant_jv);
	   //part_jv=rset.getString("origen");
	   origen[posf]=rset.getString("origen");     
                     posf++;
	  }  
		  
				  //Rutina para obtener la fuente de origen
	  for(int l=0;l<2;l++)
	      {
		     for(int m=0;m<posf;m++)
			   {
			     if(origen[m].equals(org[l]))
				   {
				     part_jv=origen[m];
					 ban2=1;
					 break;
				   }
				   if(ban2==1)
				      break;
			   }
			   if(ban2==1)
			      break;
		  }
		  
	  //
	  rset_org= stmt.executeQuery("select * from inventario_uni where clave='"+clave2_jv+"' and origen='"+part_jv+"' ");
	  
	  while(rset_org.next())
	  {
	   cant_jv=rset_org.getString("cajas");
	   cant2_jv=Integer.parseInt(cant_jv);
	   /*part_jv=rset.getString("origen");
	   origen[posf]=rset.getString("origen");     
                     posf++;*/
	  }  
				  
				  
				  
		if(cant2_jv>0)
		{		 
	
	   rset2= stmt.executeQuery("select * from clave_med where descrip='"+descripmed_jv+"' ");
	  
	  while(rset2.next())
	  {
	                 clave1_jv=rset2.getString("clave");
 					 descrip1_jv=rset2.getString("descrip");
					 present1_jv=rset2.getString("present");
					 id_med_jv=rset2.getString("id_med");
					// part_jv=rset2.getString("part");
					 }
					 %>
<script>
					 document.form.txtf_sol1.focus();
					 </script>
					 <%
					 }else{
					 %>
<script>
					 alert("Clave Sin Existencia, La Receta tendrá el Estatus de PENDIENTE POR SURTIR")
					 </script>
					 <%
					  rset2= stmt.executeQuery("select * from clave_med where descrip='"+descripmed_jv+"' ");
	  					  while(rset2.next())
	  					{
							 clave1_jv=rset2.getString("clave");
							 descrip1_jv=rset2.getString("descrip");
							 present1_jv=rset2.getString("present");
							 id_med_jv=rset2.getString("id_med");
							 part_jv="2";
							 cant_jv="0";
						}
 					 /*med1_jv="";
					 clave1_jv="";
					 descrip1_jv="";
					 cant_jv="";
					 part_jv="";*/
					 //financiamiento=pos[];
					 }
					 }else{
					 
					 %>
<script>
					 alert("Clave No Distribuir")
					 </script>
					 <%
					 med1_jv="";
					 clave1_jv="";
					 descrip1_jv="";
					 part_jv="";
					 }
					 
					 }else
					 {
					 %>
<script>
					 alert("Clave Fuera de Catálogo")
					 </script>
<%
					 med1_jv="";
					 clave1_jv="";
					 descrip1_jv="";
					 part_jv="";
					 }	 
}
// fin proceso Ver ----------------------------------------------
// inicio proceso Por Descripción
if(but.equals("Por Descripción"))
{
      desdmed_jv=request.getParameter("txtf_descmed");
      med1_jv=request.getParameter("txtf_med1");
	  cause_jv=request.getParameter("txtf_cause");
	  uni_jv=request.getParameter("txtf_uni");	
	  cedu_jv=request.getParameter("txtf_cedu");	
	  nomed_jv=request.getParameter("txtf_nomed");
	  foliore_jv=request.getParameter("txtf_foliore");
	  ela2_jv=request.getParameter("txtf_ela");
	  servicio_jv=request.getParameter("txtf_servicio");
	  encarser_jv=request.getParameter("txtf_encarser");	 
	  t1_jv=request.getParameter("txtf_t1");
	  t2_jv=request.getParameter("txtf_t2");
	  t3_jv=request.getParameter("txtf_t3");
	  tfecha_jv=t1_jv+t2_jv+t3_jv;
	  rset1= stmt.executeQuery("select * from clave_med where descrip like'%"+desdmed_jv+"%' ");
	  
	  while(rset1.next())
				     {
					 cad1[tam2]=rset1.getString("descrip");
					 tam2++;
					 }
}
// fin proceso Descri ----------------------------------------------
// inicio proceso Clave
if(but.equals("Clave"))
  { // inicio de if but
    ////out.print("Ingreso A CLAVE");
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
	  edad_jv=request.getParameter("txtf_edad");
	  folio_jv=request.getParameter("txtf_foliosp");
	  
	  encarser_jv=request.getParameter("txtf_encarser");
      servicio_jv=request.getParameter("txtf_servicio");
	  
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
			////out.print("sigue el proceso");
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
		rset= stmt.executeQuery("select clave,lote,caducidad,existencias,origen from inventario_uni where clave='"+clave_bus+"' order by clave+0,origen+0,STR_TO_DATE(caducidad, '%d/%m/%Y') asc;");
	  
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

// inicio proceso Capturar
if(but.equals("Capturar"))
  { // inicio de if but
    ////out.print("Ingreso");
	// variables de la receta
		
	  foliore_jv=request.getParameter("txtf_foliore");
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
	  nombre_jv="-";
	  edad_jv="-";
	  folio_jv="-";
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
	  
	  fechanew=request.getParameter("txtf_date1");
	  
	// fin variables --------
	
	cant_sur_vacio=request.getParameter("txtf_sol1");
	sol1_jv=request.getParameter("txtf_sol1");
	encontrado=request.getParameter("txtf_ff");
	//clave_bus=request.getParameter("txtf_clave1");
	clave1_jv=request.getParameter("txtf_clave1");
	descrip1_jv=request.getParameter("txtf_descrip1");
	ela_jv=request.getParameter("txtf_ela");
	servicio_jv=request.getParameter("txtf_servicio");
	encarser_jv=request.getParameter("txtf_encarser");
	
	// varibles que se utilizarán 
	cedu_jv="-";nomed_jv="-";cause_jv="-";carnet_jv="-";sexo_jv="-";indi="-";corte="-";ampuleo="-";
	// --------------------------
	
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
		  alert('CAMPO VACÍO, Ingrese la CANTIDAD SOLICITADA');
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
	 	rset= stmt.executeQuery("select existencias,origen from inventario_uni where clave='"+clave1_jv+"' order by clave+0,origen+0,caducidad;");
	  
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
		 ////out.print("exis:"+valor_exis+"resto"+resto);
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
					  stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','"+exis_total_num+"','"+df.format(new java.util.Date())+"','"+ela2_jv+"','SALIDA DE INSUMO','SALIDA DE INSUMO EN RECETA COLECTIVA',current_timestamp,'"+foliore_jv+"','-','2','-','"+present1_jv+"','"+exis_total_num+"',0)");						 
					 // fin tabla modi 	
		if(resto==0)
		  {sur1_1_jv=cant_x_sutir;
		  //hacer un insert a receta
	
		
		status_surt="SI";
		resto_jv=Integer.parseInt(request.getParameter("txtf_sol1"));
		status="SURTIDO COMPLETO";
		
		
		stmt1.execute("insert into receta_colectiva values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant_x_sutir+"','"+sur1_1_jv+"','"+status_surt+"','"+ela_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto+"','"+status+"','RC','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','"+servicio_jv+"','"+fechanew+"','A','"+encarser_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	

				// fin insert a receta
		  
		  }
		else
		  { 
			
			//hacer un insert a receta
	
		
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		
		
		stmt1.execute("insert into receta_colectiva values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+cant_por_surtir+"','"+cant_por_surtir+"','"+status_surt+"','"+ela_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RC','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','"+servicio_jv+"','"+fechanew+"','A','"+encarser_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	

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
					  stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_restantes+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','"+exist_may+"','"+df.format(new java.util.Date())+"','"+ela2_jv+"','SALIDA DE INSUMO','SALIDA DE INSUMO EN RECETA COLECTIVA',current_timestamp,'"+foliore_jv+"','-','2','-','"+present1_jv+"','"+exis_total_num+"',0)");						 
					 // fin tabla modi 	
				
				   sur1_1_jv=cant_x_sutir;
				   
				   //hacer un insert a receta
		
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
		
		
		stmt1.execute("insert into receta_colectiva values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+exis_restantes+"','"+exis_restantes+"','"+status_surt+"','"+ela_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RC','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','"+servicio_jv+"','"+fechanew+"','A','"+encarser_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	

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
		
		
		// se hace el insert a la tabla receta
		stmt1.execute("insert into receta_colectiva values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+sol1_jv+"','"+sur1_1_jv+"','"+status_surt+"','"+ela_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+part_jv+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RC','-','-','-','-','"+carnet_jv+"','"+servicio_jv+"','"+fechanew+"','A','"+encarser_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
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
					  stmt1.execute("insert into modificacion values ('"+rset.getString("clave")+"','"+rset.getString("descrip")+"','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+exis_may+"','"+rset.getString("origen")+"','"+cant_x_sutir_neg+"','0','"+df.format(new java.util.Date())+"','"+ela2_jv+"','SALIDA DE INSUMO','SALIDA DE INSUMO EN RECETA COLECTIVA',current_timestamp,'"+foliore_jv+"','-','2','-','"+present1_jv+"','0',0)");						 
					 // fin tabla modi 	
		// insert para receta, caso existencias menor a cantidad a surtir
		status_surt="SI";
		resto_jv=0;
		status="SURTIDO COMPLETO";
				
		stmt1.execute("insert into receta_colectiva values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+exis_may+"','"+exis_may+"','"+status_surt+"','"+ela_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+rset.getString("origen")+"','"+present1_jv+"','"+resto_jv+"','"+status+"','RC','-','-','"+rset.getString("lote")+"','"+rset.getString("caducidad")+"','"+carnet_jv+"','"+servicio_jv+"','"+fechanew+"','A','"+encarser_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
		// fin insert
		
		
		  }
		// //out.print("exis:"+valor_exis+"resto"+resto);
		 	
	  }
		pen_sur=cant_x_sutir-sum_exis;
		sur1_1_jv=sum_exis;
		status_surt="NO";
		status="PENDIENTE POR SURTIR";
		part_jv="2";
	// se hace el insert a la tabla receta para el resto y cant_sol
		stmt1.execute("insert into receta_colectiva values ('"+foliore_jv+"','"+fechanew+"','"+reloj_jv+"','"+juris_jv+"','"+no_jur+"','"+nom_unidad+"','"+nombre_jv+"','"+edad_jv+"','"+folio_jv+"','"+programa_jv+"','-','"+cedu_jv+"','"+nomed_jv+"','"+cause_jv+"','"+clave1_jv+"','"+descrip1_jv+"','"+pen_sur+"','0','"+status_surt+"','"+ela_jv+"','"+clave_jv+"','"+id_med_jv+"','"+cv_dgo_jv+"','"+cv_uni_jv+"','"+cv_finan_jv+"','"+financiamiento1+"','"+layout+"','"+part_jv+"','"+present1_jv+"','"+pen_sur+"','"+status+"','RC','-','-','-','-','"+carnet_jv+"','"+servicio_jv+"','"+fechanew+"','A','"+encarser_jv+"','"+indi+"','-','-','-','-','-','"+corte+"','"+ampuleo+"',0)");	
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
  //sur1_1_jv=0;
  }// fin if vacio
  
  
}// fin if(Capturar)

// fin proceso Capturar
// Proceso Imprimir
if(but.equals("Imprimir"))
     {
	  foliore2_jv=request.getParameter("txtf_foliore");;
	  no_jur=request.getParameter("txtf_njuris");
	  nom_unidad=request.getParameter("txtf_unidadmed");
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
	  
	  stmt.execute("insert into folio_rec values(null,'morelia')");
                  stmt.execute("commit");
				  
				  ResultSet rset_01 = stmt_01.executeQuery("select no_rec from folio_rec");
                  while(rset_01.next())
				  {
                       customerIds = rset_01.getInt("no_rec");
                         }
				  
	  
	  %>
	  <script>
	  self.location='ticket2.jsp?folio=<%=foliore2_jv%>&folio2=<%=customerIds%>&receta5=RC&encar=<%=ela2_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&encarser=<%=encarser_jv%>&ban=<%=tipo_rec%>';
	  
	  </script>
	  <%
}
// fin proceso Imprimir	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Receta Colectiva Fecha Autom&aacute;tica :.</title>
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
</script>
<script type="text/javascript">
    function getfocus()
    {
            document.getElementById('w3s').focus();
    }
 
    function losefocus()
    {
            document.getElementById('w3s').blur();
    }
	
	function foco_inicial(){
	if (document.form.txtf_t1.value=="")
			{
			document.form.txtf_t1.focus();
			}	
	else	
	if (document.form.txtf_t3.value!="")
	{
		if (document.form.txtf_descrip1.value==""){
			document.form.txtf_servicio.focus();
			window.scrollTo(100,600);
		}
		else{
			if (document.form.txtf_med1.value==""){
			document.form.txtf_med1.focus();
			window.scrollTo(100,400);
			}
			else{
				document.form.txtf_sol1.focus();
				window.scrollTo(100,400);
			}
			
		}
	}
	else{
		document.form.txtf_t1.focus();
	}
	}
	
    </script>
	
	
<style type="text/css">
<!--
.style2 {
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
}
.style4 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}
.style7 {
	font-size: 16px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style11 {font-size: 12px}
.style12 {
	color: #CCCCCC;
	font-weight: bold;
}
.Estilo5 {color: #990000; font-weight: bold; }
.Estilo6 {
	color: #000000;
	font-size: 16;
	font-weight: bold;
}
.Estilo7 {color: #003399}
.style2 .style11 h4 strong {
	color: #A00;
}
-->
</style>
</head>

<body onLoad="foco_inicial();mueveReloj();">
<form name="form" method="post" action="rc.jsp?uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&encar=<%=ela2_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&servicio=<%=servicio_jv%>&part=<%=part_jv%>&encarser=<%=encarser_jv%>&ban=<%=tipo_rec%>">
<table width="957" height="562" border="3" align="center" cellpadding="2">
  <tr>
    <td width="725" height="156"><table width="860" border="0" align="center" cellpadding="2">
      <tr>
        <td width="114"><img src="imagenes/nay_ima1.jpg" width="203" height="78" /></td>
        <td width="339"><div align="center"><span class="style7">SERVICIO DE SALUD DE NAYARIT<br />
        RECETA COLECTIVA</span>*</div></td>
        <td width="225"><div align="center"><img src="imagenes/ssn.jpg" width="219" height="89" /></div></td>
      </tr>
    </table>
      <a href="index.jsp">Regresar a Menu</a>
      <table width="763" height="61" border="0" align="center" cellpadding="2">
        <tr>
          <td width="284" height="55"><label></label>
            <table width="270" height="0%" border="0" cellpadding="2">
              <tr>
                <td width="221" height="100%" class="style2">FECHA:
                <% 
			 if (tipo_rec==1)
               {
			 %>
                <input name="txtf_date" type="text" class="style13" onKeyPress="return handleEnter(this, event)" value="<%=day1%>/<%=res%>/<%= year %>" size="1" readonly style="visibility:hidden"/>
                  &nbsp;
				  <%
						java.util.Calendar fecha = java.util.Calendar.getInstance();
						String dia_f=String.valueOf(fecha.get(java.util.Calendar.DATE));
						//int mes_=Integer.parseInt((fecha.get(java.util.Calendar.MONTH)+1));
						
						String mes_f=String.valueOf(fecha.get(java.util.Calendar.MONTH)+1);
						int mes=Integer.parseInt(mes_f);
						if (mes>=1 && mes<=9){
							mes_f="0"+mes;
						}
						String anio_f=String.valueOf(fecha.get(java.util.Calendar.YEAR));
						
					%>
                  <input name="txtf_t1" type="text" onKeyPress="return handleEnter(this, event)" onKeyUp="putDays()" value="<%=dia_f%>" size="1" maxlength="2" readonly/>
			        <strong>                    /</strong>
                    <input name="txtf_t2" type="text" size="1" maxlength="2" onKeyUp="putMonthss()" value="<%=mes_f%>" onKeyPress="return handleEnter(this, event)" readonly/>
                    <strong>                    /</strong>
                    <input name="txtf_t3" type="text" size="2" maxlength="4" onKeyUp="putYearss2(this.form)" value="<%=anio_f%>" onKeyPress="return handleEnter(this, event)" readonly/>
             <%
			   }else{
			 %> 
             <input name="txtf_date" type="text" class="style13" onKeyPress="return handleEnter(this, event)" value="<%=day1%>/<%=res%>/<%= year %>" size="1" readonly style="visibility:hidden"/>
                  &nbsp;
                  <input name="txtf_t1" type="text" onKeyPress="return handleEnter(this, event)" onKeyUp="putDays()" value="<%=t1_jv%>" size="1" maxlength="2"/>
			        <strong>                    /</strong>
                    <input name="txtf_t2" type="text" size="1" maxlength="2" onKeyUp="putMonthss22()" value="<%=t2_jv%>" onKeyPress="return handleEnter(this, event)" />
                    <strong>                    /</strong>
                    <input name="txtf_t3" type="text" size="2" maxlength="4"  value="2013<%//=t3_jv%>" onKeyPress="return handleEnter(this, event)" readonly /><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Estilo5">&nbsp;<span class="Estilo9">DD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AAAA</span></span>
             
             <%
			   }
			 %> 
             </td>       
              </tr>
            </table>
          <label>          </label></td>
          <td width="250"><table width="167" height="0%" border="0" cellpadding="2">
            <tr>
              <td width="225" height="100%" class="style2">HORA:
                <input name="reloj" type="text"  class="Estilo5" onKeyPress="return handleEnter(this, event)" size="15" readonly ></td>
            </tr>
          </table>          
            <label></label></td>
          <td width="172" align="center" class="style2"> No. Folio
            <table width="152" height="0%" border="0" align="right" cellpadding="2">
            <tr>
              <td width="144" height="100%"><label>
			  <%/* int val_met=0;
		   String recibe_value="";
		   
		    if(flag==0)
			  {
		   	  val_met=regulaCont2(f_gnk=request.getParameter("txtf_fol2"),request.getParameter("txtf_foliore"));
		      ////out.print("ingreso a flag");
			  }
		  else	  
			  val_met=Integer.parseInt(folgnk_vi_jv);*/
		%>
                <input type="text" name="txtf_foliore" size="10" class="Estilo5"  value="<%=foliore_jv%>" readonly/>
              </label></td>
            </tr>
          </table></td>
        </tr>
    </table>    </td>
  </tr>
        <tr>
          <td height="71" colspan="3" class="style4"><table width="784" border="0" align="center" cellpadding="2">
            <tr>
              <td height="2" colspan="3" class="style4"><div id="item7" style="display:none" align="justify" ><span class="style2">
            <input name="txtf_date1" type="text" size="20" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onKeyPress="return handleEnter(this, event)" readonly/>
          </span></div></td>
            </tr>
            <tr>
              <td width="533" class="style2">UNIDAD DE SALUD&nbsp;</td>
              <td width="170"><table width="170" border="0" align="left" cellpadding="2">
                <tr>
                  <td width="162" align="center"><div align="center" class="style2">JURISDICCION&nbsp;&nbsp;<input name="txtf_njuris"  class="Estilo5" readonly type="text" size="1" value="<%=no_jur%>"/>
                  </div></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="2"><textarea name="txtf_unidadmed" cols="40" class="Estilo5" colspan="3" readonly><%=nom_unidad%></textarea>
                <span class="style2">ELABOR&Oacute; COLECTIVO: </span> <label>
                <textarea name="txtf_ela" cols="35"  class="Estilo5" readonly><%=ela2_jv%></textarea>
              </label></td>
            </tr>
          </table>
		  
		  </td>
        </tr>
        <tr>
		<td height="241">
		<table width="939" border="0" align="center" cellpadding="2">
            
            <tr>
              <td width="136" class="style2">Tipos de Servicios:&nbsp;&nbsp; </td>
              <td width="365" class="style11"><span class="style2">
                <select name="select_servi"  class="style2" onChange="Servi_col(this.form)" onkeypress="return document.form.txtf_med1.focus();">
                  <option selected="selected">-----Seleccione Tipo de Servicio-----</option>
                  <option value="ADMINISTRACION">ADMINISTRACION</option>
                  <option value="ANESTESIOLOGIA">ANESTESIOLOGIA</option>
                  <option value="ANTIALACRAN">ANTIALACRAN</option>
                  <option value="BANCO DE SANGRE">BANCO DE SANGRE</option>
                  <option value="BRAQUITERAPIA">BRAQUITERAPIA</option>
                  <option value="CENDIS">CENDIS</option>
                  <option value="CENTRAL DE MEZCLAS">CENTRAL DE MEZCLAS</option>
                  <option value="CEYE">CEYE</option>
                  <option value="CIRUGIA">CIRUGIA</option>
                  <option value="CITOLOGIA">CITOLOGIA</option>
                  <option value="CLINICA DE CATETER ADULTO">CLINICA DE CATETER ADULTO</option>
                  <option value="CLINICA DE CATETER PEDIATRICO">CLINICA DE CATETER PEDIATRICO</option>
                  <option value="CLINICA DE DISPLASIAS">CLINICA DE DISPLASIAS</option>
                  <option value="CLINICA DE MAMA">CLINICA DE MAMA</option>
                  <option value="COCINA">COCINA</option>
                  <option value="CONSULTA">CONSULTA</option>
                  <option value="CONSULTA EXTERNA">CONSULTA EXTERNA</option>
                  <option value="CONSULTORIO 1">CONSULTORIO 1</option>
                  <option value="CONSULTORIO 2">CONSULTORIO 2</option>
                  <option value="CONSULTORIO 3">CONSULTORIO 3</option>
                  <option value="CURACIONES">CURACIONES</option>
                  <option value="DENTAL">DENTAL</option>
                  <option value="DIETETICA">DIETETICA</option>
                  <option value="DIRECCION">DIRECCION</option>
                  <option value="DONACION">DONACION</option>
                  <option value="ELECTROENCEFALOGRAFIA">ELECTROENCEFALOGRAFIA</option>
                  <option value="EMODINAMIA">EMODINAMIA</option>
                  <option value="ENDOSCOPIA">ENDOSCOPIA</option>
                  <option value="ENFERMERIA">ENFERMERIA</option>
                  <option value="GINECOLOGIA">GINECOLOGIA</option>
                  <option value="HEMODIALISIS">HEMODIALISIS</option>
                  <option value="HEMODINAMIA">HEMODINAMIA</option>
                  <option value="HINALOTERAPIA">HINALOTERAPIA</option>
                  <option value="HOMBRES">HOMBRES</option>
                  <option value="HOSPITALIZACION">HOSPITALIZACION</option>
                  <option value="INGENIERIA BIOMEDICA">INGENIERIA BIOMEDICA</option>
                  <option value="INHALOTERAPIA">INHALOTERAPIA</option>
                  <option value="INMUNOHISTOQUIMICA">INMUNOHISTOQUIMICA</option>
                  <option value="JEFATURA DE ENFERMERIA">JEFATURA DE ENFERMERIA</option>
                  <option value="LABORATORIO">LABORATORIO</option>
                  <option value="LABORATORIO DE ANALISIS CLINICOS">LABORATORIO DE ANALISIS CLINICOS</option>
                  <option value="LABORATORIO DE MICROBIOLOGIA">LABORATORIO DE MICROBIOLOGIA</option>
                  <option value="LABORATORIO Y EXPULSION">LABORATORIO Y EXPULSION</option>
                  <option value="LAPAROSCOPIA">LAPAROSCOPIA</option>
                  <option value="LAVANDERIA">LAVANDERIA</option>
                  <option value="MASTOGRAFIA">MASTOGRAFIA</option>
                  <option value="MEDICINA INTERNA">MEDICINA INTERNA</option>
                  <option value="MEDICINA PREVENTIVA">MEDICINA PREVENTIVA</option>
                  <option value="MEZCLAS">MEZCLAS</option>
                  <option value="MODULO OPORTUNIDADES">MODULO OPORTUNIDADES</option>
                  <option value="MUJER">MUJER</option>
                  <option value="NEONATOS">NEONATOS</option>
                  <option value="OFTALMOLOGIA">OFTALMOLOGIA</option>
                  <option value="ORTOPEDIA">ORTOPEDIA</option>
                  <option value="PATOLOGIA">PATOLOGIA</option>
                  <option value="PEDIATRIA">PEDIATRIA</option>
                  <option value="PEDIATRIA ESCOLAR">PEDIATRIA ESCOLAR</option>
                  <option value="PLANIFICACION FAMILIAR">PLANIFICACION FAMILIAR</option>
                  <option value="PROCEDIMIENTOS">PROCEDIMIENTOS</option>
                  <option value="QUIMIOTERAPIA">QUIMIOTERAPIA</option>
                  <option value="QUIRIFANO DE OFTALMO">QUIRIFANO DE OFTALMO</option>
                  <option value="QUIROFANO">QUIROFANO</option>
                  <option value="QUIROFANO DE OFTALMOLOGIA">QUIROFANO DE OFTALMOLOGIA</option>
                  <option value="QUIROFANO Y ANESTESIA">QUIROFANO Y ANESTESIA</option>
                  <option value="RADIOLOGIA">RADIOLOGIA</option>
                  <option value="RADIOTERAPIA">RADIOTERAPIA</option>
                  <option value="RAYOS X">RAYOS X</option>
                  <option value="RC">RC</option>
                  <option value="REHABILITACION">REHABILITACION</option>
                  <option value="RESONANCIA MAGNETICA">RESONANCIA MAGNETICA</option>
                  <option value="RX SOTANO">RX SOTANO</option>
                  <option value="SALUD REPRODUCTIVA">SALUD REPRODUCTIVA</option>
                  <option value="SEGURO POPULAR">SEGURO POPULAR</option>
                  <option value="SUBDIRECCION ADMINISTRATIVA">SUBDIRECCION ADMINISTRATIVA</option>
                  <option value="SUBDIRECCION MEDICA">SUBDIRECCION MEDICA</option>
                  <option value="SUPERVISION DE ENFERMERIA">SUPERVISION DE ENFERMERIA</option>
                  <option value="TERAPIA INTENSIVA">TERAPIA INTENSIVA</option>
                  <option value="TOCOCIRUGIA">TOCOCIRUGIA</option>
                  <option value="TOMOGRAFIA">TOMOGRAFIA</option>
                  <option value="TRANSFUSION SANGUINEA">TRANSFUSION SANGUINEA</option>
                  <option value="TRANSPLANTES">TRANSPLANTES</option>
                  <option value="TRIAGE">TRIAGE</option>
                  <option value="UCI">UCI</option>
                  <option value="ULTRASONIDO">ULTRASONIDO</option>
                  <option value="UNIDAD CORONARIA">UNIDAD CORONARIA</option>
                  <option value="URGENCIAS">URGENCIAS</option>
                  <option value="URGENCIAS PEDIATRICAS">URGENCIAS PEDIATRICAS</option>
                  <option value="UTIA">UTIA</option>
                  <option value="UTIP">UTIP</option>
                  <option value="VACUNACION">VACUNACION</option>
                  <option value="YESOS Y CURACIONES">YESOS Y CURACIONES</option>
                </select>
              </span></td>
              <td width="176" class="style11">&nbsp;</td>
              <td class="style11"><input type="text" name="txtf_resul" size="20" value="<%=formateador.format(ttcant_surpas_amp2)%>" style="visibility:hidden"/></td>
            </tr>
            <tr>
              <td class="style2">Servicio:</td>
              <td class="style11"><span class="style2">
                <input type="text" name="txtf_servicio" class="style2" size="30" value="<%=servicio_jv%>" readonly />
              </span></td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td class="style2">Encargado del Servicio: </td>
              <td class="style11"><span class="style2">
                <input type="text" name="txtf_encarser" class="style2" size="60" value="<%=encarser_jv%>" onChange="mayeE(this.form)" />
              </span></td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td class="style2">Ingrese Clave:</td>
              <td colspan="2" class="style11"><span class="style2">
                <input type="text" name="txtf_med1" size="20" value="<%=med1_jv%>" onChange="<%=but="Med1"%>"/>
              </span><span class="style2">
              <input name="Submit" type="submit" class="but" value="Clave" onClick="getfocus()"/>
              </span><a href="index_carga_clave.jsp" target="_blank">Agregar Clave al Inventario</a>| <a href="existencias.jsp" target="_blank">Ver Existencias</a></td>
              <td width="236" class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td class="style11">Ingrese descripci&oacute;n:                </td>
              <td class="style11"><input type="text" name="txtf_descmed" size="20" value="<%=desdmed_jv%>" onKeyPress="return handleEnter(this, event)" />
              <input name="Submit" type="submit" class="but" value="Por Descripción" onClick="getfocus()"/></td>
              <td colspan="2" class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td class="style11">Seleccione Descripci&oacute;n:                &nbsp;&nbsp;&nbsp;</td>
              <td class="style11"><select name="select_servi2" size="1"  class="style2"  onkeypress="return document.form.txtf_med1.focus();">
                <option selected="selected">-----Seleccione Descripción-----</option>
                <%
		     
             for(x1=0;x1<tam2;x1++)
                {
                   
           %>
                <option value="<%=cad1[x1]%>"><%=cad1[x1]%></option>
                <%
                }
           %>
              </select>
              <input name="Submit" type="submit" class="but" value="Ver" onClick="getfocus()"/></td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4"><hr /></td>
            </tr>
            <tr>
              <td colspan="4">
              <table width="875" border="0" align="center" cellpadding="2">
            
           <tr class="style2">
    <td colspan="4" class="style11" align="center"><h4><strong>CAPTURAR CANTIDAD SOLICITADA</strong></h4></td>
               <td colspan="5" class="style11"><span class="style2"><span class="Estilo8">TOTAL EXISTENCIAS:</span><span class="Estilo5"> <%=suma_exis%>*<br />Origen 1=<%=origen_1%>&nbsp;Origen 2=<%=origen_2%></span></span></td>
              <td colspan="2" class="style11"><label>
                <div align="center">
                  <input type="text" name="txtf_idmed" size="1" value="<%=id_med_jv%>" style="visibility:hidden" />
                 <span class="style2">FUENTE                </span>
                  <input type="text" name="txtf_present" size="1" value="<%=present1_jv%>" style="visibility:hidden"/>
                  
                  <input type="text" name="txtf_finan" size="1" value = "<%=cv_financ1%>" style="visibility:hidden"/>
                  
                  <input type="text" class="style2" name="txtf_ff" value="<%=encontrado%>" readonly />
                </div>
                
              </label></td>
      </tr>
      <tr>
        <td width="70" class="style11"><span class="letras"><span class="style2">CLAVE</span></span></td>
              <td colspan="2" class="style11"><span class="letras"><span class="style2">DESCRIPCI&Oacute;N</span></span></td>
              <td width="68" class="style11"><span class="letras"><span class="style2">CANT SOL</span></span></td>
              <td colspan="2" class="style11"><span class="letras"><span class="style2">CANT SUR</span></span></td>
              <td colspan="3" class="style11">&nbsp;</td>
              <td colspan="2" class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td class="style11"><input type="text" name="txtf_clave1" size="10" class="style2" value="<%=clave1_jv%>"  readonly="true"/></td>
              <td colspan="2" class="style11"><textarea name="txtf_descrip1" cols="50"  class="style2" readonly><%=descrip1_jv%></textarea></td>
              <td class="style11"><input type="text" name="txtf_sol1" id="txtf_sol1" size="5" value="<%=sol1_jv%>" onKeyPress="return validar(event)"  /></td>
              <td colspan="2" class="style11"><input type="text" name="txtf_sur1" size="5" value="<%=sur1_1_jv%>"  onchange="setSur(this.form)" onKeyPress="return validar(event)" readonly/></td>
              <td colspan="3" class="style11"><div align="center">&nbsp;</div></td>
              <td colspan="2" class="style11">&nbsp;
              <% 
			 if (tipo_rec==1)
               {
			 %>
              <input name="Submit" type="submit" id="capturaid" class="but" value="Capturar" onClick="return verifica_RC(document.forms.form);" onChange="setSur(this.form)"/>
              <%
			   }else{
			 %>
              <input name="Submit" type="submit" id="capturaid" class="but" value="Capturar" onClick="return verifica_RC22(document.forms.form);" onChange="setSur(this.form)"/>
             <%
			   }
			 %>		</td>
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
			rset=stmt.executeQuery("select clave,descrip,lote,caducidad,cant_sol,cant_sur,surtido,id,partida from receta_colectiva where folio_re='"+foliore_jv+"'");
 
   while(rset.next()) 
        { 
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
              <input  type="button" id="btn_<%=eliminar_jv%>" name="btn_<%=eliminar_jv%>" class="subHeader" value="Eliminar" onclick='location.href="eliminar_col.jsp?id_prov=<%=eliminar_jv%>&foliore=<%=foliore_jv%>&encar=<%=ela2_jv%>&juris=<%=no_jur%>&uni=<%=nom_unidad%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>&clave1=<%=clave1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&lote=<%=lotes_jv%>&cadu=<%=cadus_jv%>&part=<%=part_jv%>&ban=<%=tipo_rec%>"'/>&nbsp;              </td>
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
              <td class="style11">
              <% 
			 if (tipo_rec==1)
               {
			 %>
              <input name="Submit" type="submit" class="subHeader" value="Imprimir" onClick="return verifica_RCI(document.forms.form);"/>
              <%
			   }else{
			 %>
              <input name="Submit" type="submit" class="subHeader" value="Imprimir" onClick="return verifica_RCI2(document.forms.form);"/>
              <%
			   }
			 %>              </td>
            </tr>
        </table>
              </td>
            </tr>
          </table>
		</td>
		</tr>
        
       
	   <tr>
         <td height="40" colspan="3" class="style4"><div align="right" class="style12">
           <div align="center"><img src="imagenes/ima_main.jpg" width="517" height="77" /></div>
         </div></td>
  </tr>
</table>
</form>
</td></tr></td></td></td></td></td>
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
			 ////out.print(mensaje);
		// ---- fin de la conexión	 	  

%>

</body>
</html>
