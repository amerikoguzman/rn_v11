<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import="java.io.*" import ="com.csvreader.CsvReader" import="javax.swing.*" import="java.util.*" errorPage="" %>
<%
//objeto de la Clase Connection, nos sirve para hacer la conexión a la base correspondiente
	Connection conexion=null;
	Statement stmt = null;
	Statement stmt_2 = null;
	Statement stmt_3 = null;
	ResultSet rset = null,rset_2=null,rset_3=null;

// Variables de entorno
	 String mensaje="",mensaje2="";
	 int ban_blancos=0;
	 int inv_ini=0,cant_int=0, no_existe=0,existe=0;
	 String clave="",descri="",lote="",cadu="",cant="",origen="";
	 int ingreso=0,salidas=0,abasto=0,exis_tot=0,ingreso_actual=0;
	 int abast=0,pres_amp=0,total_amp=0,clave_amp=0;//varibles para calcular el ampuleo
	 int cajas_1=0,ing_amp1=0,existencias_amp=0,var_ingreso=0,ingreso_inv=0;
	 String cajas_2="",ing_amp2="",id="";
	 int para_amp=0;
	 
/*parametros para la conexión*/
    String driver = "org.gjt.mm.mysql.Driver";
    String url = "jdbc:mysql://localhost:3306/r_nayarit";
    String usuario = "root";
    //String clave = "eve9397";
    
  /*procedimiento de la conexion*/
    try{
         Class.forName(driver);
         conexion = DriverManager.getConnection(url,usuario,clave);

         /*guardando la conexion en la session*/

         session.setAttribute("conexion",conexion); 
		 stmt=conexion.createStatement(); 
		 stmt_2=conexion.createStatement(); 
		 stmt_3=conexion.createStatement(); 
		 mensaje="conectado";
       } catch (Exception ex){mensaje=ex.toString();}

    if(conexion.isClosed())
        {mensaje="desconectado";}	 
String ruta="";
try{
	ruta=request.getParameter("archivo");		
   } catch (Exception ex){mensaje2=ex.toString();}

//String mensaje="";
//String csv="com.csvreader.CsvReader.class";

String but="r";

// try que obtiene el valor del botón que el usuario haya activado
	 try { 
        but=""+request.getParameter("Submit");
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}
// fin try --------------------------------------------------------	 

