<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% DecimalFormat forma= new DecimalFormat("##,###.##"); %>
<%
response.setContentType ("application/vnd.ms-excel"); 
response.setHeader ("Content-Disposition", "attachment;filename=\"report.xls\"");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
Class.forName("org.gjt.mm.mysql.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit","root","eve9397");
   // add 1 to month because Calendar's months start at 0, not 1
  %>
<%

//declaracion de variables-------------------------------------------------------------------------------------------------------------------
String cant_sol="0", cant_sur="0", cant_nosur="0", recetas_tot="0", recetas_par="0", porcentaje="0", fecha="", mensaje=""; 
String cant_sol_col="0", cant_sur_col="0", cant_nosur_col="0", recetas_tot_col="0", recetas_par_col="0", porcentaje_col="0", fecha_col=""; 
int sol=0, sur=0, dif=0, sol_col=0, sur_col=0, dif_col=0, total_sol=0, total_sur=0, i=1, ancho=0;
//-------------------------------------------------------------------------------------------------------------------------------------------

Statement stmt = null ;
ResultSet rset =null;
stmt = conn.createStatement();

Statement stmt2 = null ;
ResultSet rset2 =null;
stmt2 = conn.createStatement();


String fecha1="2013-01-01", fecha2="2013-01-01", but="";




fecha1=request.getParameter("f1");
fecha2=request.getParameter("f2");
	

String qry_sol="SELECT id from RECETA WHERE FECHA_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' GROUP BY FECHA_re";
String qry_sol_colectivo="", qry_rece="";

rset = stmt.executeQuery(qry_sol); 
while(rset.next())
{
	
	i++;
	
}
ancho=i*100;
//qry_rece="select count(surtido) from receta where surtido = 'SI' and fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"'";
//out.print(qry_rece);
%>

<html>
<head>
<script language="javascript" src="scw.js"></script>
</head>

<form action="rep_nivserv.jsp" method="get">
<h2>Nivel de Servicio de Farmacias</h2><br />
<h3>Del : <%=fecha1%>
al <%=fecha2%></h3>
</form>

<table bgcolor="#FFFFFF">
    <tr>
  <td><table width="200px" border="1" bgcolor="#FFFFFF" bordercolor="#CCCCCC">
      <tr>
        <td>Fecha</td>
      </tr>
      <tr>
        <td>Pzs Solicitadas</td>
      </tr>
      <tr>
        <td>Pzs no Surtidas</td>
      </tr>
       <tr>
        <td>Claves Solicitadas</td>
      </tr>
       <tr>
        <td>Claves no Surtidas</td>
      </tr>
       <tr>
        <td>Recetas Solicitadas</td>
      </tr>
      <tr>
        <td>Rec 100 / Rec Parciales</td>
      </tr>
      <tr>
        <td>Porcentaje</td>
      </tr>
      <tr>
        <td>Pzs Vendidas</td>
      </tr>
      <tr>
        <td>Importe Venta</td>
      </tr>
    </table></td>
  
    <td><table border="1" width="<%=ancho%>px" bgcolor="#FFFFFF" bordercolor="#CCCCCC">
        <tr>
          <%
String qry_fecha="select fecha_re from receta where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
rset = stmt.executeQuery(qry_fecha); 
while(rset.next())
{
	fecha=rset.getString("FECHA_RE"); 
	rset2 = stmt2.executeQuery("SELECT DATE_FORMAT('"+fecha+"', '%d/%m/%Y')"); //;SELECT STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
                    while(rset2.next())
					{
                    	fecha= rset2.getString("DATE_FORMAT('"+fecha+"', '%d/%m/%Y')");//STR_TO_DATE('"+date_jv+"', '%m/%d/%Y')
						//out.print(fecha2);
					 }
	%>
          <td style="width:auto"><%=fecha%></td>
          <%
}
%>
		<td><strong>Totales</strong></td>
        </tr>
        
        
        
        
        
        
        <%
String qry_pzsol="select sum(cant_sol), fecha_re from receta  where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
%>
        <tr>
          <%
int total_pzs_sol=0;
rset = stmt.executeQuery(qry_pzsol); 
while(rset.next())
{
	cant_sol=rset.getString("sum(cant_sol)");
	fecha=rset.getString("fecha_re");
	String qry_pzsol_col="select sum(cant_sol) from receta_colectiva  where fecha_re = '"+fecha+"'";
	rset2 = stmt2.executeQuery(qry_pzsol_col); 
	while(rset2.next()){
		cant_sol_col=rset2.getString("sum(cant_sol)");
	}
	if (cant_sol_col==null){
		cant_sol_col="0";
	}
	sol = Integer.parseInt(cant_sol);
	sol_col=Integer.parseInt(cant_sol_col);
	total_sol=sol+sol_col;
	total_pzs_sol += total_sol;
%>
          <td style="text-align: right"><%=total_sol%></td>
          <%
}
%>
		<td style="text-align: right"><strong><%=total_pzs_sol%></strong></td>
        </tr>
        
        
        
        
        
        <%
