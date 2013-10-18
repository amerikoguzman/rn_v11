<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.DecimalFormat" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<% 
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: receta_col_surtir.jsp
Función      : Muestra aquellos folios pendientes por surtir y surte la receta colectiva en caso de que haya 
               y halle existencias
 ---------------------------------------------------------------------------------------------------- */
// Conexión a la BDD
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
	ResultSet rset = null;
	ResultSet rset_001 = null;
	ResultSet rset_org = null;
	ResultSet rset1 = null;
	ResultSet rset2 = null;
	ResultSet rset3 = null; 
	ResultSet rset_elimDS=null;
	ResultSet rset_org_o1 = null;
	ResultSet rset_org_o2 = null;
	ResultSet rset_total = null;
	Statement stmt_o1 = conn.createStatement();
	Statement stmt_o2 = conn.createStatement();
	Statement stmt1og2 = conn.createStatement();
	Statement stmt_og22 = conn.createStatement();
	Statement stmt1og1 = conn.createStatement();
	Statement stmt_total = conn.createStatement();
// fin conexión -------------------------------------------
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
 if(month >=1 && month <= 9)  
 {
 res ="0"+month;
// month=Integer.parseInt(res);
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
// fin fecha y hora -------------------------------------------------
// Variables de entorno
String financiamiento[]= new String[5000];
String origen[]= new String[5000];
String finan[] = {"SEGURO POPULAR","OPORTUNIDADES","FASSA","ASE","SMNG","Gasto Catastróficos"};
String org[]= {"1","2"};
String folios[]= new String[5000];
financiamiento[0]="";
origen[0]="";
int pos=0,cont3=0,ban=0,posf=0,ban2=0,cant2_jv=0,cv_med2=0,cv_med3=0,cont1=0,cont5=0,cont6=0,sur2=0,sol2=0,mtotal=0,total2=0,total=0,flag=0,customerIds=0,cant_pasti_ampu=0,cant_surpas_amp=0,ttcant_surpas_amp=0,ttcant_surpas_amp2=0,x1=0,no_existe=0,c_s=0;
String encontrado="",cant_jv="",financiamiento1="",cv_finan_jv="",layout="",status="",cant_pasti="",cant_surpas="",count_cv="",servicio_jv="",fechanew="",mensaje="",afiliado_jv="",carnet_jv="",fuente="",encar_jv="";
String f_gnk=request.getParameter("txtf_fol2");
String partida_o1_jv="",partida_o2_jv="",sumatotal="",cant_o1_jv="",cant_o2_jv="";
int cant2_o1_jv=0,cant2_o2_jv=0,mtotalot=0,mtotalotsur=0,resto22_jv=0,mtotalotsur2=0;
String hora_ini_jv="";
String lugar_jv="";
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",servi_jv="",foliore4_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",eliminar_jv="";
String but="r";
String nom_unidad="",no_jur="",juris_jv="";
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="",t1_jv="",t2_jv="",t3_jv="",tfecha_jv="";
String ela_jv="", ela2_jv="",encarser_jv="";
int cont2=0,resto_jv=0,cont=0;
String fol2_jv="";
String fol2_vi_jv="";
String cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",part_jv="",id_med_jv="";
// fin variables de entorno
// Serie de try
 	  try {
       		fol2_vi_jv = request.getParameter("fol_vi");       			   
	  } catch (Exception e) { }
String folgnk_vi_jv="";
 	  try {
       		folgnk_vi_jv = request.getParameter("fol_gnk_vi");       			   
	  } catch (Exception e) { }
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
	}catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
