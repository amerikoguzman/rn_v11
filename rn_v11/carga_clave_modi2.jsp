<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="errorbusglob_f.html" %>
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
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
 
%>
<%

 Statement stmt = null;
  Statement stmt1 = null;
  Statement stmt01 = null;
  Statement stmt02 = null;
  Statement stmt_001 = null;
  
  

  
/*---------parametros para la conexion*/
Connection conexion=null;
    String mensaje="";
   /*parametros para la conexion*/
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/r_nayarit";
    String usuario = "root";
    String pass = "eve9397";
/*procedimiento de la conexion*/
    try{
         Class.forName(driver);
    conexion = DriverManager.getConnection(url,usuario,pass);
     
	    stmt = conexion.createStatement();
		stmt1 = conexion.createStatement();
		stmt01 = conexion.createStatement();
		stmt02 = conexion.createStatement();
		stmt_001 = conexion.createStatement();
		
	
	 
	 
         /*guardando la conexion en la session*/
        session.setAttribute("conexion",conexion);
       } catch (Exception ex){
        mensaje=ex.toString();
    }
    mensaje="conectado";
    if(conexion.isClosed()){
        mensaje="desconectado";
    }
//-----FIN PARAMETROS -----------

String noaf_jv="",nom_jv="",ap_jv="",ap5_jv="",am_jv="",am22_jv="",nombre1_jv="",clave_jv="",clave2_jv="",descrip_jv="",origen_jv="",exist_jv="",origen2="",exist2_jv="0",total22_jv="",clave22_jv="",origen22_jv="",descrip22_jv="",fechanew="",obs_jv="";
String but="r";
int cont6=0,am2_jv=0,exist=0,ap2_jv=0,total=0;
ResultSet rset_001=null;
ResultSet rset_002=null;
String clave1_jv="",descrip1_jv="",origen1_jv="",exist1_jv="";

