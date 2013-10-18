<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.DecimalFormat" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<% 
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: rc_elim.jsp
Función      : Elimina folio de una RC. 
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
   String status_surt="",usuario="";
   
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
String folios[]= new String[50000];
String origen[]= new String[5000];
String finan[] = {"SEGURO POPULAR","OPORTUNIDADES","FASSA","ASE","SMNG","Gasto Catastróficos"};
String org[]= {"1","2"};
financiamiento[0]="";
origen[0]="";

String carnet_jv="-",sexo_jv="-",corte="-",ampuleo="-",programa_jv="-";

int pos=0,tam2=0,x1=0,cont3=0,ban=0,posf=0,ban2=0,cant2_jv=0,cv_med2=0,cv_med3=0,cont1=0,cont5=0,cont6=0,sur2=0,sol2=0,mtotal=0,total2=0,total=0,flag=0,customerIds=0,cant_pasti_ampu=0,cant_surpas_amp=0,ttcant_surpas_amp=0,ttcant_surpas_amp2=0,ban_clave=0,tipo_rec=0,no_existe=0;
String encontrado="",cant_jv="",financiamiento1="",cv_finan_jv="",layout="",status="",cant_pasti="",cant_surpas="",count_cv="",servicio_jv="",fechanew="",sumatotal="",cant_sur_vacio="",valor_exis="",indi="",mensaje="";

String f_gnk=request.getParameter("txtf_fol2");
String partida_o1_jv="",cant_o1_jv="",partida_o2_jv="",cant_o2_jv="",lotes_jv="",cadus_jv="",cant_por_surtir="";
int cant2_o1_jv=0,cant2_o2_jv=0,mtotalot=0,mtotal_col=0,mtotalotsur=0,mtotalotsur2=0,resto22_jv=0,vacio=0,existe=0,vacio_sur=0;

int suma_exis=0,origen_1=0,origen_2=0,cant_x_sutir=0,salida=0,valor_exis_num=0,salidas_num=0,exis_total_num=0,total_salidas=0,sur1_1_jv=0,exis_restantes=0,resto=0,exist_may=0,salidas_may=0,exist_0=0,cantxsur_may=0,entrar_exis_0=0,sum_exis=0,var_salidas=0,sum_salidas=0,pen_sur=0,exis_may=0;
//double ttcant_surpas_amp2=0.0;				  
String hora_ini_jv="",hora_jv="";
String lugar_jv="";
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",radiopro_jv="",radiosur_jv="",date_jv="",date2_jv="",reloj_jv="",eliminar_jv="",clave_bus="";
String but="r";
String nom_unidad="",no_jur="",juris_jv="";
//variables medicamento 1
String med1_jv="",descrip1_jv="",indica1_jv="",sol1_jv="",sur1_jv="",present1_jv="",clave1_jv="",desdmed_jv="",descripmed_jv="";

//variables medicamento 1
String med2_jv="",descrip2_jv="",indica2_jv="",sol2_jv="",sur2_jv="",present2_jv="",clave2_jv="";

//variables medicamento 1
String med3_jv="",descrip3_jv="",indica3_jv="",sol3_jv="",sur3_jv="",present3_jv="",clave3_jv="";
//varibles medico
String medico_jv="",uni_jv="",cedu_jv="",nomed_jv="",t1_jv="",t2_jv="",t3_jv="",tfecha_jv="",encarser_jv="",nuevo_folio="";
String ela_jv="", ela2_jv="";
int cont2=0,resto_jv=0,cont4=0;
String fol2_jv="";
String fol2_vi_jv="",act_folio="";
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
     usuario=request.getParameter("usuario");   
		
		 }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
