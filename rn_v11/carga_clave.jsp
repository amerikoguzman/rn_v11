<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
 <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<% 
/*------------------------------------------------------------------------------------------
Nombre de archivo: carga_clave.jsp
Funcion: Carga Clave a inventario de forma manual, se queda registro del asiento
  -----------------------------------------------------------------------------------------*/
// Conexión BDD vía JDBC
  Class.forName("org.gjt.mm.mysql.Driver");
  Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
  Statement stmt = conn__001.createStatement();
  Statement stmt1 = conn__001.createStatement();
  Statement stmt01 = conn__001.createStatement();
  Statement stmt_001 = conn__001.createStatement();
  ResultSet rset_001=null;
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
int existe=0,am2_jv=0,exist=0,ap2_jv=0,total=0,pos=0,encontrado=0,encontrado_ing=0,exist_inv=0,ing_from_inv=0,sal_from_inv=0,exist_new=0,exist_ant=0;
String clave1_jv="",descrip1_jv="",origen1_jv="",exist1_jv="",mensaje="",lote_jv="",cad_jv="";
String but="r";
String lotes[]= new String[50000];
String cad[]= new String[50000];
// fin variables de entorno
// recibe valores de usuario y el valor del botón oprimido
try { 
        am22_jv=request.getParameter("usuario");  
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
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
			 rset_001=stmt01.executeQuery("select  lote,cadu from lotes where clave='"+clave2_jv+"' union all select  lote,caducidad from inventario_uni where clave='"+clave2_jv+"' order by lote asc; ");
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

// inicio proceso Checar Existencias
if(but.equals("Checar Existencias"))
 {// inicio de if
  //out.print("ingreso");
  clave_jv=request.getParameter("txtf_clave2");
  descrip_jv=request.getParameter("txtf_descrip");
  lote_jv=request.getParameter("txtf_lote");
  cad_jv=request.getParameter("txtf_cad");
  origen_jv=request.getParameter("txtf_origen");
  
  	 rset_001=stmt01.executeQuery("select clave,lote,caducidad,origen,id,existencias from inventario_uni where clave='"+clave_jv+"' and lote= binary '"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"'; ");
	 while(rset_001.next())
			 {//inicio while
	            exist_jv=rset_001.getString("existencias");	
				encontrado=1;
				break;
			 }//fin while
		if(encontrado==0)
		  {exist_jv="0";}	 
	
  
 }
// fin proceso Checar Existencias
	
	if(but.equals("Limpiar Claves"))
	{
	 //stmt.execute("delete from inventario where cant='0'");
	}
	
	if(but.equals("Ingresar Entrada"))
     {
		  //out.print("ingresosssssss");
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
		 
		 lote_jv=request.getParameter("txtf_lote");
  		 cad_jv=request.getParameter("txtf_cad");
		 razon=request.getParameter("txta_razon");
		
		
		 if(ap2_jv<=0)
		  {
		  %>
		  <script>
		  alert('CAMPO EN CERO O CANTIDAD NEGATIVA, Ingrese una Cantidad VÁLIDA');
		  </script>
		  <%
		  }else
		{
			 
	 total=am2_jv+ap2_jv;
	 
	 //out.print(""+am2_jv+"+"+""+ap2_jv+"="+total);
	 //total2=total;
	 // proceso si existe la clave en el inventario
	   rset_001=stmt01.executeQuery("select clave,descrip,lote,caducidad,origen,id,existencias,ingreso,salidas,id from inventario_uni where clave='"+clave_jv+"' and lote=binary '"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"'; ");
	 while(rset_001.next())
			 {
				 existe=1;
				 break;
			 }
	 
	 // fin proceso existe
	 
	 
	 if(existe==1)
	 {
	 rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}

	 //proceso para incrementar las existencias
	 rset_001=stmt01.executeQuery("select clave,descrip,lote,caducidad,origen,id,existencias,ingreso,salidas,id from inventario_uni where clave='"+clave_jv+"' and lote=binary'"+lote_jv+"' and caducidad='"+cad_jv+"' and origen='"+origen_jv+"'; ");
	 while(rset_001.next())
			 {//inicio while
			  exist_ant=Integer.parseInt(rset_001.getString("existencias"));//lo que hay en existencias o cajas
			  ing_from_inv=Integer.parseInt(rset_001.getString("ingreso"));
			  ing_from_inv+=ap2_jv;
			  sal_from_inv=Integer.parseInt(rset_001.getString("salidas"));
			  exist_new=ing_from_inv-sal_from_inv;
			  // Se ingresan los datos para la tabla de entradas
		 stmt1.execute("insert into movimientos_entradas values ('"+rset_001.getString("clave")+"','"+rset_001.getString("descrip")+"','"+rset_001.getString("lote")+"','"+rset_001.getString("caducidad")+"','"+ap2_jv+"','1','"+ap2_jv+"','"+origen_jv+"','A','"+df.format(new java.util.Date())+"','"+hora_com+"','2')"); 
					 
					 //Se hace el update para la tabla inventario_uni
		 stmt1.execute("update inventario_uni set existencias='"+exist_new+"',cajas='"+exist_new+"',ingreso='"+ing_from_inv+"' where id='"+rset_001.getString("id")+"'");	
	//fin rutina de update 
	// tabla modificacion
	stmt1.execute("insert into modificacion values ('"+clave_jv+"','"+descrip_jv+"','"+rset_001.getString("lote")+"','"+rset_001.getString("caducidad")+"','"+exist_ant+"','"+origen_jv+"','"+ap2_jv+"','"+exist_new+"','"+df.format(new java.util.Date())+"','"+am22_jv+"','ENTRADA AJUSTE MANUAL','"+razon+"',current_timestamp,'-','-','-','-','-','-',0)");	
	// fin tabla
	
			  encontrado_ing=1;
				
			 }
			 
			
	 // fin proceso incremento existencias--------------------------------------
		
	 // ------
	   	/* rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}
		*/
	//   stmt1.execute("insert into modificacion values ('"+clave_jv+"','"+descrip_jv+"','-','-','"+exist_jv+"','"+origen_jv+"','"+ap2_jv+"','"+total+"','"+fechanew+"','"+am22_jv+"','AJUSTE MANUAL','',current_timestamp,'-','-','-','-','-','-',0)");	   
	 
	 
	 }else{
		 
		 rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    fechanew= rset_001.getString("STR_TO_DATE('"+fechanew+"', '%d/%m/%Y')");
					}

		 // se ingresa el registro a inventario_uni
	  	  stmt01.execute("insert into inventario_uni values ('"+clave_jv+"','"+descrip_jv+"','"+lote_jv+"','"+cad_jv+"','"+ap2_jv+"','1','"+ap2_jv+"','"+ap2_jv+"','0','"+origen_jv+"','-','2','"+fechanew+"','"+hora_com+"',0)");
        // fin ingreso
		// se ingresa a movimientos_entradas
		 stmt1.execute("insert into movimientos_entradas values ('"+clave_jv+"','"+descrip_jv+"','"+lote_jv+"','"+cad_jv+"','"+ap2_jv+"','1','"+ap2_jv+"','"+origen_jv+"','A','"+fechanew+"','"+hora_com+"','2')");
		// fin ingreso 
	      
	  	  /* stmt1.execute("insert into modificacion values ('"+clave_jv+"','"+descrip_jv+"','-','-','"+exist_jv+"','"+origen_jv+"','"+ap2_jv+"','"+total+"','"+fechanew+"','"+am22_jv+"','AJUSTE MANUAL','',current_timestamp,'-','-','-','-','-','-',0)");
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
</head>

<body onLoad="foco_inicial();">
<table width="666" height="346" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
  <tr>
  
    <td width="650"><form id="form" name="form" method="post" action="carga_clave.jsp?usuario=<%=am22_jv%>">
      <table width="650" height="377" border="0" align="center" cellpadding="2">
        <tr>
          <td height="49" bgcolor="#FFFFFF" class="logo style1"><div align="center" class="logo style1"><img src="imagenes/nay_ima1.jpg" width="142" height="72" /></div></td>
          <td height="49" colspan="2" bgcolor="#FFFFFF" class="logo style1"><div align="center">Ajuste al Inventario<br />
            ENTRADAS </div></td>
          <td height="49" bgcolor="#FFFFFF" class="logo style1"><img src="imagenes/ssn.jpg" width="156" height="65" /></td>
        </tr>
        <tr>
          <td height="14" colspan="4" bgcolor="#EC3237"><span class="style2"></span></td>
          </tr>
        <tr>
          <td width="114" height="20">Fecha:</td>
          <td width="90" class="bodyText"><label>
          <input name="txtf_date1" type="text" size="10" value="<%= day>10?day:day %>/<%= month>10?month:month %>/<%= year %>" onKeyPress="return handleEnter(this, event)" readonly/>
          </label></td>
          <td width="306"><a href="existencias.jsp" target="_blank">Ver Existencias</a></td>
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
            <div align="left"><span class="Estilo6">Lote: </span></div>
          </div></td>
          <td colspan="2" class="style5"><input name="txtf_lote" type="text" id="txtf_lote" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=lote_jv%>" size="10" />
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
          
          
          </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left"><span class="Estilo6">Caducidad: </span></div>
          </div></td>
          <td colspan="2" class="style5"><input name="txtf_cad" type="text" id="txtf_cad" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=cad_jv%>" size="10" />
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
          </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left"><span class="Estilo6">Origen: </span></div>
          </div></td>
          <td colspan="2" class="style5"><input name="txtf_origen" type="text" id="txtf_origen" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=origen_jv%>" size="10" /></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left"><span class="Estilo6">Existencia: </span></div>
          </div></td>
          <td colspan="2" class="style5"><span class="style5"><label></label>
              </span>            <label>
          <input name="txtf_exist" type="text" id="txtf_exist" onChange="mayApemm(this.form)" onKeyPress="return handleEnter(this, event)" value="<%=exist_jv%>" size="10" readonly/>
            </label>
            <input type="submit" name="Submit" value="Checar Existencias" />
            </td>
          <td>&nbsp;</td>
        </tr>
        
        <tr>
          <td height="20"><div align="left"><span class="Estilo6">Ingrese Cantidad ( + ): </span></div></td>
          <td class="style5"><span class="style5"><label></label>
              <input name="txtf_cant" type="text" id="txtf_cant"  value="<%=ap2_jv%>" onKeyPress="return handleEnter(this, event)" onClick="putClear();"  size="10"/>
          </span></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
  <tr>
          <td height="20"><div align="left"><span class="Estilo6">Razón de Ajuste: </span></div></td>
          <td colspan="2" class="style5"><span class="style5"><label><textarea name="txta_razon" cols="50" id="txta_razon" onChange="mayApepm(this.form)" onKeyPress="return handleEnter(this, event)"><%=razon%></textarea></label>
          </span></td>
          <td>&nbsp;</td>
        </tr>     
        
        <tr>
          <td height="20">&nbsp;</td>
          <td colspan="2"><div align="center">
            <input type="submit" name="Submit" value="Ingresar Entrada" onClick="return verifica_ING(document.forms.form);" />&nbsp;&nbsp;<!--input type="submit" name="Submit" value="Limpiar Claves" /-->
          &nbsp;Cerrar Aplicación <button name="boton" type="button" class="style7" onClick="CloseWin()" /><img src="imagenes/borr.jpg" /></button></div></div></td>
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
		<tr>
		  <td height="20">Lote: <%=lote_jv%></td>
		  <td colspan="2">Caducidad: <%=cad_jv%></td>
		  <td>&nbsp;</td>
		  </tr>
      </table>
          </form>
    </td>
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
