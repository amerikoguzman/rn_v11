<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<%


  Statement stmt02 = null;
 
  
  

  
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
     
	    
		stmt02 = conexion.createStatement();
	
		
	
	 
	 
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

String noaf_jv="",nom_jv="",ap_jv="",ap5_jv="",am_jv="",nombre1_jv="",clave_jv="",clave2_jv="",descrip_jv="",origen_jv="",exist_jv="",origen2="",exist2_jv="0",total22_jv="",clave22_jv="",origen22_jv="",descrip22_jv="";
String but="r";
int cont6=0,am2_jv=0,exist=0,ap2_jv=0,total=0,tipo_rec=0;
ResultSet rset_002=null;
String clave1_jv="",descrip1_jv="",origen1_jv="",exist1_jv="";

try { 
        but=""+request.getParameter("Submit");
    }catch(Exception e){System.out.print("not");} 
try{
     tipo_rec=Integer.parseInt(request.getParameter("ban"));	
   }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }

	if(but.equals("Validar"))
     {
		 am_jv=request.getParameter("txtf_usu");
		 ap_jv=request.getParameter("txtf_pass");
		 
		 
		 rset_002=stmt02.executeQuery("select * from pass where usuario='"+am_jv+"' and pass='"+ap_jv+"' ");
		 while(rset_002.next())
		 {
		    cont6++;
		 }
		 
  if (cont6>0)
   {
		if(tipo_rec==1)
			{
		%>
		<script>
alert("Datos correctos RF");
self.location='menu_mod_rf.jsp?usuario=<%=am_jv%>'
</script>
<%
			}else{
		%>
		<script>
alert("Datos correctos RC");
self.location='menu_mod_rc.jsp?usuario=<%=am_jv%>'
</script>
<%	 
		         }
      }else{
	%>
		<script>
			alert("Datos Incorrectos");
        </script>
<%	
		
		}
		 
		 
	 } 
	  
     



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.:VALIDACI&Oacute;N USUARIO:.</title>
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
if (document.form.txtf_usu.value==""){
document.form.txtf_usu.focus();
}

}
</script>
<link rel="stylesheet" href="mm_restaurant1.css" type="text/css" />
</head>

<body onLoad="foco_inicial();">
<table width="666" height="346" border="3" align="center" cellpadding="2" bgcolor="#FFFFFF">
  <tr>
  
    <td width="650"><form id="form" name="form" method="post" action="pass_modi.jsp?ban=<%=tipo_rec%>">
      <table width="650" height="323" border="0" align="center" cellpadding="2">
        <tr>
          <td height="49" bgcolor="#FFFFFF" class="logo style1"><div align="center" class="logo style1">
            <img src="imagenes/nay_ima1.jpg" width="142" height="72" />
          </div></td>
          <td height="49" colspan="2" bgcolor="#FFFFFF" class="logo style1"><div align="center">Validaci&oacute;n de Usuario<br />
          MODIFICACI&Oacute;N *</div></td>
          <td height="49" bgcolor="#FFFFFF" class="logo style1"><img src="imagenes/ssn.jpg" width="162" height="78" /></td>
        </tr>
        <tr>
          <td height="14" colspan="4" bgcolor="#EC3237"><a href="index_menu_receta.jsp" class="Estilo10">Regresar a Men� </a></td>
          </tr>
        <tr>
          <td width="142" height="20">&nbsp;</td>
          <td width="121" class="bodyText"><label></label></td>
          <td width="198">&nbsp;</td>
          <td width="163">&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left" class="Estilo6"></div>
          </div></td>
          <td class="style5"><label><span class="Estilo6">Ingrese Usuario  :</span></label></td>
          <td class="style5"><input name="txtf_usu" type="text" id="txtf_usu" onKeyPress="return handleEnter(this, event)" size="15"/></td>
          <td class="style5">&nbsp;</td>
        </tr>
        <tr>
          <td height="20"><div align="right">
            <div align="left" class="Estilo6"></div>
          </div></td>
          <td class="style5"><label><span class="Estilo6">Password: </span></label></td>
          <td class="style5"><input name="txtf_pass" type="password" id="txtf_pass" onChange="mayNomm(this.form)" onKeyPress="return handleEnter(this, event)"  size="15" /></td>
          <td>&nbsp;</td>
        </tr>
       
       
        
        <tr>
          <td height="20">&nbsp;</td>
          <td colspan="2"><div align="center">
            <input type="submit" name="Submit" value="Validar" />&nbsp;&nbsp;
          &nbsp;</div>
          </div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20">&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="20" colspan="4" align="center"><img src="imagenes/ima_main.jpg" width="471" height="72" /></td>
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