try { 

        am22_jv=request.getParameter("usuario");  
        but=""+request.getParameter("Submit");
		//but2=""+request.getParameter("Submit2");
		//out.print("but ="+but);
        
    }catch(Exception e){System.out.print("not");} 
	
	//out.print(""+am22_jv);
	if(but.equals("Clave"))
     {
	 clave2_jv=request.getParameter("txtf_clave");
	 origen2=request.getParameter("slct_origen");
	 
	  if(clave2_jv.equals(""))
		  {
		  %>
		  <script>
		  alert('CAMPO VAC�O, Ingrese una CLAVE');
		  </script>
		  <%
		  }
		  else{
	 
	 			if(origen2.equals("--Origen--"))
				  {
				  %>
				  <script>
				  alert('Seleccione Origen');
				  </script>
				  <%
				  }
				  else{
		  
	 rset_001=stmt01.executeQuery("select clave,descrip,origen,sum(cant) from inventario where clave='"+clave2_jv+"' and origen='"+origen2+"' group by clave");
	 
			 while(rset_001.next())
			 {
			 cont6++;
			 
			 }
		if (cont6>0)
		{
				rset_001=stmt01.executeQuery("select clave,descrip,origen,sum(cant) from inventario where clave='"+clave2_jv+"' and origen='"+origen2+"' group by clave");
			 
					 while(rset_001.next())
					 {
					 clave_jv=rset_001.getString("clave");
					 descrip_jv=rset_001.getString("descrip");
					 origen_jv=rset_001.getString("origen");
					 exist_jv=rset_001.getString("sum(cant)");
					 clave22_jv=rset_001.getString("clave");
		             origen22_jv=rset_001.getString("origen");
		             descrip22_jv=rset_001.getString("descrip");
					 total=Integer.parseInt(exist_jv);
					 }

		}
				else{
				
				rset_001=stmt01.executeQuery("select clave,descrip from clave_med where clave='"+clave2_jv+"' group by clave");
					 
							 while(rset_001.next())
							 {
							 clave_jv=rset_001.getString("clave");
					 		 descrip_jv=rset_001.getString("descrip");
							 clave22_jv=rset_001.getString("clave");
		                     origen22_jv=origen2;
		                     descrip22_jv=rset_001.getString("descrip");
							 exist_jv=exist2_jv;
							 origen_jv=origen2;
							 
							 }
							 
					 
					 
		}
		}	 
	 }
	 
	 }
	
	
	if(but.equals("Limpiar Claves"))
	{
	 stmt.execute("delete from inventario where cant='0'");
	}
	
	if(but.equals("Guardar"))
     {
		 am_jv=request.getParameter("txtf_exist");
		 ap_jv=request.getParameter("txtf_cant");
		 ap5_jv=request.getParameter("txtf_cant");
		 am2_jv=Integer.parseInt(am_jv);
		 ap2_jv=Integer.parseInt(ap_jv);
		 clave_jv=request.getParameter("txtf_clave2");
		 origen_jv=request.getParameter("txtf_origen");
		 descrip_jv=request.getParameter("txtf_descrip");
		 exist_jv=request.getParameter("txtf_exist");
		 exist=Integer.parseInt(ap_jv);
		/*total22_jv=request.getParameter("txtf_total");
			total=Integer.parseInt(total22_jv);*/
		clave2_jv=request.getParameter("txtf_clave");
		
		clave22_jv=request.getParameter("txtf_clave2");
		 origen22_jv=request.getParameter("txtf_origen");
		 descrip22_jv=request.getParameter("txtf_descrip");
		 fechanew=request.getParameter("txtf_date1");
		 obs_jv=request.getParameter("txtf_obs");
		
		 if(ap2_jv==0)
		  {
		  %>
		  <script>
		  alert('CAMPO EN CERO, Ingrese una Cantidad');
		  </script>
		  <%
		  }else
		{
			 if(obs_jv.equals(""))
			 {
			 %>
		  <script>
		  alert('CAMPO VACIO, Ingrese una Observaci�n');
		  </script>
		  <%
			 
			 }else if (ap2_jv>am2_jv)
			 {
			%>
		  <script>
		  alert('CANTIDAD INGRESADA ES MAYOR A LA EXISTENCIA');
		  </script>
		  <% 
		  ap2_jv=0;
			 }else
			 {
	 total=am2_jv-ap2_jv;
	 
	 //out.print(""+am2_jv+"+"+""+ap2_jv+"="+total);
	 //total2=total;
	 if(am2_jv>0)
	 {
	 
	 stmt.execute("update inventario set cant='"+total+"' where clave='"+clave_jv+"' and origen='"+origen_jv+"'  ");
	 rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}
	   stmt1.execute("insert into modificacion values ('"+clave_jv+"','"+descrip_jv+"','-','-','"+exist_jv+"','"+origen_jv+"','-"+ap2_jv+"','"+total+"','"+fechanew+"','"+am22_jv+"','SALIDA MANUAL AL INVENTARIO','"+obs_jv+"',current_timestamp,'-','-','-','-','-','-',0)");	   
	 
	 
	 }else{
	  stmt.execute("insert into inventario values ('"+clave_jv+"','"+descrip_jv+"','-','-','"+total+"','"+origen_jv+"' )");
	  rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}
	   stmt1.execute("insert into modificacion values ('"+clave_jv+"','"+descrip_jv+"','-','-','"+exist_jv+"','"+origen_jv+"','-"+ap2_jv+"','"+total+"','"+fechanew+"','"+am22_jv+"','SALIDA MANUAL AL INVENTARIO','"+obs_jv+"',current_timestamp,'-','-','-','-','-','-',0)");
	 //out.print(""+total);
	/* if(am2_jv>0)
	 {
	   
	 if(ap2_jv==0)
		 {
		 rset_002=stmt02.executeQuery("select clave,descrip,origen,sum(cant) from inventario where clave='"+clave2_jv+"' and origen='"+origen2+"' group by clave");
		 while(rset_002.next())
		 {
		    clave1_jv=rset_002.getString("clave");
		    descrip1_jv=rset_002.getString("descrip");
			origen1_jv=rset_002.getString("origen");
			exist1_jv=rset_002.getString("sum(cant)");
		 }
		 
		 
		 
		    stmt.execute("delete from inventario where clave='"+clave_jv+"' and origen='"+origen_jv+"'  ");
			
		  }else{
	  stmt.execute("update inventario set cant='"+ap_jv+"' where clave='"+clave_jv+"' and origen='"+origen_jv+"'  ");
	  }
	  
	 
	 
	 
	 }else
	 {
		 if(ap2_jv==0)
		 {
		    stmt.execute("delete from inventario where clave='"+clave_jv+"' and origen='"+origen_jv+"'  ");
		  }else{	
		
		
		
		 stmt.execute("insert into inventario values ('"+clave_jv+"','"+descrip_jv+"','-','-','"+ap_jv+"','"+origen_jv+"' )");
	         }
	 
	 
	 
	 */
	 } 
	  %>
	 <script>
	 alert('DATOS GUARDADOS');
	 //document.form.txtf_cant.value="";
	 </script>
	 <%
	 %>
	 <script>
	 //alert('DATOS GUARDADOS');
	 document.form.txtf_cant.value="";
	 </script>
	 <%
	 clave_jv="";
	 descrip_jv="";
	 origen_jv="";
	 exist_jv="";
	  ap2_jv=0;
	  //ap2_jv="";
	}
	  	 } 
     }



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.:SALIDA POR AJUSTE:.</title>
<script language="javascript" src="list02.js">

