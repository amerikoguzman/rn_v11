<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<% 
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: ver_receta.jsp
Función      : Reimprsione de ticket farmacia
 ---------------------------------------------------------------------------------------------------- */
//Conexión a la BDD vía JDBC
	Class.forName("org.gjt.mm.mysql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
    Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	Statement stmt1 = conn.createStatement();
	Statement stmt_001 = conn.createStatement();
	ResultSet rset = null;
	ResultSet rset_org = null;
	ResultSet rset_001 = null;
	ResultSet rset1 = null;
	ResultSet rsetp = null;
	ResultSet rset2 = null;
	ResultSet rset3 = null; 
	ResultSet rset_org_o1 = null;
	ResultSet rset_org_o2 = null;
	ResultSet rset_total = null;
	Statement stmt_o1 = conn.createStatement();
	Statement stmt_o2 = conn.createStatement();
	Statement stmt1og2 = conn.createStatement();
	Statement stmt_og22 = conn.createStatement();
	Statement stmt1og1 = conn.createStatement();
	Statement stmt_total = conn.createStatement();
// fin conexión a la BDD	
// Variables de entorno 				  
String hora_ini_jv="";
String lugar_jv="";
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",foliore2_jv="",foliore3_jv="",foliore4_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",encar_jv="",juris_jv="",clave_jv="",eliminar_jv="",usu_jv="",equipo_jv="",integrantes_jv="",recibe_id_jv="",cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",id_med_jv="",part_jv="",layout="",cv_finan_jv="",financiamiento1="",precio_jv="",monto_jv="",exi_jv="",lote2_jv="",cant_jv="",date2_jv="",precio="",carnet_jv="",fechanew="",sexo_jv="",mensaje="",afiliado_jv="",fuente="",programa_jv="";
String partida_o1_jv="",partida_o2_jv="",sumatotal="",cant_o1_jv="",cant_o2_jv="";
int cant2_o1_jv=0,cant2_o2_jv=0,mtotalot=0,mtotalotsur=0,resto22_jv=0,mtotalotsur2=0,c_s=0;
String but="r";
String but2="r";
String nom_unidad="",no_jur="";
int cont1=0,cont2=0,cont3=0,cv_med2=0,cv_med3=0,pos=0,posf=0,x1=0,sur2=0,sol2=0,cant2_jv=0,resto_jv=0,no_existe=0;
double monto2=0.0,precio2=0.0,ptotal=0.0,mtotal=0.0,ptotal2=0.0;
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="",t1_jv="",t2_jv="",t3_jv="",tfecha_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="",status="";
String financiamiento[]= new String[5000];
String afiliado[]= new String[5000];
String origen[]= new String[5000];
String lotes[]= new String[5000];
String folios[]= new String[50000];
String org[]= {"1","2"};
//array para fuentes
String finan[] = {"SEGURO POPULAR","OPORTUNIDADES","FASSA","ASE","SMNG","Gasto Catastróficos"};
String encontrado="",oring="";
int ban=0,ban2=0,afi=0;
financiamiento[0]="";
afiliado[0]="";
origen[0]="";
int cont=0,cont5=0;
// fin varibles
// proceso de fecha
   java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
	String date="";
	String date2=""; 
   String res=""; 
   String day1=""; 
   String hora_rec="",fecha_rec="";
 
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
//fin fecha ------------------------------------- 
// try para obtener valores
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
		//foliore3_jv=request.getParameter("foliore2");
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
		t2_jv=request.getParameter("day5");
		t3_jv=request.getParameter("aa5");
		carnet_jv=request.getParameter("carnet");
 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
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
// fin try ------------------------------------------------

//proceso para obtener los folios con el estatus PS
	rset2= stmt2.executeQuery("select distinct folio_re,nombre_pac from receta where folio_re like '%-%' group by folio_re+0;");
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
	 rset2= stmt2.executeQuery("select * from receta where folio_re='"+foliore_jv+"' ");
	  while(rset2.next())
	  {
	  	cont1++;
	  }
	  //out.print(""+cont1);
	 if(cont1>0)
	 {
	 rset1= stmt.executeQuery("select * from receta where folio_re='"+foliore_jv+"' ");
	  while(rset1.next())
				     {
					  t1_jv=rset1.getString("fecha_re");
					  Statement stmt_date = conn.createStatement();
				      ResultSet rset_date = stmt_date.executeQuery("SELECT DATE_FORMAT('"+t1_jv+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
                    while(rset_date.next())
					{
                    	t1_jv= rset_date.getString("DATE_FORMAT('"+t1_jv+"', '%d/%m/%Y')");//STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
					 }
					 hora_rec=rset1.getString("hora");
					 fecha_rec=rset1.getString("fecha_re");
					 nom_unidad=rset1.getString("unidad");
					 no_jur=rset1.getString("no_juris");
					 nombre_jv=rset1.getString("nombre_pac");
					 carnet_jv=rset1.getString("carnet");
					 edad_jv=rset1.getString("edad");
					 folio_jv=rset1.getString("folio_sp");
					 nomed_jv=rset1.getString("nombre_medi");
					 cedu_jv=rset1.getString("cedula_medi");
					 cause_jv=rset1.getString("causes");
					 sexo_jv=rset1.getString("aux7");
					 }
					 
					 }else{
      rset1= stmt.executeQuery("select * from receta where folio_re='"+foliore_jv+"' ");
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
	    }
		
		folio_jv="";
		edad_jv="0";
		nombre_jv="";
		nomed_jv="";
		cedu_jv="";
		t1_jv="";
		foliore_jv="";
		
		}

}
// fin proceso Por Folio
// Proceso Imprimir
if(but.equals("Imprimir"))
     {
	  foliore2_jv=request.getParameter("txtf_foliore");
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
	  self.location='ticket_checarf.jsp?folio=<%=foliore2_jv%>&receta5=RF&encar=<%=encar_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&part=<%=part_jv%>&id_med=<%=id_med_jv%>';
	  
	  </script>
	  <%
	  foliore_jv="";
	  //
}
//fin proceso imprimir
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Ver Receta :.</title>
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

