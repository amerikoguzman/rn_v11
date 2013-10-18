<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<% 
/* ----------------------------------------------------------------------------------------------------
Nombre de JSP: modi_datos.jsp
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
String hora_ini_jv="",nuevo_folio="",act_folio="",id_rec="";
String lugar_jv="";
String cb_jv="",nombre_jv="",edad_jv="",folio_jv="",cause_jv="",foliore_jv="",foliore2_jv="",foliore3_jv="",foliore4_jv="",radiopro_jv="",radiosur_jv="",date_jv="",reloj_jv="",encar_jv="",juris_jv="",clave_jv="",eliminar_jv="",usu_jv="",equipo_jv="",integrantes_jv="",recibe_id_jv="",cv_dgo_jv="",cv_uni_jv="",cv_mpio_jv="",id_med_jv="",part_jv="",layout="",cv_finan_jv="",financiamiento1="",precio_jv="",monto_jv="",exi_jv="",lote2_jv="",cant_jv="",date2_jv="",precio="",carnet_jv="",fechanew="",sexo_jv="",mensaje="",afiliado_jv="",fuente="",programa_jv="";
String partida_o1_jv="",partida_o2_jv="",sumatotal="",cant_o1_jv="",cant_o2_jv="";
int cant2_o1_jv=0,cant2_o2_jv=0,mtotalot=0,mtotalotsur=0,resto22_jv=0,mtotalotsur2=0,c_s=0;
String but="r";
String but2="r";
String nom_unidad="",no_jur="",usuario="";
int cont1=0,cont2=0,cont3=0,cont4=0,cv_med2=0,cv_med3=0,pos=0,posf=0,x1=0,sur2=0,sol2=0,cant2_jv=0,resto_jv=0,no_existe=0;
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
String folios[]= new String[5000];
String org[]= {"1","2"};
//array para fuentes
String finan[] = {"SEGURO POPULAR","OPORTUNIDADES","FASSA","ASE","SMNG","Gasto Catastróficos"};
String encontrado="",oring="";
int ban=0,ban2=0,afi=0;
financiamiento[0]="";
afiliado[0]="";
origen[0]="";
int cont=0,cont5=0;

String hora_mod="", fecha_mod="", folio_mod="", uni_mod="", juris_mod="", paciente_mod="", sexo_mod="", edad_mod="", foliosp_mod="", medico_mod="", cedula_mod="";

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
try { 
        usuario=request.getParameter("usuario");
    }catch(Exception e){System.out.print("not");} 


try { 
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
foliore3_jv=request.getParameter("txtf_foliore");
// fin try ------------------------------------------------

//proceso para obtener los folios con el estatus PS
	rset2= stmt2.executeQuery("select distinct folio_re,nombre_pac from receta group by folio_re+0;");
	 while(rset2.next())
	  {
	    //nom_pac=rset2.getString("nombre_pac");	  
	  	folios[pos]=rset2.getString("folio_re");
		pos++;
	  }
	
// fin proceso ------------------------------------
//Proceso Actualizar
if(but.equals("Actualizar Datos"))
     {
		 //id_rec=request.getParameter("txtf_id");
		 nuevo_folio=request.getParameter("txtf_f");
		 act_folio=request.getParameter("txtf_foliore");
		 hora_mod=request.getParameter("reloj");
		 fecha_mod=request.getParameter("txtf_t1");
		 uni_mod=request.getParameter("txtf_unidadmed");
		 juris_mod=request.getParameter("txtf_njuris");
		 paciente_mod=request.getParameter("txtf_paciente");
		 sexo_mod=request.getParameter("txtf_sexo");
		 edad_mod=request.getParameter("txtf_edad");
		 foliosp_mod=request.getParameter("txtf_foliosp");
		 medico_mod=request.getParameter("txtf_nomed");
		 cedula_mod=request.getParameter("txtf_cedu");
		 		 
		 
		 rset2= stmt2.executeQuery("select folio_re from receta where folio_re='"+nuevo_folio+"' ");
	  while(rset2.next())
	  {
	  	cont4++;
		break;
	  }
	if(cont4>0) 
	{
		stmt2.execute("insert into receta_modi(SELECT * from receta where folio_re='"+act_folio+"'); ");
		stmt2.execute("update receta set folio_re='"+nuevo_folio+"', hora='"+hora_mod+"', fecha_re='"+fecha_mod+"',unidad='"+uni_mod+"', no_juris='"+juris_mod+"', nombre_pac='"+paciente_mod+"',aux7='"+sexo_mod+"',edad='"+edad_mod+"', folio_sp='"+foliosp_mod+"',nombre_medi='"+medico_mod+"',cedula_medi='"+cedula_mod+"', aux9='"+act_folio+"' where folio_re='"+act_folio+"'");   %>
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
					 id_rec=rset1.getString("id");
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
<title>.: Modificar Receta Datos :.</title>
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

<form name="form" method="post" action="modi_datos.jsp?uni=<%=nom_unidad%>&juris=<%=no_jur%>&nombre=<%=nombre_jv%>&edad=<%=edad_jv%>&folio=<%=folio_jv%>&clave1=<%=clave1_jv%>&descrip1=<%=descrip1_jv%>&present1=<%=present1_jv%>&indica1=<%=indica1_jv%>&sol1=<%=sol1_jv%>&sur1=<%=sur1_jv%>&cause=<%=cause_jv%>&foliore=<%=foliore_jv%>&encar=<%=encar_jv%>&juris1=<%=juris_jv%>&clave_uni=<%=clave_jv%>&univer=<%=uni_jv%>&cedu=<%=cedu_jv%>&nomed=<%=nomed_jv%>&cv_dgo=<%=cv_dgo_jv%>&cv_uni=<%=cv_uni_jv%>&cv_mpio=<%=cv_mpio_jv%>&day5=<%=t1_jv%>&mes5=<%=t2_jv%>&aa5=<%=t3_jv%>&part=<%=part_jv%>&carnet=<%=carnet_jv%>&usuario=<%=usuario%>">
<a href="menu_mod_rf.jsp?usuario=<%=usuario%>" class="style2">REGRESAR A MENÚ</a>
<table width="893" height="427" border="3" align="center" cellpadding="2">
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
          <input name="txtf_foliore" type="text" class="style13" onKeyPress="return handleEnter(this, event)"  value="<%=foliore_jv%>" size="15" readonly/>
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
                <input name="reloj" type="text" class="style13" value="<%=hora_rec%>" onKeyPress="return handleEnter(this, event)" size="15" ></td>
            </tr>
          </table></td>
          <td width="250" align="center" class="style2">
            FECHA:
                  <input name="txtf_t1" type="text" class="style13" id='txtf_t1' onKeyPress="return handleEnter(this, event)"  value="<%=fecha_rec%>" size="10"/>
                  &nbsp;&nbsp;AAAA-MM-DD</td>
        </tr>
    </table>    </td>
  </tr>
        
        <tr>
          <td height="2" colspan="3" class="style4"><div id="item7" style="display:none" align="justify" ><span class="style2">
            <input name="txtf_date1" type="text" size="20" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onKeyPress="return handleEnter(this, event)" readonly/>
          </span></div></td>
        </tr>
        <tr>
          <td height="41" colspan="3" class="style4"><table width="874" border="0" align="center" cellpadding="2">
            <tr>
              <td width="685" class="style2">FOLIO:<input type="text" name="txtf_f" size="10" colspan="3" class="style13"  value="<%=foliore_jv%>"  onKeyPress="return handleEnter(this, event)"/>&nbsp;&nbsp;UNIDAD DE SALUD
              <input type="text" name="txtf_unidadmed" size="55" colspan="3" class="style13"  value="<%=nom_unidad%>" onKeyPress="return handleEnter(this, event)"/></td>
              <td width="175"><table width="170" border="0" align="left" cellpadding="2">
                <tr>
                  <td width="162" align="center"><div align="center" class="style2">JURISDICCION&nbsp;&nbsp;<input name="txtf_njuris" type="text" class="style13" value="<%=no_jur%>" size="1"  onKeyPress="return handleEnter(this, event)"/>
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
                <input name="txtf_paciente" type="text" class="style13"  onKeyPress="return handleEnter(this, event)" value="<%=nombre_jv%>" size="55"/>
                </span>
                <label><!--span class="style2"> Carnet:&nbsp;
                <input name="txtf_carnet" type="text" class="style13" value="<%//=carnet_jv%>" size="8"  onKeyPress="return handleEnter(this, event)"/-->
                 Sexo:
                <input name="txtf_sexo" type="text" class="style13"  onKeyPress="return handleEnter(this, event)" value="<%=sexo_jv%>" size="5"/>
                EDAD:
                <input name="txtf_edad" type="text" class="style13"  onkeypress="return handleEnter(this, event)" value="<%=edad_jv%>" size="5"/>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOMBRE</span><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO PATERNO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO MATERNO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label></td>
              <td width="15">&nbsp;</td>
            </tr>
            <tr>
              <td height="52" class="style2">No. DE FOLIO S.P.<span class="style11">
                <input name="txtf_foliosp" type="text" class="style13" onKeyPress="return handleEnter(this, event)" value="<%=folio_jv%>" size="20"/>
              </span>
              NOMBRE M&Eacute;DICO:
                <input name="txtf_nomed" type="text" class="style13"  onKeyPress="return handleEnter(this, event)" value="<%=nomed_jv%>" size="35" />
              <span class="style2">C&Eacute;DULA: 
              <input name="txtf_cedu" type="text" class="style13" id="a"  onKeyPress="return handleEnter(this, event)" value="<%=cedu_jv%>" size="10"/> <!--input name="txtf_id" type="text" class="style13" value="<%//=id_rec%>" size="5"  onkeypress="return handleEnter(this, event)" readonly="readonly"/-->
              </span>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
    </table>          </td>
  </tr>
       
        
        <tr>
          <td height="25" colspan="3" align="center">
            <input name="Submit" type="submit" class="subHeader" value="Actualizar Datos" onClick="return verifica_ACT(document.forms.form);"/>
          </td>
  </tr>
        </tr>
</table>
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
