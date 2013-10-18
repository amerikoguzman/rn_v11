<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<% 
/*------------------------------------------------------------------------------------------
Nombre de archivo: kardex.jsp
Funcion: Carga Clave a inventario de forma manual, se queda registro del asiento
  -----------------------------------------------------------------------------------------*/
// Conexión BDD vía JDBC
  Class.forName("org.gjt.mm.mysql.Driver");
  Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
  Statement stmt = conn__001.createStatement();
  Statement stmt1 = conn__001.createStatement();
  Statement stmt01 = conn__001.createStatement();
  Statement stmt_mod = conn__001.createStatement();
  Statement stmt_mod2 = conn__001.createStatement();
  ResultSet rset_001=null;
  ResultSet rset_002=null;
  ResultSet rset_mod=null;
  ResultSet rset_mod2=null;
// fin conexión bdd  

// Para tomar datos fechas
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
 //fin de fechas

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


// Variables de entorno
String noaf_jv="",nom_jv="",ap_jv="",ap5_jv="",am_jv="",am22_jv="",nombre1_jv="",clave_jv="",clave2_jv="",descrip_jv="",origen_jv="",exist_jv="",origen2="",exist2_jv="0",total22_jv="",clave22_jv="",origen22_jv="",descrip22_jv="",fechanew="",razon="";
int existe=0,am2_jv=0,exist=0,ap2_jv=0,total=0,pos=0,encontrado=0,encontrado_ing=0,exist_inv=0,ing_from_inv=0,sal_from_inv=0,exist_new=0,exist_ant=0,sum_mov_ent=0,sum_mov_sal=0,sum_total_exis=0,ban_ciclos=0,ban_ciclos_sali=0,ban_mod=0;
String clave1_jv="",descrip1_jv="",origen1_jv="",exist1_jv="",mensaje="",lote_jv="",cad_jv="",total_exis_sal="";
String but="r";
String lotes[]= new String[5000];
String cad[]= new String[5000];
String folio_mod="", cant_ant="", cant_mov="", cant_act="", status="", observ="", origen_mod="", usu="", fecha_mod="", hora_mod="";
// fin variables de entorno
// recibe valores de usuario y el valor del botón oprimido
try { 
        am22_jv=request.getParameter("usuario");  
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
// Proceso Mostrar
if(but.equals("Mostrar"))
 {// inicio de if
  ban_ciclos=0;
  clave_jv=request.getParameter("txtf_clave2");
  descrip_jv=request.getParameter("txtf_descrip");
  lote_jv=request.getParameter("txtf_lote");
  cad_jv=request.getParameter("txtf_cad");
  origen_jv=request.getParameter("txtf_origen");
  
 
  
   rset_001=stmt01.executeQuery("select sum(cant) as total_exis from movimientos_entradas where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';");
	 
			 while(rset_001.next())
			 {// inicio while 1
			 ban_ciclos=1;
			  sum_mov_ent=Integer.parseInt(rset_001.getString("total_exis"));	
			 }// fin while 1
			 rset_001=stmt01.executeQuery("select sum(cant) as total_exis from movimientos_salidas where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';");
	 
			 while(rset_001.next())
			 {// inicio while
			 total_exis_sal=rset_001.getString("total_exis");
			 if(total_exis_sal!=null)
			  {
			    ban_ciclos_sali=1;
			    sum_mov_sal=Integer.parseInt(rset_001.getString("total_exis"));
			  }
			 }// fin while
	if(ban_ciclos==1)
 {
	rset_001=stmt01.executeQuery("select cant from movimientos_entradas where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';");
 }
 if(ban_ciclos_sali==1)
 {
	rset_002=stmt.executeQuery("select cant from movimientos_salidas where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';");
	//ban_ciclos=1;		 
 }
 
 // Para mostrar modificaciones
  rset_mod=stmt_mod.executeQuery("select folio,cant_anterior,cant_mov,cant_actual,status,obser,origen,usuario,fecha,hora from modificacion where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';	 ");
//select sum(cant) as total_exis from movimientos_entradas where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';

			 if(rset_mod.next())
			 {// inicio while 1
			 ban_mod=1;
			 
			 }// fin while 1
 // ----------- modi
			 
  }// fin if Mostrar
// fin Mostrar -----------------------------------
// inicio proceso Clave	
if(but.equals("Clave"))
 {// inicio de if
	 clave2_jv=request.getParameter("txtf_clave");
	 origen2=request.getParameter("slct_origen");
	 
	  if(clave2_jv.equals(""))
		  {// inicio if clave2_jv
		  %>
		  <script>
		  alert('CAMPO VACÍO, Ingrese una CLAVE');
		  </script>
		  <%
		  }// fin if clave2_jv
		  else{ // inicio else
	 			if(origen2.equals("--Origen--"))
				  {// inicio de if origen2
				  %>
				  <script>
				  	alert('Seleccione Origen');
				  </script>
				  <%
				  }// fin de if origen2
				  else{// inicio else
		  
	 rset_001=stmt01.executeQuery("select clave,descrip from clave_med where clave='"+clave2_jv+"' ");
	 
			 while(rset_001.next())
			 {// inicio while
			 	clave_jv=rset_001.getString("clave");
			    descrip_jv=rset_001.getString("descrip");
				origen_jv=origen2;
			 
			 }// fin while
			 
			 // proceso para obtener los lotes
			 rset_001=stmt01.executeQuery("select distinct lote,cadu from lotes where clave='"+clave2_jv+"' union all select distinct lote,caducidad from inventario_uni where clave='"+clave2_jv+"' order by lote asc; ");
			 while(rset_001.next())
			 {
				lotes[pos]=rset_001.getString("lote"); 
				cad[pos]=rset_001.getString("cadu");
				pos++;
			 }
			 
			 //fin proceso lotes 
		  }//fin else
		}// fin else	 
}// fin if clave
// fin proceso Clave



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: ENTRADA MANUAL:.</title>
<script language="javascript" src="list02.js"></script>
<script>
function foco_inicial(){
if (document.form.txtf_clave2.value==""){
document.form.txtf_clave.focus();
}
else
{
document.form.txtf_cant.focus();
}
}
</script>
<link rel="stylesheet" href="mm_restaurant1.css" type="text/css" />
</style>
<link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
<script src="Scripts/jquery.dataTables.pagination.js" type="text/javascript"></script>
<style type="text/css">
/* BeginOAWidget_Instance_2586523: #dataTable */

	@import url("css/custom/base/jquery.ui.all.css");
	#dataTable {padding: 0;margin:0;width:100%;}
	#dataTable_wrapper{width:100%;}
	#dataTable_wrapper th {cursor:pointer} 
	#dataTable_wrapper tr.odd {color:#000; background-color:#FFF}
	#dataTable_wrapper tr.odd:hover {color:#333; background-color:#CCC}
	#dataTable_wrapper tr.odd td.sorting_1 {color:#000; background-color:#999}
	#dataTable_wrapper tr.odd:hover td.sorting_1 {color:#000; background-color:#666}
	#dataTable_wrapper tr.even {color:#FFF; background-color:#666}
	#dataTable_wrapper tr.even:hover, tr.even td.highlighted{color:#EEE; background-color:#333}
	#dataTable_wrapper tr.even td.sorting_1 {color:#CCC; background-color:#333}
	#dataTable_wrapper tr.even:hover td.sorting_1 {color:#FFF; background-color:#000}
		
/* EndOAWidget_Instance_2586523 */
tam14 {
	font-size: 14px;
}
.negritas {
	font-weight: bold;
	text-align: center;
	font-size: 9px;
}
.rojo {
	color: #900;
}
.FECHA {
	font-size: 10px;
}
.gray {
	color: #CCC;
}
.gray strong {
	color: #999;
}
.neg2 {
	font-weight: bold;
}
.MAR {
	color: #2A0000;
}
.rr {
	color: #A00;
	font-size: 18px;
	font-weight: bold;
}
</style>
<script type="text/xml">
<!--
<oa:widgets>
  <oa:widget wid="2586523" binding="#dataTable" />
</oa:widgets>
-->
</script>
<script>
function CloseWin(){
window.opener = top ;
window.close();
}
</script>

</head>

<body onLoad="foco_inicial();">
<table width="952" height="346" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
  <tr>
  
    <td width="650"><form id="form" name="form" method="post" action="kardex_lc.jsp?usuario=<%=am22_jv%>">
      <table width="856" height="344" border="0" align="center" cellpadding="2">
        <tr>
          <td height="49" bgcolor="#FFFFFF" class="logo style1"><div align="center" class="logo style1"><img src="imagenes/nay_ima1.jpg" width="142" height="72" /></div></td>
          <td height="49" colspan="3" bgcolor="#FFFFFF" class="logo style1"><div align="center">KARDEX POR CLAVE* </div></td>
          <td width="156" height="49" bgcolor="#FFFFFF" class="logo style1"><img src="imagenes/ssn.jpg" width="156" height="65" /></td>
        </tr>
         <tr>
          <td height="6" colspan="5"><a href="index.jsp">Regresar a Men&uacute;</a></td>
          </tr>
        <tr>
          <td height="6" colspan="5"><hr /></td>
          </tr>
        <tr>
          <td width="142" height="20"><span class="Estilo6">Seleccione Origen  :</span></td>
          <td colspan="4" class="bodyText"><span class="Estilo6"><span class="style5">
            <select name="slct_origen" class="Estilo6" onkeypress="return handleEnter(this, event)" onChange="put_cve()">
              <option selected="selected">--Origen--</option>
              <option value="1">SSN</option>
              <option value="2">SAVI</option>
              </select>
            Ingrese Clave  :
            <input name="txtf_clave" type="text" id="txtf_clave" size="15"/>
            <input type="submit" name="Submit" value="Clave" />
            </span></span><span class="Estilo6">Origen: <span class="style5">
              <input name="txtf_origen" type="text" id="txtf_origen" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=origen_jv%>" size="10" />
            </span></span></td>
          </tr>
        <tr>
          <td height="8" colspan="5"><hr /></td>
          </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left" class="Estilo6">Clave:</div>
          </div></td>
          <td colspan="4" class="style5"><span class="Estilo6">
            <input name="txtf_clave2" type="text" id="txtf_clave2" onChange="mayNomm(this.form)" onKeyPress="return handleEnter(this, event)"  value="<%=clave_jv%>" size="10" readonly/>
            Descripci&oacute;n:</span><span class="Estilo6">
            <textarea name="txtf_descrip" cols="50" id="txtf_descrip" onChange="mayApepm(this.form)" onKeyPress="return handleEnter(this, event)" readonly><%=descrip_jv%></textarea>
            </span>
            <div align="left" class="Estilo6"></div></td>
          </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left"><span class="Estilo6">Lote: </span></div>
            </div></td>
          <td colspan="4" class="style5"><input name="txtf_lote" type="text" id="txtf_lote" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=lote_jv%>" size="10" />
            <%
		   if(pos>=1)
		   {
		%>
            <select name="slct_lote" class="bodyText" onChange="setLot1(this.form);dimePropiedades(this.form);" onkeypress="return handleEnter(this, event)">
              <option>-- Lote --</option>
              <%
		     
             for(int x1=0;x1<pos;x1++)
                {
                   
           %>
              <option value="<%=lotes[x1]%>"><%=lotes[x1]%></option>
              <%
	  }
	%>
              </select><%
	  }
	%>
            
            
            <span class="Estilo6">Caducidad: 
              <input name="txtf_cad" type="text" id="txtf_cad" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=cad_jv%>" size="10" />
              <%
		   if(pos>=1)
		   {
		%>
              <select name="slct_cad" class="bodyText" onChange="setCad(this.form)" onkeypress="return handleEnter(this, event)">
                <option>-- Caducidad --</option>
                <%
		     
             for(int x1=0;x1<pos;x1++)
                {
                   
           %>
                <option value="<%=cad[x1]%>"><%=cad[x1]%></option>
                <%
                }
           %>
              </select>
              <%
		  }
		%>
              
              <input type="submit" name="Submit" value="Mostrar" />
            </span></td>
          </tr>
        <tr>
          <td height="7" colspan="5"><hr /> </td>
          </tr>
       
       
        <tr>
          <td height="20" colspan="10">
          <table width="97%" border="0" cellpadding="0" cellspacing="0" id="dataTable">
  <thead>
  <tr>
      <th colspan="10" class="FECHA" ><hr /></th>
      </tr>
    <tr>
      <th width="4%" class="FECHA" >FOLIO</th>
      <th width="8%" class="FECHA">EXISTENCIA ANTERIOR</th>
      <th width="9%" class="FECHA">MOVIMIENTO</th>
      <th width="8%" class="FECHA">EXISTENCIA ACTUAL</th>
      <th width="7%" class="FECHA">ESTATUS</th>
      <th width="27%" class="FECHA">OBSERVACION</th>
      <th width="8%" class="FECHA">ORIGEN</th>
      <th width="11%" class="FECHA">USUARIO</th>
      <th width="9%" class="FECHA">FECHA</th>
      <th width="9%" class="FECHA">HORA</th>
      
      
    </tr>
    <tr>
      <th colspan="10" class="FECHA" ><hr /></th>
      </tr>
  </thead>
  <tbody>
    <!--Loop start, you could use a repeat region here-->
  <%
  	if(ban_mod==1)	  
	  {	
	  // Para mostrar modificaciones
  rset_mod2=stmt_mod2.executeQuery("select folio,cant_anterior,cant_mov,cant_actual,present,total_cajas,status,obser,origen,usuario,fecha,hora from modificacion where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';	 ");
//select sum(cant) as total_exis from movimientos_entradas where clave='"+clave_jv+"' and lote='"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"';

			 while(rset_mod2.next())
			 {	 
  %> 
   <tr height="20">
      <td class="negritas" align="center"><%=rset_mod2.getString("folio")%></td>
      <td class="negritas" ><%=rset_mod2.getString("cant_anterior")%></td>
      <td class="negritas" align="center"><%=rset_mod2.getString("cant_mov")%></td>
      <td class="negritas" align="center"><%=rset_mod2.getString("cant_actual")%></td>
      <td  align="center" class="negritas"><%=rset_mod2.getString("status")%></td>
      <td  align="center" class="negritas"><%=rset_mod2.getString("obser")%></td>
      <td  align="center" class="negritas"><%=rset_mod2.getString("origen")%></td>
      <td  align="center" class="negritas"><%=rset_mod2.getString("usuario")%></td>
      <td  align="center" class="negritas"><%=rset_mod2.getString("fecha")%></td>
      <td  align="center" class="negritas"><%=rset_mod2.getString("hora")%></td>
      
    </tr>
	<%//conn_cadu.close();
			 }//fin de while
	  
	  }// fin de if
	
%>
    <!--Loop end-->
  </tbody>
</table>
          *</td>
          </tr>
        <tr>
          <td height="20">TOTAL DE ENTRADAS:</td>
          <td width="165" class="style5"><%=sum_mov_ent%></td>
          <td width="259" class="style5">&nbsp;</td>
          <td width="102" class="style5">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20">TOTAL DE SALIDAS:</td>
          <td class="style5"><%=sum_mov_sal%></td>
          <td class="style5"></td>
           
          <td class="style5">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20">EXISTENCIAS:</td>
          <%sum_total_exis=sum_mov_ent-sum_mov_sal;%>
          <td class="style5"><%=sum_total_exis%></td>
          <td class="style5">&nbsp;</td>
          <td class="style5">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
          </form>
    </td>
  </tr>
</table>

<script type="text/javascript">
// BeginOAWidget_Instance_2586523: #dataTable

$(document).ready(function() {
	oTable = $('#dataTable').dataTable({
		"bJQueryUI": true,
		"bScrollCollapse": false,
		"sScrollY": "200px",
		"bAutoWidth": true,
		"bPaginate": true,
		"sPaginationType": "two_button", //full_numbers,two_button
		"bStateSave": true,
		"bInfo": true,
		"bFilter": true,
		"iDisplayLength": 25,
		"bLengthChange": true,
		"aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Todos"]]
	});
} );
		
// EndOAWidget_Instance_2586523
</script>
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