try { 
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
// fin try --------------------------------------------
//proceso para obtener los folios con el estatus PS
	rset2= stmt1.executeQuery("select folio_re,nombre_pac from receta_colectiva where status_receta='PENDIENTE POR SURTIR';");
	 while(rset2.next())
	  {
	    //nom_pac=rset2.getString("nombre_pac");	  
	  	folios[pos]=rset2.getString("folio_re");
		pos++;
	  }
	
// fin proceso ------------------------------------

// Proceso Por Folio
if(but.equals("Por Folio"))
     {
	 foliore_jv=request.getParameter("txtf_foliore");
	
	  rset1= stmt.executeQuery("select * from receta_colectiva where folio_re='"+foliore_jv+"' and status_receta='PENDIENTE POR SURTIR' ");
	  while(rset1.next())
	  {
	  	cont1++;
	  }
	   if(cont1>0)
	 {
	 rset1= stmt.executeQuery("select * from receta_colectiva where folio_re='"+foliore_jv+"' ");
	  while(rset1.next())
				     {
					  t3_jv=rset1.getString("fecha_re");
					  Statement stmt_date = conn.createStatement();
				      ResultSet rset_date = stmt_date.executeQuery("SELECT DATE_FORMAT('"+t3_jv+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
                    while(rset_date.next())
					{
                    	t3_jv= rset_date.getString("DATE_FORMAT('"+t3_jv+"', '%d/%m/%Y')");//STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
					 }
					 servicio_jv=rset1.getString("servicio");
					 folio_jv=rset1.getString("folio_sp");
					 cause_jv=rset1.getString("causes");
					 encarser_jv=rset1.getString("aux7");					 }
					 
					 }else{
      rset1= stmt.executeQuery("select * from receta_colectiva where folio_re='"+foliore_jv+"' ");
	  while(rset1.next())
				     {	
					   no_existe=1;
					 }
			if(no_existe==0)		 
		      {
		%>
<script>
		
		alert("FOLIO INEXISTENTE");
		
		</script>
		<%
	    }else
		{
			%>
<script>
		
		alert("RECETA YA SURTIDA, ESTATUS: SURTIDO COMPLETO");
		
		</script>
<%
		}
	 
	 }
}
// fin Por Folio -------------------------------
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
	  %>
	  <script>
	  self.location='ticket2_sur_col.jsp?folio=<%=foliore2_jv%>&folio2=<%=customerIds%>&receta5=RC&encar=<%=ela2_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&encarser=<%=encarser_jv%>';
	  </script>
	  <%
}	
// fin Imprimir
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Pendiente por Surtir Receta Colectiva :.</title>
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
	if (document.form.txtf_t3.value!="")
	{
		if (document.form.txtf_descrip1.value==""){
			document.form.txtf_med1.focus();
		}
		else{
			document.form.txtf_sol1.focus();
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
.Estilo7 {
	font-size: 16;
	font-weight: bold;
}
doce {
	font-size: 12px;
}
dd {
	font-size: 12px;
}
-->
</style>
</head>

<body onLoad="mueveReloj();SetCur();">
<script src="scw.js" type="text/javascript"> </script>
<form name="form" method="post" action="receta_col_surtir.jsp?uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&encar=<%=ela2_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&servicio=<%=servicio_jv%>&part=<%=part_jv%>&foliore=<%=foliore_jv%>&encarser=<%=encarser_jv%>">
<table width="957" height="562" border="3" align="center" cellpadding="2">
  <tr>
    <td width="725" height="156"><table width="895" border="0" align="center" cellpadding="2">
      <tr>
        <td width="231"><img src="imagenes/nay_ima1.jpg" width="203" height="78" /></td>
        <td width="420"><div align="center"><span class="style7">SERVICIO DE SALUD DE NAYARIT<br />
        RECETA COLECTIVA PENDIENTE POR SURTIR</span></div></td>
        <td width="224"><img src="imagenes/ssn.jpg" width="219" height="89" /></td>
      </tr>
    </table>
      <a href="index.jsp">Regresar a Menu</a>
      <table width="912" height="61" border="0" align="center" cellpadding="2">
        <tr>
          <td width="91" height="55"><label></label>
            
            <span class="style2">INGRESE FOLIO:</span>
          <td width="346" class="style2"><input type="text" name="txtf_foliore" size="15" class="Estilo5"  value="<%=foliore_jv%>" /><select name="slct_fol" id="slct_fol" onChange="putFolio();">
            <option>-- Folios --</option>
          <%
           for(x1=0;x1<pos;x1++)
              {
         %>
                <option value="<%=folios[x1]%>"><%=folios[x1]%></option>
         <%
			  }
		 %>
          </select><input name="Submit" type="submit" class="subHeader" value="Por Folio"/> <input name="act" type="submit" value="ACT" />            
          <label>          </label></td>
          <td width="173"><span class="style2">HORA:</span>            <input name="reloj" type="text"  class="Estilo5" onKeyPress="return handleEnter(this, event)" size="15" readonly ></td>
          <td width="276" align="left" class="style2">FECHA
           
                <input type='text' name='txtf_t3' id='txtf_t3' title='DD/MM/AAAA' value="<%= day1 %>/<%=res%>/<%= year %>" size='10' maxlength='10'  readonly class="Estilo5"/>
       </td>
        </tr>
    </table>    </td>
  </tr>
        <tr>
          <td height="71" colspan="3" class="style4"><table width="895" border="0" align="center" cellpadding="2">
            <tr>
              <td height="2" class="style4"><div id="item7" style="display:none" align="justify" ><span class="style2">
            <input name="txtf_date1" type="text" size="20" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onKeyPress="return handleEnter(this, event)" readonly/>
          </span></div>
              <span class="style2"><strong>UNIDAD DE SALUD:</strong></span></td>
              <td height="2" class="style4"><span class="style2"><strong>ELABOR&Oacute; COLECTIVO:</strong></span></td>
              <td height="2" class="style4"><span class="style2"><strong>JURISDICCION:
                  
              </strong></span></td>
              <td width="1" height="2" class="style4">&nbsp;</td>
              <td width="42">&nbsp;</td>
            </tr>
            <tr>
              <td width="310" class="style2">
              <textarea name="txtf_unidadmed" cols="40" class="Estilo5" colspan="3" readonly><%=nom_unidad%></textarea></td>
              <td width="230"><span class="style2">
                <textarea name="txtf_ela" cols="25"  class="Estilo5" readonly><%=ela2_jv%></textarea>
              </span></td>
              <td width="280"><span class="style2">
                <input name="txtf_njuris"  class="Estilo5" readonly type="text" size="1" value="<%=no_jur%>"/>
              </span></td>
            </tr>
            <tr>
              <td colspan="3"><a href="index_carga_clave.jsp" target="_blank" class="style11"><strong>Agregar Clave al Inventario</strong></a>| <a href="existencias.jsp" target="_blank" class="style11">Ver Existencias</a></td>
            </tr>
          </table>
		  
		  </td>
        </tr>
        <tr>
		<td height="241">
		<table width="939" border="0" align="center" cellpadding="2">
            
            <tr>
              <td colspan="2" class="style2">&nbsp;Servicio: 
              <input type="text" name="txtf_servicio" class="style2" size="30" value="<%=servicio_jv%>" />&nbsp;&nbsp;Encargado del Servicio:
              <input type="text" name="txtf_encarser" class="style2" size="35" value="<%=encarser_jv%>" readonly/></td>
              <td colspan="3" class="style2"><span class="style11">
                <input type="text" name="txtf_resul" size="1" value="<%=formateador.format(ttcant_surpas_amp2)%>" style="visibility:hidden"/>
              </span></td>
              <td width="75" class="style11">&nbsp;</td>
            </tr>
            
            
            <tr>
              <td colspan="7" class="style11"><hr /></td>
            </tr>
			
            <tr bordercolor="#000000">
              <td width="180" align="center" bordercolor="#333333" class="style11"><span class="style2">CLAVE</span></td>
              <td width="349" align="center" bordercolor="#333333" class="style11"><span class="style2">DESCRIPCI&Oacute;N</span></td>
              <td width="28" align="center" bordercolor="#333333" class="style11"><span class="style2">LOTE</span></td>
              <td width="90" align="center" bordercolor="#333333" class="style11"><span class="style2">CADUCIDAD</span></td>
              <td width="70" align="center" bordercolor="#333333" class="style11"><span class="style2">CANT. SOL</span></td>
              <td align="center" bordercolor="#333333" class="style11"><span class="style2">CANT. SUR </span></td>
              <td width="40" align="center" bordercolor="#333333" class="style11"><span class="style2">ORIGEN</span></td>
              <td width="57" class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="7" class="style11"><hr /></td>
            </tr>
			 <%
  Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
  Statement stmt__001 = conn__001.createStatement();
  ResultSet rset__001=stmt__001.executeQuery("select * from receta_colectiva where folio_re='"+foliore_jv+"'");
 
   while(rset__001.next()) 
                  { 
  %>
            <tr>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("clave")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("descrip")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("lote")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("caducidad")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("cant_sol")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("cant_sur")%></span></td>
              <td class="style11" align="center"><span class="style2"><%=rset__001.getString("partida")%></span></td>
			  <% 
	  eliminar_jv=rset__001.getString("id");
	  c_s=Integer.parseInt(rset__001.getString("cant_sur"));
	  clave1_jv=rset__001.getString("clave");
	  sol1_jv=rset__001.getString("cant_sol");
	  fechanew=rset__001.getString("fecha_re");
	  indica3_jv=rset__001.getString("aux8");
	  afiliado_jv=rset__001.getString("afiliado");
	  descrip1_jv=rset__001.getString("descrip");
	  id_med_jv=rset__001.getString("id_med");
	  fuente=rset__001.getString("fuente");
	  present1_jv=rset__001.getString("present");
	  indica2_jv=rset__001.getString("aux7");
	  hora_ini_jv=request.getParameter("reloj");
	  servicio_jv=rset__001.getString("servicio");
	  ela2_jv=rset__001.getString("encargado");
	  encarser_jv=rset__001.getString("aux7");
	  
	 
	  	if(c_s==0)
			{
	  %>
              <td class="style11"><input  type="button" id="btn_<%=eliminar_jv%>" name="btn_<%=eliminar_jv%>" class="subHeader" value="Surtir" onclick='location.href="surtir_col.jsp?id_prov=<%=eliminar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&encar=<%=ela2_jv%>&clave2=<%=hora_ini_jv%>&descrip2=<%=fuente%>&present2=<%=present2_jv%>&indica2=<%=indica2_jv%>&sol2=<%=afiliado_jv%>&sur2=<%=servicio_jv%>&clave3=<%=clave3_jv%>&descrip3=<%=descrip3_jv%>&present3=<%=present3_jv%>&indica3=<%=indica3_jv%>&sol3=<%=sol3_jv%>&sur3=<%=sur3_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>&day5=<%=t1_jv%>&carnet=<%=carnet_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&fecha=<%=fechanew%>&afi=<%=afiliado_jv%>&fuente=<%=fuente%>&servicio=<%=servicio_jv%>&encarser=<%=encarser_jv%>"'/>&nbsp;</td>
      <%
		}// fin if c_s
	  %>     
        </tr>
            <tr>
              <td colspan="7" class="style11"><hr /></td>
            </tr>
			<%
			}
			%>
      
       <tr>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label></label></td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11"><input name="Submit" type="submit" class="subHeader" value="Imprimir" onClick="return verifica_PSI2(document.forms.form);" /></td>
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
			 //out.print(mensaje);
		// ---- fin de la conexión	 	  

%>

</body>
</html>