String qry_pzsur="select sum(cant_sol), sum(cant_sur),fecha_re from receta  where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
%>
        <tr>
          <%
int total_pzs_no_sur=0;
rset = stmt.executeQuery(qry_pzsur); 
while(rset.next())
{
	cant_sol=rset.getString("sum(cant_sol)"); 
	cant_sur=rset.getString("SUM(CANT_SUR)"); 
	fecha=rset.getString("fecha_re"); 
	sol=Integer.parseInt(cant_sol);
	sur=Integer.parseInt(cant_sur);
	dif=sol-sur;
	
	
	String qry_pzsur_col="select sum(cant_sol), sum(cant_sur) from receta_colectiva  where fecha_re='"+fecha+"'group by fecha_re";
	rset2 = stmt2.executeQuery(qry_pzsur_col); 
	while(rset2.next()){
		cant_sol_col=rset2.getString("sum(cant_sol)"); 
		cant_sur_col=rset2.getString("SUM(CANT_SUR)"); 
		sol_col=Integer.parseInt(cant_sol_col);
		sur_col=Integer.parseInt(cant_sur_col);
		dif_col=sol_col-sur_col;
	}
	total_sol=dif_col+dif;
	
%>
          <td style="text-align: right"><%=total_sol%></td>
          <%
		  total_pzs_no_sur += total_sol;
}

%>
		<td style="text-align: right"><strong><%=total_pzs_no_sur%></strong></td>
        </tr>
        
        
        
        <tr>
        <%
		int tot_clavez_sol=0, total_cla_sol_c=0;
		String qry_cant_pzs="select fecha_re from receta where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
		rset = stmt.executeQuery(qry_cant_pzs); 
		while(rset.next())
		{
			fecha=rset.getString("fecha_re");
			int cont = 0, cont2=0;
			String qry_clasur="select clave from receta where fecha_re = '"+fecha+"' group by clave";
			rset2 = stmt2.executeQuery(qry_clasur); 
			while(rset2.next()){
				cont++;
			}
			String qry_clasur2="select clave from receta_colectiva where fecha_re = '"+fecha+"' and not exists (select receta.clave from receta  where receta.clave=receta_colectiva.clave and fecha_re = '"+fecha+"')  group by clave;";
			rset2 = stmt2.executeQuery(qry_clasur2); 
			while(rset2.next()){
				cont2++;
			}
			
			%>
			<td style="text-align: right">
			<%=cont+cont2%>
			</td>
			<%
			//tot_clavez_sol = tot_clavez_sol +(cont+cont2);
			//cont_cs++;
		}
		
		String qry_cant_pzsf="select clave from receta where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by clave";
		rset = stmt.executeQuery(qry_cant_pzsf); 
		while(rset.next()){
			tot_clavez_sol++;
		}
		String qry_cant_pzsc="select clave from receta_colectiva where fecha_re between '"+fecha1+"' and '"+fecha2+"' and not exists (select receta.clave from receta  where receta.clave=receta_colectiva.clave and fecha_re between '"+fecha1+"' and '"+fecha2+"')  group by clave;";
		rset = stmt.executeQuery(qry_cant_pzsc); 
		while(rset.next()){
			total_cla_sol_c++;
		}
		
		int total_cla_soli=tot_clavez_sol+total_cla_sol_c;
		%>
        
        <td style="text-align: right"><strong><%=total_cla_soli%></strong></td>
        </tr>
        
        
        <tr>
        <%
		int total_cla_no_sur=0, cont_nosur=0, cont4=0;
		String qry_cant_pzs1="select fecha_re from receta where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
		rset = stmt.executeQuery(qry_cant_pzs1); 
		while(rset.next())
		{
			fecha=rset.getString("fecha_re");
			int cont = 0, cont2=0, tot=0, cont3=0, cont5=0;
			String qry_clasur="select clave from receta where fecha_re = '"+fecha+"' group by clave";
			rset2 = stmt2.executeQuery(qry_clasur); 
			while(rset2.next()){
				cont++;
			}
			String qry_clasur2="select clave from receta_colectiva where not exists (select receta.clave from receta  where receta.clave=receta_colectiva.clave and receta_colectiva.fecha_re = '"+fecha+"')  group by clave;";
			rset2 = stmt2.executeQuery(qry_clasur2); 
			while(rset2.next()){
				cont2++;
			}
			
			String qry_clat="select clave from receta where surtido = 'no' and fecha_re = '"+fecha+"' group by clave";
			rset2 = stmt2.executeQuery(qry_clat); 
			while(rset2.next()){
				cont3++;
			}
			
			String qry_clasur3="select clave from receta_colectiva where surtido = 'no' and fecha_re = '"+fecha+"' and not exists (select receta.clave from receta  where surtido = 'no' and receta.clave=receta_colectiva.clave and fecha_re = '"+fecha+"')  group by clave;";
			rset2 = stmt2.executeQuery(qry_clasur3); 
			while(rset2.next()){
				cont5++;
			}
			
			tot = (cont3+cont5);
			%>
			<td style="text-align: right">
			<%=tot%>
           
			</td>
			<%
			//total_cla_no_sur += tot;
			//cont_nosur++;
		}
		int tot_clavez_nsol1=0, total_cla_nsol_c=0;
		String qry_cant_pzsnf="select clave from receta where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' and surtido = 'no' group by clave;";
		rset = stmt.executeQuery(qry_cant_pzsnf); 
		while(rset.next()){
			tot_clavez_nsol1++;
		}
		String qry_cant_pzsnc="select clave from receta_colectiva where fecha_re between '"+fecha1+"' and '"+fecha2+"' and surtido = 'no' and not exists (select receta.clave from receta  where surtido = 'no' and receta.clave=receta_colectiva.clave and fecha_re between '"+fecha1+"' and '"+fecha2+"')  group by clave;";
		rset = stmt.executeQuery(qry_cant_pzsnc); 
		while(rset.next()){
			total_cla_nsol_c++;
		}
		
		int total_cla_nos=tot_clavez_nsol1+total_cla_nsol_c;
		%>
        <td style="text-align: right"><strong><%=total_cla_nos%></strong></td>
        </tr>
        
        <%
