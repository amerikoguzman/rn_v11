<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*"
         import="java.lang.*" import="java.util.*" import="javax.swing.*" import="java.io.*"
         import="java.text.DateFormat"
         import="java.text.ParseException" import="java.text.DecimalFormat" import="java.text.SimpleDateFormat"
         import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/r_nayarit", "root", "eve9397");
    // add 1 to month because Calendar's months start at 0, not 1
%>
<%

    //declaracion de variables-------------------------------------------------------------------------------------------------------------------
    String but = "";
    String fecha1 = "", fecha2 = "", mensaje = "";
//-------------------------------------------------------------------------------------------------------------------------------------------

    Statement stmt = null;
    ResultSet rset = null;
    stmt = conn.createStatement();

    Statement stmt2 = null;
    ResultSet rset2 = null;
    stmt2 = conn.createStatement();


    Calendar calendar = Calendar.getInstance();
//out.println("Fecha Actual: " + calendar.getTime());
    calendar.add(Calendar.MONTH, -1);
//out.println("Fecha antigua: " + df.format(calendar.getTime()));
    String fecha_act = "" + df.format(calendar.getTime());
    String d = "0";
    int dias = 0;


    try {
        but = "" + request.getParameter("Submit");
    } catch (Exception e) {
        System.out.print("not");
    }

    //out.print(but);
    if (but.equals("Dias")) {


        try {
            d = request.getParameter("dia");
        } catch (Exception e) {
            System.out.print("not");
        }
        if (d.equals("")) {
            d = "0";
        }
        //out.print(d);
        dias = Integer.parseInt(d);

    }
