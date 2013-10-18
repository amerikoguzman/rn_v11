<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>

<%
Class.forName("org.gjt.mm.mysql.Driver");
Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
 java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
	String date="";
	String date2=""; 
   String res=""; 
   String day1=""; 
 	String mensaje="";
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
 //fecha2=
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
%>
<%

/*----------------------------------------------------------------------------------------------------------------------
Nombre del Archivo: elim_folio.jsp
------------------------------------------------------------------------------------------------------------------------*/


//Declaraciond de variables---------------------------------------------------------------------------------------------
String folio_jv="", id_inv_jv="", cant_sur_jv="", clave1_jv="", descrip1_jv="", lotes_jv="", cadus_jv="", part_jv="", id_inv="", url="", usuario="";
String qry_receta_jv="", qry_insmov_jv="", qry_up="", qry_elim="", qry_ins_elim="", qry_mod="";;
int cant_sur_neg=0, var_exist=0, var_salidas=0, cant_ant=0;;
//----------------------------------------------------------------------------------------------------------------------
folio_jv=request.getParameter("folio");
url=request.getParameter("url");
usuario=request.getParameter("usuario");
//out.print(url);
qry_receta_jv="select id, cant_sur, clave, descrip, lote, caducidad, partida from receta_colectiva where folio_re='"+folio_jv+"'";
//out.println(qry_receta_jv);
if(!folio_jv.equals("")){
ResultSet rset =null;
ResultSet rset_re =null;
Statement stmt = null ;
Statement stmt_re = null ;
Statement stmt1 = null ;

stmt = conn_001.createStatement();
stmt1 = conn_001.createStatement();
stmt_re = conn_001.createStatement();

rset = stmt.executeQuery(qry_receta_jv); 
while(rset.next())
{
       id_inv_jv=rset.getString("id"); 
	   cant_sur_jv=rset.getString("cant_sur");
	   clave1_jv=rset.getString("clave");
	   descrip1_jv=rset.getString("descrip");
	   lotes_jv=rset.getString("lote");
	   cadus_jv=rset.getString("caducidad");
	   part_jv=rset.getString("partida");
	   
	   cant_sur_neg=Integer.parseInt(cant_sur_jv);
	   cant_sur_neg=(cant_sur_neg)*(-1);
	   
	   //out.println("<br>"+id_inv_jv+"--->"+cant_sur_jv+"--->"+cant_sur_neg);  
	   
	   qry_insmov_jv="insert into movimientos_salidas values ('"+clave1_jv+"','"+descrip1_jv+"','"+lotes_jv+"','"+cadus_jv+"','"+cant_sur_neg+"','1','"+cant_sur_neg+"','"+part_jv+"','-','"+df.format(new java.util.Date())+"','"+hora_com+"','3')"; 
	   stmt1.execute(qry_insmov_jv);
	   //out.println("<br>"+qry_insmov_jv);         
	   //out.println("<br>"+"select cajas,existencias,salidas,id from inventario_uni where clave='"+clave1_jv+"' and lote='"+lotes_jv+"' and caducidad='"+cadus_jv+"' and origen='"+part_jv+"'; ");
	   rset_re = stmt_re.executeQuery("select cajas,existencias,salidas,id from inventario_uni where clave='"+clave1_jv+"' and lote='"+lotes_jv+"' and caducidad='"+cadus_jv+"' and origen='"+part_jv+"'; ");
			while (rset_re.next())
			{
				var_exist=Integer.parseInt(rset_re.getString("existencias"));
				cant_ant=var_exist;
				var_exist+=Integer.parseInt(cant_sur_jv);
				var_salidas=Integer.parseInt(rset_re.getString("salidas"));
				var_salidas=var_salidas-Integer.parseInt(cant_sur_jv);
				id_inv=rset_re.getString("id");
			}
			qry_up="update inventario_uni set salidas='"+var_salidas+"',cajas='"+var_exist+"', existencias='"+var_exist+"' where id='"+id_inv+"';";	
			stmt1.execute(qry_up);
			//out.println("<br>"+qry_up);
			
			qry_mod="insert into modificacion values ('"+clave1_jv+"','"+descrip1_jv+"','"+lotes_jv+"','"+cadus_jv+"','"+cant_ant+"','"+part_jv+"','"+cant_sur_jv+"','"+var_exist+"','"+df.format(new java.util.Date())+"','"+usuario+"','ELIMINACION DE INSUMO','REINTEGRACION DE SALIDA DE INSUMO AL INVENTARIO EN RC',current_timestamp,'"+folio_jv+"','-','10','-','-','"+var_exist+"',0);";
			stmt1.execute(qry_mod);
			
			qry_ins_elim="insert into receta_colectiva_elim (select * from receta_colectiva where id = '"+id_inv_jv+"');";
			//out.println("<br>"+qry_ins_elim);
			stmt1.execute(qry_ins_elim);
		}
		qry_elim="delete from receta_colectiva where folio_re='"+folio_jv+"'";
		//out.println("<br>"+qry_elim);
		stmt1.execute(qry_elim);
		%>
		<script>
		alert('Folio Eliminado');
		location.href=
		("<%=url%>"+"?uni=&juris=&nombre=&edad=&folio=&foliore=&nomed=&day5=&cedu=&ban=1&aa5=&mes5=null&clave1=&descrip1=&sol1=&cause=&usuario="+"<%=usuario%>");
		</script>
		<%
		}
		else{
		%>
		<script>
		alert('Folio Invalido');
		location.href=
		("<%=url%>"+"?uni=&juris=&nombre=&edad=&folio=&foliore=&nomed=&day5=&cedu=&ban=1&aa5=&mes5=null&clave1=&descrip1=&sol1=&cause=&usuario="+"<%=usuario%>");
		</script>
		<%
		}	
%>
<%
// ----- try que cierra la conexión a la base de datos
		 try{
               // Se cierra la conexión dentro del try
                 conn_001.close();
	          }catch (Exception e){mensaje=e.toString();}
           finally{ 
               if (conn_001!=null){
                   conn_001.close();
		                if(conn_001.isClosed()){
                             mensaje="desconectado2";}
                 }
             }
			 //out.print(mensaje);
		// ---- fin de la conexión	 	  

%>