// Se obtiene la fecha ---------------------------------------------------------------------------------  
String fecha_ins=""; 
   java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
   String date=""; 
   String res="";
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
fecha_ins=year+"-"+res+"-"+day;
// fin fecha --------------------------------------------------------------------------------------------   

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


 int cont_reader=0,cont_rset=0;
	   
	    //out.print("entro");
	//try{//inicio de try
	     
		 //Class.forName(csv);
         CsvReader reader = new CsvReader(ruta);//ruta
		 reader.setDelimiter(',');
		 CsvReader reader2 = new CsvReader(ruta);//ruta
		 reader2.setDelimiter(',');
		 // rutina para saber si es Inventario Inicial por cargar
		 rset=stmt.executeQuery("select * from inventario_uni");
		  while (rset.next()) 
            {inv_ini=1;}//inicio - fin de while
			
			
			//---PROCESO QUE VALIDA QUE EL ARCHIVO NO TENGA VALORES EN NULO O BLANCOS-----------------------------------------------------------------------
			 while (reader2.readRecord()) 
            {
				if (reader2.get(0)==""||reader2.get(1)==""||reader2.get(2)==""||reader2.get(3)==""||reader2.get(4)==""||reader2.get(5)=="")
				{
					ban_blancos=1;
					 out.print("Error!");
				}else
				{
				
				}
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			  if(inv_ini==0&&ban_blancos==0)
			
			    {   //out.print("Exito!");
				//out.print("Inv Ini "+ inv_ini);
				//out.print("Bandera blancos "+ ban_blancos);
				//inicio de if 
				  while (reader.readRecord()) {//inicio de while
				     clave_amp=0;
					 abasto=0;
					 pres_amp=0;	
					 total_amp=0;
				     //out.println("select clave, cant from pasti_ampu where clave='"+reader.get(0)+"'");
					 rset=stmt.executeQuery("select clave, cant from pasti_ampu where clave='"+reader.get(0)+"'");
						while (rset.next()) 
            			 {// inicio de while
						 	//out.print("La clave: "+reader.get(0)+" Existe en pasti_ampu"+"<br>");
							abasto=Integer.parseInt(reader.get(4));
							pres_amp=Integer.parseInt(rset.getString("cant"));	
							total_amp=abasto*pres_amp;
							//out.print("abasto: "+abasto+" cant_amp: "+pres_amp+"total: "+total_amp+"<br>");	
							//para inventario inicial y es clave de ampuleo
							stmt.execute("insert into inv_ini values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+reader.get(5)+"','A','"+fecha_ins+"','"+hora_com+"',0)");
							// --------------------------------------------	
							// Se ingresan los datos para la tabla de entradas
					 stmt.execute("insert into movimientos_entradas values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+reader.get(5)+"','A','"+fecha_ins+"','"+hora_com+"','1')"); 
					 // fin de ingreso a entradas ---------------------
					 
					  // Se ingresan los datos para la tabla de inventario
					  stmt.execute("insert into inventario_uni values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+total_amp+"','0','"+reader.get(5)+"','A','1','"+fecha_ins+"','"+hora_com+"',0)");
					 // fin de tabla inventario -------------------------
							
						   clave_amp=1; 
						   break;
						 }
					if(clave_amp==0)
					 {	
						abasto=Integer.parseInt(reader.get(4));
						pres_amp=1;	
						total_amp=abasto*pres_amp;	 
					 //out.print("La clave: "+reader.get(0)+" NO Existe en pasti_ampu"+"<br>");
					 //para inventario inicial y es clave de NO ampuleo
							stmt.execute("insert into inv_ini values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+reader.get(5)+"','NA','"+fecha_ins+"','"+hora_com+"',0)");
							// --------------------------------------------	
					 
					// Se ingresan los datos para la tabla de entradas
					 stmt.execute("insert into movimientos_entradas values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+reader.get(5)+"','NA','"+fecha_ins+"','"+hora_com+"','1')"); 
					 // fin de ingreso a entradas ---------------------
					  
					 // Se ingresan los datos para la tabla de inventario
					  stmt.execute("insert into inventario_uni values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+total_amp+"','0','"+reader.get(5)+"','NA','1','"+fecha_ins+"','"+hora_com+"',0)");
					 // fin de tabla inventario -------------------------
					 }
				  }// end while - recorrido del csv
		 							
	out.print("Se cargo el Inventario Inicial con éxito");
				}//end if
		// proceso para ingresar la clave en la tablas de movimientos (si el inventario inicial tiene datos)
		 if (inv_ini==1&&ban_blancos==0)
		   {
		   //out.print("Inv ini <br>"+ inv_ini);
		   //out.print("Bandera blancos <br>"+ ban_blancos);
		   //out.print("Exito 2!");
		    // inicio else
		   
			 while (reader.readRecord()) {  //inicio while recorre el archivo CSV
			 existe=0;no_existe=0;
			 cont_reader++;
			 //out.print("Ingreso al reader y existen datos en la BDD"+cont_rset+"<br>");
			 /*out.print("Clave : "
							+ reader.get(0) + " lote: " + reader.get(2)+ " Caducidad: " + reader.get(3)+ " Cantidad: " + reader.get(4)+ " Origen: " + reader.get(5)+"<br>");*/
							
				rset=stmt.executeQuery("select * from inventario_uni");
		  				while (rset.next()) 
            			 {// inicio de while para recorrer las claves que hay en la tabla inventario_uni
							cont_rset=cont_rset+1;
							clave_amp=0;
							
							  //clave_amp=0;abasto=0;pres_amp=0;total_amp=0;cajas_1=0;ing_amp1=0;salidas=0;existencias_amp=0;
							 //out.print("Ingreso al rset"+cont_rset+"<br>");
							
							if( (rset.getString("clave").equals(reader.get(0))) && (rset.getString("lote").equals(reader.get(2))) && (rset.getString("caducidad").equals(reader.get(3))) && (rset.getString("origen").equals(reader.get(5))) )
							{  
							 // out.print("EXISTE en el inventario"+"<br>");
							  
							/*  out.print("Clave : "
							+ rset.getString("clave") + " lote: " + rset.getString("lote") + " Caducidad: " + rset.getString("caducidad")+ " Entradas: " + rset.getString("ingreso")+"<br>"+" Origen: " + rset.getString("origen")+"<br>");
							 out.print("Clave : "
							+ reader.get(0) + " lote: " + reader.get(2)+ " Caducidad: " + reader.get(3)+ " Cantidad: " + reader.get(4)+ " Origen: " + reader.get(5)+"<br>");*/
							  cajas_1=Integer.parseInt(rset.getString("cajas"));
							  ing_amp1=Integer.parseInt(rset.getString("ingreso"));
							  ingreso_inv=Integer.parseInt(rset.getString("ingreso"));
							  salidas=Integer.parseInt(rset.getString("salidas"));
							  id=rset.getString("id");
							  //operaciones
							  abasto=Integer.parseInt(reader.get(4));
							  cajas_1=cajas_1+abasto;
							  ing_amp1=cajas_1*1;
							  existencias_amp=ing_amp1-salidas;
							  
							  /*
							  
							  	cajas_1=cajas_1+abasto;
								ing_amp1=Integer.parseInt(rset.getString("ingreso"));
								ing_amp1=ing_amp1+total_amp;
								salidas=Integer.parseInt(rset.getString("salidas"));*/
							  
							 
							// out.print("Cajas Inv: "+rset.getString("cajas")+" ingreso:"+ing_amp1+" salidas:"+salidas+" id:"+id+"<br>");	 

							
	// rutina para saber si la clave es de ampuleo
					 //clave_amp=0;abasto=0;pres_amp=0;total_amp=0;cajas_1=0;ing_amp1=0;salidas=0;existencias_amp=0;
				     
					 rset_2=stmt_2.executeQuery("select clave, cant from pasti_ampu where clave='"+reader.get(0)+"'");
						while (rset_2.next()) 
            			 {// inicio de while
						    cajas_1=Integer.parseInt(rset.getString("cajas"));
							ing_amp1=Integer.parseInt(rset.getString("ingreso"));
							salidas=Integer.parseInt(rset.getString("salidas"));
						 	//out.print("La clave: "+reader.get(0)+" Existe en pasti_ampu"+"<br>");
							abasto=Integer.parseInt(reader.get(4));
							pres_amp=Integer.parseInt(rset_2.getString("cant"));	
							total_amp=abasto*pres_amp;
							//out.print("abasto: "+abasto+" cant_amp: "+pres_amp+"total: "+total_amp+"<br>");	
							
		// Se ingresan los datos para la tabla de entradas
					stmt.execute("insert into movimientos_entradas values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+reader.get(5)+"','A','"+fecha_ins+"','"+hora_com+"','2')"); 
		// fin de ingreso a entradas ---------------------
		
		// update para inventario_uni
		ing_amp1=ing_amp1+total_amp;
		cajas_1=cajas_1+abasto;
		existencias_amp=ing_amp1-salidas;
			
		//cajas_1=Integer.parseInt(rset.getString("cajas"));
		/*cajas_1=cajas_1+abasto;
		ing_amp1=Integer.parseInt(rset.getString("ingreso"));
		ing_amp1=ing_amp1+total_amp;
		salidas=Integer.parseInt(rset.getString("salidas"));
		//existencias = ingresos - salidas
        existencias_amp=ing_amp1-salidas;	*/
		
		//out.print("Cajas: "+cajas_1+" ingreso:"+ing_amp1+" salidas:"+salidas+" exis:"+existencias_amp+"<br>");	
				 
					stmt.execute("update inventario_uni set cajas='"+cajas_1+"', existencias='"+existencias_amp+"', ingreso='"+ing_amp1+"' where id='"+id+"'");
		// fin de update ------------			 
							
						   clave_amp=1; 
						   break;
						 }// fin del while que recorre pasti_ampu
// fin checar clave es de ampuleo -------------------------------------------

					if(clave_amp==0){
						//out.print("La clave: "+reader.get(0)+" NO Existe en pasti_ampu, pero SI en el Inventario"+"<br>");
						abasto=Integer.parseInt(reader.get(4));
						
						// para obtener la presentación
						rset_3=stmt_3.executeQuery("select clave, cant from pasti_ampu where clave='"+reader.get(0)+"'");
						while (rset_3.next()) 
            			 {// inicio de while
						    //out.print("La clave que NO está en el inv: "+reader.get(0)+" Existe en pasti_ampu"+"<br>");
							
							pres_amp=Integer.parseInt(rset_3.getString("cant"));
						 }
						// fin presentación------------
						
						
						pres_amp=1;	
						total_amp=abasto*pres_amp;	
						 
				// proceso para obtener los totales de inventario_uni
					 //cajas_1=cajas_1+abasto;// para total de cajas
					 var_ingreso=ingreso_inv+abasto;
					 existencias_amp=var_ingreso-salidas;
				// fin proceso --------------------------------------
										 
					// Se ingresan los datos para la tabla de entradas
					 stmt.execute("insert into movimientos_entradas values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+abasto+"','"+reader.get(5)+"','NA','"+fecha_ins+"','"+hora_com+"','2')"); 
					 // fin de ingreso a entradas ---------------------
					  
					// update para inventario_uni	
		/*cajas_1=Integer.parseInt(rset.getString("cajas"));
		cajas_1=cajas_1+abasto;
		ing_amp1=Integer.parseInt(rset.getString("ingreso"));
		ing_amp1=ing_amp1+total_amp;
		salidas=Integer.parseInt(rset.getString("salidas"));*/
		//existencias = ingresos - salidas
        //existencias_amp=ing_amp1-salidas;
		
		//out.print("Cajass: "+cajas_1+" ingreso:"+ing_amp1+" salidas:"+salidas+" exis:"+existencias_amp+"<br>");	
						 
					 //stmt.execute("update inventario_uni set cajas='"+cajas_1+"',existencias='"+existencias_amp+"', ingreso='"+ing_amp1+"' where id='"+rset.getString("id")+"'");
		// fin de update ------------	
		             stmt.execute("update inventario_uni set cajas='"+cajas_1+"', existencias='"+existencias_amp+"', ingreso='"+var_ingreso+"' where id='"+id+"'");
		            
					}// fin del if clave_amp
					existe=1;
					break;
								
				}// fin del if si coincide clave, lote, caducidad y origen
	     
	}// fin del while que recorre las claves del inventario
			//if cuando es una clave que no existe en el inventario, la ingresa en la tabla de inventarios y entradas
						if(existe==0)
						 {
							 //out.print("INGRESOssssss"+no_existe+"<br>");
							
						abasto=Integer.parseInt(reader.get(4));
						
						rset_3=stmt_3.executeQuery("select clave, cant from pasti_ampu where clave='"+reader.get(0)+"'");
						while (rset_3.next()) 
            			 {// inicio de while
						    //out.print("La clave: "+reader.get(0)+" Existe en pasti_ampu"+"<br>");
							pres_amp=Integer.parseInt(rset_3.getString("cant"));
							para_amp=1;
							break;
						 }
						 if(para_amp==0)
						     {pres_amp=1;}
						
						// rutina para	
						total_amp=abasto*pres_amp;	 
						//out.print("La clave: "+reader.get(0)+" NO Existe en pasti_ampu"+"<br>");
					 
					 
					// Se ingresan los datos para la tabla de entradas
					 stmt.execute("insert into movimientos_entradas values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+reader.get(5)+"','NA','"+fecha_ins+"','"+hora_com+"','2')"); 
					 // fin de ingreso a entradas ---------------------
				//out.print("Cajas: "+abasto+" ingreso:"+pres_amp+" salidas:"+salidas+" exis:"+total_amp+"<br>");	  
					 // Se ingresan los datos para la tabla de inventario
					  stmt.execute("insert into inventario_uni values ('"+reader.get(0)+"','"+reader.get(1)+"','"+reader.get(2)+"','"+reader.get(3)+"','"+abasto+"','"+pres_amp+"','"+total_amp+"','"+total_amp+"','0','"+reader.get(5)+"','NA','2','"+fecha_ins+"','"+hora_com+"',0)");
					 // fin de tabla inventario -------------------------
					
								 
						 }
					para_amp=0;
		   	 	 
			 }// while del reader
			 out.print("Se realizó con ÉXITO la carga del ABASTO");
		  }// fin del else
		  if (inv_ini==1&&ban_blancos==1)
		  {
		  	//out.print("Bandera blancos <br>"+ ban_blancos);
		  	out.print("El archivo esta dañado, favor de ingresar los valores manualmente. <br>");
		  }
	//	} catch (Exception ex){mensaje=ex.toString();}

	if (ban_blancos==0){	
stmt.execute("insert into receta_carga_archivos values ('"+ruta+"','"+date+"')");
	   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: CARGA DE ABASTOS ::</title>
</head>

<body>
<br />
<a href="index.jsp">Regresar a Men&uacute;</a>csv<%//=mensaje%>

</body>
<%
// ----- try que cierra la conexión a la base de datos
		 try{
               // Se cierra la conexión dentro del try
                 conexion.close();
	          }catch (Exception e){mensaje=e.toString();}
           finally{ 
               if (conexion!=null){
                   conexion.close();
		                if(conexion.isClosed()){
                             mensaje="desconectado2";}
                 }
             }
			 //out.print(mensaje);
		// ---- fin de la conexión	 	  

%>

</html>