String qry_tot_rece="select fecha_re from receta  where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
%>
        <tr>
          <%
		  int tot_rec_sol = 0;
rset = stmt.executeQuery(qry_tot_rece); 
while(rset.next())
{
	fecha=rset.getString("fecha_re"); 
	
	int tot_folios=0;
	
	String qry_pzsur_col="select folio_re,count(folio_re),fecha_re from receta where fecha_re='"+fecha+"'group by fecha_re,folio_re";
	rset2 = stmt2.executeQuery(qry_pzsur_col); 
	while(rset2.next()){
		tot_folios++;
	}
	//total_sol=dif_col+dif;
	
	qry_pzsur_col="select folio_re,count(folio_re),fecha_re from receta_colectiva where fecha_re='"+fecha+"'group by fecha_re,folio_re";
	rset2 = stmt2.executeQuery(qry_pzsur_col); 
	while(rset2.next()){
		tot_folios++;
	}
	//total_sol=dif_col+dif;
	
%>

          <td style="text-align: right"><%=tot_folios%></td>
          <%
		  tot_rec_sol+=tot_folios;
}
%>
		
		<td style="text-align: right"><strong><%=tot_rec_sol%></strong></td>
        </tr>
       
       
       
        
        
        
        <%
String qry_sur="select fecha_re from receta  where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
%>
        <tr>
          <%
int tot_rec_100 = 0, tot_rec_par= 0;
rset = stmt.executeQuery(qry_sur); 
while(rset.next())
{
 	int r_rf=0, r_no=0, r_parcial=0;
	fecha=rset.getString("fecha_re"); 
	
	String qry_surno="select folio_re,count(folio_re),fecha_re from receta  where  fecha_re = '"+fecha+"' group by folio_re";
	rset2 = stmt2.executeQuery(qry_surno); 
	while(rset2.next())
	{
		r_rf++;
	}
	
	qry_surno="select folio_re,count(folio_re),fecha_re from receta_colectiva  where  fecha_re = '"+fecha+"' group by folio_re";
	rset2 = stmt2.executeQuery(qry_surno); 
	while(rset2.next())
	{
		r_rf++;
	}
	
	
	qry_surno="select folio_re,count(folio_re),fecha_re from receta  where surtido = 'no' and fecha_re = '"+fecha+"' group by folio_re";
	rset2 = stmt2.executeQuery(qry_surno); 
	while(rset2.next())
	{
		r_no++;
	}
	
	qry_surno="select folio_re,count(folio_re),fecha_re from receta_colectiva where surtido = 'no' and fecha_re = '"+fecha+"' group by folio_re";
	rset2 = stmt2.executeQuery(qry_surno); 
	while(rset2.next())
	{
		r_no++;
	}
	
	r_parcial= r_rf - r_no;
	
	
%>
          <td style="text-align: right"><%=r_parcial%> // <%=r_no%></td>
          <%
		  tot_rec_100+=r_parcial;
		  tot_rec_par+=r_no;
}
%>
		<td style="text-align: right"><strong><%=(tot_rec_100)%>//<%=tot_rec_par%></strong></td>
        </tr>
        
        
        
        
        
        
        
        <%