<style type="text/css">
<!--
.style2 {
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
}
.style4 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
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
doce {
	font-size: 12px;
}
-->
</style>
</head>

<body>
<script src="scw.js" type="text/javascript"> </script>
<form name="form" method="post" action="ver_receta.jsp?uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&part=<%=part_jv%>&carnet=<%=carnet_jv%>">
<a href="index.jsp" class="style2">REGRESAR A MENÚ</a>
<table width="893" height="621" border="3" align="center" cellpadding="2">
  <tr>
    <td width="877" height="114"><table width="864" border="0" align="center" cellpadding="2">
      <tr>
        <td width="201" height="59"><div align="center"><img src="imagenes/nay_ima1.jpg" width="203" height="78" />&nbsp;</div></td>
        <td width="417"><div align="center" class="style7">SERVICIOS DE SALUD DE NAYARIT<br />
        RECETA FARMACIA</div>
         </td>
        <td width="226"><div align="center"><img src="imagenes/ssn.jpg" width="219" height="89" />&nbsp;</div>
          <!--input name="Submit"  type="reset" class="bodyText" value="Borrar Datos" /--></td>
      </tr>
    </table>
      <table width="877" height="59" border="0" align="center" cellpadding="2">
        <tr>
          <td width="440" height="55" class="style2">
            Ingrese No. Folio:
          <input name="txtf_foliore" type="text" class="style13"  value="<%=foliore_jv%>" size="15" onKeyPress="return handleEnter(this, event)"/>
          <label for="select"></label>
          <select name="slct_fol" id="slct_fol" onChange="putFolio();">
            <option>-- Folios --</option>
          <%
           for(x1=0;x1<pos;x1++)
              {
         %>
                <option value="<%=folios[x1]%>"><%=folios[x1]%></option>
         <%
			  }
		 %>
          </select>
          &nbsp;<input name="Submit" type="submit" class="subHeader" value="Por Folio"/>
          <input name="act" type="submit" value="ACT" /></td>
          <td width="167"><table width="167" height="0%" border="0" cellpadding="2">
            <tr>
              <td width="225" height="100%" class="style2">HORA:
                <input name="reloj" type="text" class="style13" value="<%=hora_rec%>" onKeyPress="return handleEnter(this, event)" size="15" readonly ></td>
            </tr>
          </table></td>
          <td width="250" align="center" class="style2">
            FECHA:
                  <input name="txtf_t1" type="text" id='txtf_t1' onKeyPress="return handleEnter(this, event)" onKeyUp="putDays()" value="<%=t1_jv%>" size="10" class="style13"/>&nbsp;&nbsp;
          </td>
        </tr>
    </table>    </td>
  </tr>
        
        <tr>
          <td height="2" colspan="3" class="style4"><div id="item7" style="display:none" align="justify" ><span class="style2">
            <input name="txtf_date1" type="text" size="20" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onKeyPress="return handleEnter(this, event)" readonly/>
          </span></div></td>
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
          <td height="62" colspan="3" class="style4"><table width="859" border="0" align="center" cellpadding="2">
            <tr>
              <td width="724" height="52" class="style2">NOMBRE DEL PACIENTE:
                <label> </label>
                <span class="style5">
                <label> </label>
                <input name="txtf_paciente" type="text" class="style13" value="<%=nombre_jv%>" size="55"  onKeyPress="return handleEnter(this, event)"/>
                </span>
                <label><!--span class="style2"> Carnet:&nbsp;
                <input name="txtf_carnet" type="text" class="style13" value="<%//=carnet_jv%>" size="8"  onKeyPress="return handleEnter(this, event)"/-->
                 Sexo:
                <input name="txtf_sexo" type="text" class="style13" value="<%=sexo_jv%>" size="5"  onKeyPress="return handleEnter(this, event)"/>
                EDAD:
                <input name="txtf_edad" type="text" class="style13" value="<%=edad_jv%>" size="5"  onkeypress="return handleEnter(this, event)"/>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO PATERNO </span><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO MATERNO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOMBRE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label></td>
              <td width="15">&nbsp;</td>
            </tr>
            <tr>
              <td height="52" class="style2">No. DE FOLIO S.P.<span class="style11">
                <input name="txtf_foliosp" type="text" class="style13" value="<%=folio_jv%>" size="20" onKeyPress="return handleEnter(this, event)"/>
              </span>
              NOMBRE M&Eacute;DICO:
                <input name="txtf_nomed" type="text" class="style13" value="<%=nomed_jv%>" size="35"  onKeyPress="return handleEnter(this, event)" />
              <span class="style2">C&Eacute;DULA: 
              <input name="txtf_cedu" id="a" type="text" class="style13" value="<%=cedu_jv%>" size="10"  onKeyPress="return handleEnter(this, event)"/>
              </span>
              </td>
              <td>&nbsp;</td>
            </tr>
    </table>          </td>
        </tr>
       
        
        <tr>
          <td height="219" colspan="3" class="style4">INSUMOS DISPENSADOS<table width="779" border="0" align="center" cellpadding="2">
            <tr>
              <td colspan="7" class="style11"><hr /></td>
            </tr>
			
            <tr>
              <td width="70" align="center" class="style11"><span class="style2">CLAVE</span></td>
              <td width="260" align="center" class="style11"><span class="style2">DESCRIPCI&Oacute;N</span></td>
              <td width="50" align="center" class="style11"><span class="style2">LOTE</span></td>
              <td width="70" align="center" class="style11"><span class="style2">CADUCIDAD</span></td>
              <td width="63" align="center" class="style11"><span class="style2">CANT. SOL</span></td>
              <td width="65" align="center" class="style11"><span class="style2">CANT. SUR </span></td>
              <td width="67" align="center" class="style11"><span class="style2">ORIGEN</span></td>
              <td width="7" class="style11">&nbsp;</td>
              <td width="71" class="style11">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="7" class="style11"><hr /></td>
            </tr>
			 <%
  Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
  Statement stmt__001 = conn__001.createStatement();
  ResultSet rset__001=stmt__001.executeQuery("select fecha_re,clave,descrip,lote,caducidad,cant_sol,cant_sur,surtido,aux8,id,partida,afiliado,id_med,fuente,present,aux7 from receta where folio_re='"+foliore_jv+"'");
 
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
			  <td class="style11">&nbsp;</td>
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
	  //out.print("valor 1"+eliminar_jv);
	  %>
      <%
	  	if(c_s==0)
			{
	  %>
              <td class="style11">&nbsp;</td>
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
              <td height="28" class="style11">&nbsp;</td>
              <td class="style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label>              </label></td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11">&nbsp;</td>
              <td class="style11"><input name="Submit" type="submit" class="subHeader" value="Imprimir" onClick="return verifica_PSI(document.forms.form);" /></td>
            </tr>
          </table></td>
  </tr>
        </tr>
</table>
<%
// ----- try que cierra la conexión a la base de datos
		 try{
               // Se cierra la conexión dentro del try
                 conn__001.close();
	          }catch (Exception e){mensaje=e.toString();}
           finally{ 
               if (conn__001!=null){
                   conn__001.close();
		                if(conn__001.isClosed()){
                             mensaje="desconectado2";}
                 }
             }
			 //out.print(mensaje);
		// ---- fin de la conexión	 	  
%>

</body>
</html>