function close1()
{//alert("huge");


top.close();  
/*if(navigator.appName=="Microsoft Internet Explorer") { 
this.focus();self.opener = this;self.close(); } 
else { window.open('','_parent',''); window.close(); } 

*/
}



</script>
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
<style type="text/css">
<!--
body {
	background-color: #E6E6E6;
}
.style1 {color: #000000}
.style2 {
	font-size: 8px;
	color: #009999;
}
.style5 {font-size: 36}
.Estilo6 {font-size: 12; }
.Estilo7 {font-size: 14px}
.Estilo8 {color: #FFFFFF}
-->
</style></head>

<body onLoad="foco_inicial();">
<table width="666" height="346" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
  <tr>
  
    <td width="650"><form id="form" name="form" method="post" action="carga_clave_modi2.jsp?usuario=<%=am22_jv%>">
      <table width="650" height="323" border="0" align="center" cellpadding="2">
        <tr>
          <td height="49" bgcolor="#FFFFFF" class="logo style1"><div align="center" class="logo style1">
            <img src="imagenes/nay_ima1.jpg" width="125" height="63" />
          </div></td>
          <td height="49" colspan="2" bgcolor="#FFFFFF" class="logo style1"><div align="center">Salida por Ajuste  al Inventario </div></td>
          <td height="49" bgcolor="#FFFFFF" class="logo style1"><img src="imagenes/ssn.jpg" width="143" height="65" /></td>
        </tr>
        <tr>
          <td height="14" colspan="4" bgcolor="#D51347"><a href="index_movi2.jsp?usuario=<%=am22_jv%>" class="Estilo10 Estilo8">Regresar a Men� </a></td>
          </tr>
        <tr>
          <td width="114" height="20">Fecha:</td>
          <td width="90" class="bodyText"><label>
          <input name="txtf_date1" type="text" size="10" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onKeyPress="return handleEnter(this, event)" readonly/>
          </label></td>
          <td width="306">&nbsp;</td>
          <td width="114">&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left" class="Estilo6">Seleccione Origen  :</div>
          </div></td>
          <td class="style5"><span class="Estilo6">
            <select name="slct_origen" class="Estilo6" onkeypress="return handleEnter(this, event)" onChange="put_cve()">
              <option selected="selected">--Origen--</option>
              <option value="1">SSN</option>
              <option value="2">SAVI</option>
            </select>
          </span></td>
          <td colspan="2" class="style5">
            <div align="left" class="Estilo6"></div></td>
          </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left" class="Estilo6">Ingrese Clave  :</div>
          </div></td>
          <td class="style5"><label><input name="txtf_clave" type="text" id="txtf_clave" size="15"/>
          </label></td>
          <td colspan="2" class="style5">
            <div align="left" class="Estilo6">
              <input type="submit" name="Submit" value="Clave" />
          </div></td>
          </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left" class="Estilo6">Clave: </div>
          </div></td>
          <td colspan="2" class="style5"><label>
            <input name="txtf_clave2" type="text" id="txtf_clave2" onChange="mayNomm(this.form)" onKeyPress="return handleEnter(this, event)"  value="<%=clave_jv%>" size="10" readonly/>
          </label></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left" class="Estilo6">Descripci&oacute;n:</div>
          </div></td>
          <td colspan="2" class="style5"><label>
            <textarea name="txtf_descrip" cols="50" id="txtf_descrip" onChange="mayApepm(this.form)" onKeyPress="return handleEnter(this, event)" readonly><%=descrip_jv%></textarea>
          </label></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left"><span class="Estilo6">Origen: </span></div>
          </div></td>
          <td colspan="2" class="style5"><input name="txtf_origen" type="text" id="txtf_origen" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=origen_jv%>" size="10" readonly/></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left"><span class="Estilo6">Existencia: </span></div>
          </div></td>
          <td colspan="2" class="style5"><span class="style5"><label></label>
              </span>            <label>
          <input name="txtf_exist" type="text" id="txtf_exist" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=exist_jv%>" size="10" readonly/>
            </label></td>
          <td>&nbsp;</td>
        </tr>
        
        <tr>
          <td height="20"><div align="left"><span class="Estilo6">Ingrese Cantidad (-): </span></div></td>
          <td class="style5"><span class="style5"><label></label>
              <input name="txtf_cant" type="text" id="txtf_cant"  value="<%=ap2_jv%>" onKeyPress="return handleEnter(this, event)" size="10"/>
          </span></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
       
        
        <tr>
          <td height="20">Observaci&oacute;n:</td>
          <td colspan="2"><textarea name="txtf_obs" cols="50" rows="2"  id="txtf_descrip" onChange="mayApepm(this.form)" onKeyPress="return handleEnter(this, event)"></textarea></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20">&nbsp;</td>
          <td colspan="2"><div align="center">
            <input type="submit" name="Submit" value="Guardar" />&nbsp;&nbsp;<input type="submit" name="Submit" value="Limpiar Claves" />
          &nbsp;</div>
          </div></td>
          <td>&nbsp;</td>
        </tr>
		<tr>
          <td height="20">Clave&nbsp;:&nbsp;<span class="Estilo7">&nbsp;<%=clave22_jv%></span></td>
          <td colspan="3">Descripci&oacute;n&nbsp;:<span class="Estilo7">&nbsp;&nbsp;<%=descrip22_jv%></span></td>
          </tr>
		<tr>
          <td height="20">Origen&nbsp;:&nbsp;<span class="Estilo7">&nbsp;<%=origen22_jv%></span></td>
          <td colspan="2">Total Piezas&nbsp;:&nbsp;&nbsp;<span class="Estilo7"><%=total%> </span></td>
          <td>&nbsp;</td>
        </tr>
      </table>
          </form>
    </td>
  </tr>
</table>
<%  //----- CIERRE DE LAS CONEXIONES  ------
      try{

conexion.close();
   
    }catch (Exception e) {
                  mensaje=e.toString();
                }
finally { 
if (conexion!=null) {

conexion.close();
                
                 if(conexion.isClosed()){

        mensaje="desconectado";}


      }
}   
//---FIN -----         
%>
</body>
</html>