try { 
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
// fin de try --------------------------------------------------------------
// se obtienen los folios de la tabla receta_colectiva
//proceso para obtener los folios con el estatus PS
	rset= stmt.executeQuery("select distinct folio_re from receta_colectiva group by folio_re+0;");
	 while(rset.next())
	  {
	    //nom_pac=rset2.getString("nombre_pac");	  
	  	folios[posf]=rset.getString("folio_re");
		posf++;
	  }
// fin folios obtención
//Proceso Actualizar
if(but.equals("Actualizar Datos"))
     {
	 	 String da_jv=request.getParameter("txtf_date");
		 Statement stmt_date = conn.createStatement();
		 ResultSet rset_date = stmt_date.executeQuery("SELECT STR_TO_DATE('"+da_jv+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
         while(rset_date.next())
		 {
              date_jv= rset_date.getString("STR_TO_DATE('"+da_jv+"', '%d/%m/%Y')");//STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		 }
		 //id_rec=request.getParameter("txtf_id"); 
		 foliore_jv=request.getParameter("txtf_foliore");
		 act_folio=request.getParameter("txtf_foliore2");
		 //date_jv=request.getParameter("txtf_date");
		 hora_jv=request.getParameter("reloj");
		 nuevo_folio=request.getParameter("txtf_foliore");
		 nom_unidad=request.getParameter("txtf_unidadmed");
		 ela2_jv=request.getParameter("txtf_ela");
		 no_jur=request.getParameter("txtf_njuris");
		 servicio_jv=request.getParameter("txtf_servicio");
		 encarser_jv=request.getParameter("txtf_encarser");
		 		 
		 rset= stmt.executeQuery("select folio_re from receta_colectiva where folio_re='"+nuevo_folio+"' ");
	  while(rset.next())
	  {
	  	cont4++;
		break;
	  }
	if(cont4>0) 
	{
	stmt.execute("insert into receta_colectiva_modi(SELECT * from receta_colectiva where folio_re='"+act_folio+"'); ");
	stmt.execute("update receta_colectiva set folio_re='"+nuevo_folio+"', hora='"+hora_jv+"', fecha_re='"+date_jv+"',unidad='"+nom_unidad+"', encargado='"+ela2_jv+"', servicio='"+servicio_jv+"',aux7='"+encarser_jv+"' where folio_re='"+act_folio+"'");  
	
	
	rset_date = stmt_date.executeQuery("SELECT DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
         while(rset_date.next())
		 {
              date_jv= rset_date.getString("DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')");//STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
		 }
	 %>
	
        <script>
			alert("DATOS MODIFICADOS");
		</script>
   <%
		
    }
		 else
		  {
			  %>
              <script>
			  alert("FOLIO INEXISTENTE, NO SE PUEDE HACER LA MODIFICACIÓN");
			  </script>
              <%
		  }
	 }
// fin proceso -----

// proceso Eliminar Folio
if(but.equals("Eliminar Folio"))
     {
		 //id_rec=request.getParameter("txtf_id");
		 //nuevo_folio=request.getParameter("txtf_f");
		 act_folio=request.getParameter("txtf_foliore");
		 
		 rset= stmt.executeQuery("select folio_re from receta_colectiva where folio_re='"+act_folio+"' ");
	  while(rset.next())
	  {
	  	cont4++;
		break;
	  }
	if(cont4>0) 
	{
		stmt.execute("insert into receta_colectiva_elim(SELECT * from receta_colectiva where folio_re='"+act_folio+"'); "); 
		stmt.execute("delete FROM receta_colectiva where folio_re='"+act_folio+"' ");   
		%>
        <script>
			alert("FOLIO ELIMINADO DE LA RECETA COLECTIVA");
		</script>
   <%
		
    }
		 else
		  {
			  %>
              <script>
			  alert("FOLIO EXISTENTE, NO SE PUEDE ELIMINARLO");
			  </script>
              <%
		  }
	 }
// fin proceso -----

// Proceso Por Folio
if(but.equals("Por Folio"))
     {
	 foliore_jv=request.getParameter("txtf_foliore2");
	 //out.print(""+foliore_jv);
	 rset= stmt.executeQuery("select * from receta_colectiva where folio_re='"+foliore_jv+"' ");
	  while(rset.next())
	  {
	  	cont1++;
		break;
	  }
	  //out.print(""+cont1);
	 if(cont1>0)
	 {
	 rset= stmt.executeQuery("select * from receta_colectiva where folio_re='"+foliore_jv+"' ");
	  while(rset.next())
				     {
					  date_jv=rset.getString("fecha_re");
					  date2_jv=rset.getString("fecha_re");
					  Statement stmt_date = conn.createStatement();
				      ResultSet rset_date = stmt_date.executeQuery("SELECT DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
                    while(rset_date.next())
					{
                    	date_jv= rset_date.getString("DATE_FORMAT('"+date_jv+"', '%d/%m/%Y')");//STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
					 }
					 hora_jv=rset.getString("hora");
					 //date_jv=rset1.getString("fecha_re");
					 foliore_jv=rset.getString("folio_re");
					 nom_unidad=rset.getString("unidad");
					 no_jur=rset.getString("no_juris");
					 ela2_jv=rset.getString("encargado");
					 servicio_jv=rset.getString("servicio");
					 encarser_jv=rset.getString("aux7");
					 
			       }
					 
					 }else{
      rset= stmt.executeQuery("select * from receta_colectiva where folio_re='"+foliore_jv+"' ");
	  while(rset.next())
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
		
		/*folio_jv="";
		edad_jv="0";
		nombre_jv="";
		nomed_jv="";
		cedu_jv="";
		t1_jv="";
		foliore_jv="";*/
		
		}

}
// fin proceso Por Folio

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
	  self.location='ticket2_rcmodi.jsp?folio=<%=foliore2_jv%>&folio2=<%=customerIds%>&receta5=RC&encar=<%=ela2_jv%>&uni=<%=nom_unidad%>&juris=<%=no_jur%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&encarser=<%=encarser_jv%>&ban=<%=tipo_rec%>&usuario=<%=usuario%>';
	  
	  </script>
	  <%
}
// fin proceso Imprimir	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Modificar Receta Colectiva Encabezado :.</title>
<script language="javascript" src="list02.js"></script>
<script language="javascript" src="scw.js"></script>


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
	text-align: center;
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

<body>

<form name="form" method="post" action="rc_modi.jsp?usuario=<%=usuario%>&ban=<%=tipo_rec%>">
<a href="menu_mod_rc.jsp?usuario=<%=usuario%>" class="style2">REGRESAR A MENÚ</a>
<table width="957" height="562" border="3" align="center" cellpadding="2">

  <tr>
    <td width="725" height="156"><table width="860" border="0" align="center" cellpadding="2">
      <tr>
        <td width="114"><img src="imagenes/nay_ima1.jpg" width="203" height="78" /></td>
        <td width="339"><div align="center"><span class="style7">SERVICIO DE SALUD DE NAYARIT<br />
        RECETA COLECTIVA<br />
        MODIFICAR FOLIO</span>**</div></td>
        <td width="225"><div align="center"><img src="imagenes/ssn.jpg" width="219" height="89" /></div></td>
      </tr>
    </table>
      
      <table width="914" height="61" border="0" align="center" cellpadding="2">
        <tr>
          <td width="450" class="style2">
           Ingrese No. Folio:
          <input name="txtf_foliore2" type="text" class="style13"  value="<%=foliore_jv%>" size="15" onKeyPress="return handleEnter(this, event)"/>
          <label for="select"></label>
          <select name="slct_fol" id="slct_fol" onChange="putFolio2();">
            <option>-- Folios --</option>
          <%
           for(x1=0;x1<posf;x1++)
              {
         %>
                <option value="<%=folios[x1]%>"><%=folios[x1]%></option>
         <%
			  }
		 %>
          </select>
          &nbsp;<input name="Submit" type="submit" class="subHeader" value="Por Folio"/>
          <input name="act" type="submit" value="ACT" />
          </td>
          <td width="291" class="style2">FECHA:<input readonly name="txtf_date" id="txtf_date" type="text" class="Estilo5" onKeyPress="return handleEnter(this, event)" value="<%=date_jv%>" size="8"/>
          <img src="imagenes/cal.jpg" width="27" height="26" border="0" onClick="scwShow(scwID('txtf_date'), event)" scr="imagenes/cal.jpg" />&nbsp; HORA:
                <input name="reloj" type="text"  class="Estilo5" onKeyPress="return handleEnter(this, event)" value="<%=hora_jv%>" size="10" readonly="readonly" >         
            </td>
          <td width="153" align="center" class="style2"> No. Folio
            <table width="152" height="0%" border="0" align="right" cellpadding="2">
            <tr>
              <td width="144" height="100%"><label>
                <input name="txtf_foliore" type="text" class="Estilo5" value="<%=foliore_jv%>" size="10" readonly />
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
              <td width="533" class="style2">UNIDAD DE SALUD&nbsp;<span class="style11">
                <input type="text" name="txtf_resul" size="20" value="<%=formateador.format(ttcant_surpas_amp2)%>" style="visibility:hidden"/>
              </span></td>
              <td width="170"><table width="170" border="0" align="left" cellpadding="2">
                <tr>
                  <td width="162" align="center"><div align="center" class="style2">JURISDICCION&nbsp;&nbsp;<input name="txtf_njuris"  class="Estilo5" readonly type="text" size="1" value="<%=no_jur%>"/>
                  </div></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="2"><textarea name="txtf_unidadmed" cols="40" class="Estilo5" colspan="3" readonly="readonly"><%=nom_unidad%></textarea>
                <span class="style2">ELABOR&Oacute; COLECTIVO: </span> <label>
                <textarea name="txtf_ela" cols="35"  class="Estilo5"><%=ela2_jv%></textarea>
              </label></td>
            </tr>
          </table>
		  
		  </td>
        </tr>
        <tr>
		<td height="241">
		<table width="939" border="0" align="center" >
            <tr>
              <td width="82" class="style2">Servicio:</td>
              <td width="226" class="style11"><span class="style2">
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
              <textarea name="txtf_servicio" cols="30" readonly="readonly" class="Estilo5"><%=servicio_jv%></textarea>
              </span></td>
              <td width="133" class="style11"><span class="style2">Encargado del Servicio:</span></td>
              <td width="472" class="style11"><span class="style2">
                <input type="text" name="txtf_encarser" class="Estilo5" size="40" value="<%=encarser_jv%>" onChange="mayeE(this.form)" />
              </span></td>
            </tr>
            <tr>
              <td colspan="4"><hr /></td>
            </tr>
            <tr>
              <td colspan="4">
              <table width="875" border="0" align="center" cellpadding="2">
            
           
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
              <td class="style2">&nbsp;
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
              <td class="style11"><input name="Submit" type="submit" class="subHeader" value="Imprimir" onClick="return verifica_RCI(document.forms.form);"/></td>
            </tr>
        </table>
              </td>
            </tr>
          </table>
		</td>
		</tr>
      <tr>
        <td height="40" colspan="3" class="style4"><input name="Submit" type="submit" class="subHeader" value="Actualizar Datos" onClick="return verifica_ACT(document.forms.form);"/></td>
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