%>
<html>
<head>
    <script language="javascript" src="scw.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <style type="text/css">
        body {
            background-color: #F5F5F5;
        }
    </style>
    <style type="text/css">
        <!--
        .style1 {
            font-size: 12px
        }

        body {
            background-image: url();
            background-color: #F5F5F5;
        }

        .style2 {
            font-family: Arial, Helvetica, sans-serif
        }

        a:link {
            color: #000000;
        }

        a:visited {
            color: #990000;
        }

        a:hover {
            color: #0000FF;
        }

        .style5 {
            font-size: 36px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
        }

        .style6 {
            font-size: 18px
        }

        .style7 {
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .style9 {
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #990000;
            font-weight: bold;
        }

        .style10 {
            color: #EF6703
        }

        .style11 {
            color: #EF6703;
            font-weight: bold;
        }

        .style13 {
            color: #000000
        }

        -->
    </style>
    <title>Reporte de Reabastecimiento</title>
</head>
<body>
<div>
    <table border="1" align="center" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
        <tr>
            <td><img src="imagenes/nay_ima1.jpg" width="142" height="72"/>
            </td>
            <td><h1>Reporte de Reabastecimiento</h1>
            </td>
            <td><img src="imagenes/ssn.jpg" width="162" height="78"/>
            </td>
        </tr>
    </table>


</div>
<div style="width:1000px; background-color:#FFF; padding:20px; margin:auto; font-family:Verdana, Geneva, sans-serif; font-size:10px">
    <a href="index.jsp" class="style1">Regresar</a>
</div>

<div style="width:1000px; background-color:#FFF; padding:20px; margin:auto; font-family:Verdana, Geneva, sans-serif; font-size:10px">
    <form method="post" style="text-align:center">
        <h3>D&iacute;as para su pr&oacute;ximo abasto:
            <input type="text" size="5" name="dia" id="dia" value="<%=d%>"/> <input type="submit" name="Submit"
                                                                                    value="Dias"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                    href="gnr_reabast.jsp?dias=<%=dias%>" target="_blank"><img src="imagenes/exc.jpg" width="60px"
                                                                               height="50px"/></a>&nbsp;</h3>
    </form>
    <table style="text-align:center" width="900px" align="center" border="1">
        <tr>
            <td><Strong>Clave</Strong></td>
            <td><Strong>Descripcion</Strong></td>
            <td><Strong>Mensual</Strong></td>
            <td><Strong>Semanal</Strong></td>
            <td><Strong>Abasto<br/>
                c/3 d&iacute;as</Strong></td>
            <td><Strong>Exist.<br/>Inventario</Strong></td>
            <td><Strong>Sobreabasto</Strong></td>
            <td><Strong>Reabastecer</Strong></td>
        </tr>

        <%
            String clave_rf = "", descrip_rf = "", cant_rf = "0", cant_rc = "0", cant_inv = "0";

            String qry_clave = "select clave, descrip from clave_med group by clave order by cast(clave as signed)";
            //out.print(qry_clave);

            rset = stmt.executeQuery(qry_clave);
            while (rset.next()) {
                clave_rf = rset.getString("clave");
                descrip_rf = rset.getString("descrip");

                String qry_rf = "select sum(cant_sol) from receta where fecha_re>='" + fecha_act + "' and clave='" + clave_rf + "' group by clave";
                //out.print(qry_rf+"<br>");
                rset2 = stmt2.executeQuery(qry_rf);
                while (rset2.next()) {
                    cant_rf = rset2.getString(1);
                    if (cant_rf.equals("")) {
                        cant_rf = "0";
                    }

                }

                String qry_rc = "select sum(cant_sol) from receta_colectiva where fecha_re>='" + fecha_act + "' and clave='" + clave_rf + "' group by clave";
                rset2 = stmt2.executeQuery(qry_rc);
                while (rset2.next()) {
                    cant_rc = rset2.getString(1);
                    if (cant_rc.equals("")) {
                        cant_rc = "0";
                    }
                }

                String qry_inv = "select sum(existencias) from inventario_uni where clave='" + clave_rf + "' group by clave";
                rset2 = stmt2.executeQuery(qry_inv);
                while (rset2.next()) {
                    cant_inv = rset2.getString(1);
                    if (cant_rc.equals("")) {
                        cant_rc = "0";
                    }
                }

                float cant_total = (Float.parseFloat(cant_rf)) + (Float.parseFloat(cant_rc));
                if (cant_total > 0) {
                    float con_diario = (cant_total / 30);
                    float cons_dia = con_diario;
                    double dia_abasto2 = Math.ceil(cons_dia * dias);
                    int dia_abasto = (int) (dia_abasto2);
                    float cant_quincenal = (float) (Math.ceil(cant_total / 4));
                    float cant_semana = (float) (Math.ceil(cant_quincenal / 2));
                    float sobre = 0;
                    int exist_fut = (Integer.parseInt(cant_rc)) - dia_abasto;
                    float cant_re = (cant_quincenal) - ((int) (exist_fut));
                    if (cant_re <= 0) {
                        sobre = (cant_re) * -1;
                        cant_re = 0;
                    }
                    float x = 3;
                    float y = 30;
                    float min_con = (x / y);
                    //out.print(qry_rf+"<br>");
                    //cant_rf=rset.getString("sum(cant_sol)");
                    //out.print(clave_rf + " " + cant_rf+"<br>");

                    int total_t = (int) (cant_re);

                    if (exist_fut <= 0) {
                        total_t = (int) cant_quincenal;
                    }
                    if (exist_fut > (int) (cant_quincenal)) {//Sobreabasto
                        total_t = 0;
                    }
                    if (con_diario <= min_con) {
                        total_t = 1;
                    }
        %>
        <tr <%
            if (cant_total == 0) {
                out.print("style='visibility:hidden'");
            }
        %>>
            <td><%=clave_rf%>
            </td>
            <td><%=descrip_rf%><%//=(con_diario+"---"+cons_dia+"---"+dia_abasto+"---"+exist_fut)%></td>
            <td><%=(int) cant_total%>
            </td>
            <td><%=(int) cant_quincenal%>
            </td>
            <td><%=(int) cant_semana%>
            </td>
            <td><%=cant_rc%>
            </td>
            <td
            <%
                if ((int) sobre != 0) {
                    out.print("style='color:#FFF; background-color:#F00;'");
                }
            %>"><%=(int)sobre%></td>
            <td><strong><%=total_t%>
            </strong></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <p>&nbsp;</p>
</div>

</body>
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