String qry_por="select sum(cant_sol), sum(cant_sur),fecha_re from receta  where  fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
%>
        <tr>
          <%
int c_dias=0;
float total_por=0;
rset = stmt.executeQuery(qry_por); 
while(rset.next())
{
	cant_sol=rset.getString("sum(cant_sol)"); 
	cant_sur=rset.getString("sum(cant_sur)"); 
	fecha=rset.getString("fecha_re"); 
	
	String qry_surno="select sum(cant_sol), sum(cant_sur) from receta_colectiva  where  fecha_re ='"+fecha+"'";
	rset2 = stmt2.executeQuery(qry_surno); 
	while(rset2.next())
	{
		cant_sol_col=rset2.getString("sum(cant_sol)"); 
		cant_sur_col=rset2.getString("sum(cant_sur)");
	}
	
	if (cant_sol_col==null)
	cant_sol_col="0";
	
	if (cant_sur_col==null)
	cant_sur_col="0";
	
	float sol_d=Integer.parseInt(cant_sol);
	float sur_d=Integer.parseInt(cant_sur);
	float sol_d_col=Integer.parseInt(cant_sol_col);
	float sur_d_col=Integer.parseInt(cant_sur_col);
	
	float tot_f=((sur_d+sur_d_col)*100)/(sol_d+sol_d_col);
	
%>
          <td style="text-align: right"><%=tot_f%> %</td>
          <%
	c_dias++;
	total_por += tot_f;
}	
float tot_porc = 0;
if ( c_dias == 0){
	tot_porc = 0;
} else {
	tot_porc = (total_por/c_dias);
}

%>
		<td style="text-align: right"><strong><%=tot_porc%> %</strong></td>
        </tr>
        
        
        
        <tr>
        <%
		int tot_pzs_sol=0;
		String qry_fecha1="select sum(cant_sur), fecha_re from receta  where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
		rset = stmt.executeQuery(qry_fecha1); 
		while(rset.next())
		{
		  cant_sol=rset.getString("sum(cant_sur)");
		  fecha=rset.getString("fecha_re");
		  String qry_pzsol_col="select sum(cant_sur) from receta_colectiva  where fecha_re = '"+fecha+"'";
		  rset2 = stmt2.executeQuery(qry_pzsol_col); 
		  while(rset2.next()){
			cant_sol_col=rset2.getString("sum(cant_sur)");
		  }
		  if (cant_sol_col==null){
			cant_sol_col="0";
		  }
		  sol = Integer.parseInt(cant_sol);
		  sol_col=Integer.parseInt(cant_sol_col);
		  total_sol=sol+sol_col;
		  %>
		  <td style="text-align: right"><%=total_sol%></td>
		  <%
		  tot_pzs_sol += total_sol;
		}
		%>
        <td style="text-align: right"><strong><%=tot_pzs_sol%></strong></td>
        </tr>
        
        
        <tr>
		<%
		float tot_ventas=0;
        String qry_fecha2="select sum(precio_tt), fecha_re from receta  where fecha_re BETWEEN '"+fecha1+"' AND '"+fecha2+"' group by fecha_re";
        rset = stmt.executeQuery(qry_fecha2); 
        while(rset.next())
        {
		  float sol1=0, sol_col1=0, total_sol1=0;
          cant_sol=rset.getString("sum(precio_tt)");
          fecha=rset.getString("fecha_re");
          String qry_pzsol_col="select sum(precio_tt) from receta_colectiva  where fecha_re = '"+fecha+"'";
          rset2 = stmt2.executeQuery(qry_pzsol_col); 
          while(rset2.next()){
            cant_sol_col=rset2.getString("sum(precio_tt)");
          }
          if (cant_sol_col==null){
            cant_sol_col="0";
          }
          sol1 = Float.parseFloat(cant_sol);
          sol_col1=Float.parseFloat(cant_sol_col);
          total_sol1=sol1+sol_col1;
          %>
          <td style="text-align: right">$ <%=forma.format(total_sol1)%></td>
          <%
		  tot_ventas += total_sol1;
        }
        %>
        <td style="text-align: right"><strong>$ <%=forma.format(tot_ventas)%></strong></td>
        </tr>
        
        
      </table></td>
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
