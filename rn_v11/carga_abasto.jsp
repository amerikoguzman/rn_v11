<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*"
         import="java.io.*" import="javax.swing.filechooser.FileSystemView" import="javax.swing.*"
         import="com.csvreader.CsvReader" errorPage="" session="true" %>
<%
    HttpSession sesion = request.getSession();
    String val = "", user = "", id = "", lote_new = "";
    if (sesion.getAttribute("valida") != null) {
        val = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("usuario");
        id = (String) sesion.getAttribute("id");
    }
    if (!val.equals("valida")) {

%>
<script>self.location = 'index.jsp';</script>
<%
    }
//out.print (val+user+id);
%>
<%
    /* -----------------------------------------------------------------------------------------------------
            Nombre:carga_abasto.jsp
            Descripción: Escoge una archivo que se encuentra en una ruta determinada y manda como parámetro la
                         cadena de la ruta hacia el archivo csv_abasto.jsp

       ----------------------------------------------------------------------------------------------------- */
//objeto de la Clase Connection, nos sirve para hacer la conexión a la base correspondiente
    Connection conexion = null;
    Statement stmt = null;
    ResultSet rset = null;

// Variables de entorno
    String mensaje = "";
	 
/*parametros para la conexión*/
    String driver = "org.gjt.mm.mysql.Driver";
    String url = "jdbc:mysql://localhost:3306/r_nayarit";
    String usuario = "root";
    String clave2 = "eve9397";
    
  /*procedimiento de la conexion*/
    try {
        Class.forName(driver);
        conexion = DriverManager.getConnection(url, usuario, clave2);

         /*guardando la conexion en la session*/

        session.setAttribute("conexion", conexion);
        stmt = conexion.createStatement();
        mensaje = "conectado";
    } catch (Exception ex) {
        mensaje = ex.toString();
    }

    if (conexion.isClosed()) {
        mensaje = "desconectado";
    }


// Se obtiene la fecha ---------------------------------------------------------------------------------   
    java.util.Calendar currDate = new java.util.GregorianCalendar();
    // add 1 to month because Calendar's months start at 0, not 1
    int month = currDate.get(currDate.MONTH) + 1;
    int day = currDate.get(currDate.DAY_OF_MONTH);
    int year = currDate.get(currDate.YEAR);
    String date = "";
    String res = "";
    if (month >= 1 && month <= 9) {
        res = "0" + month;
// month=Integer.parseInt(res);
        date = " " + day;
        date = date + "/" + res;
        date = date + "/" + year;

        //out.print(""+res);
    } else {
        date = " " + day;
        date = date + "/" + month;
        date = date + "/" + year;
        res += month;
    }
// fin fecha --------------------------------------------------------------------------------------------   

    String ruta_split[];
    String usuario_jv = "", folio = "", folio_gnk = "", uni_rec = "", id_med = "", pac_name = "", id_paci = "", nom_comp = "";
    int flag = 0;
    try {
        usuario_jv = request.getParameter("usuario");
        //flag=Integer.parseInt(request.getParameter("ban"));
        //folio_gnk=request.getParameter("txtf_id1");
        //uni_rec=request.getParameter("unis");
        //id_med=request.getParameter("id_med");
        //out.print("value 1"+id_med);
                  /* if(flag==1)
                      {folio_gnk=request.getParameter("txtf_id1");out.print("value"+folio_gnk);}*/
    } catch (Exception e) {
        System.out.print("not");
    }

    File[] roots = File.listRoots();

    String[] unidades = new String[10];
    String unid = "", uni = "", uni_send = "";
    String but = "r";
    int existe_abasto = 0;

/*for (int i=0; i<roots.length; i++) {
  unidades[i]=roots[i];
  out.print(roots[i]);
}
*/
    int pos = 0;
    for (File root : File.listRoots()) {
        unid = root.getAbsolutePath();
        unid = unid.replace('\\', '/');
        unidades[pos] = unid;
        //out.print(""+root.getAbsolutePath());
        pos++;
    }
//String unid="E:\\";
    //unid = unid.replace('\\','/');
    //out.print(unid);
//se obtiene el value de button, según sea el caso del botón oprimido
    try {
        but = "" + request.getParameter("Submit");
    } catch (Exception e) {
        System.out.print("not");
    }
// ------------------------------------------------------------------
    String ruta = "", car = "\\";
    if (but.equals("CARGAR ABASTO")) {

        ruta = request.getParameter("datasize");
        ruta = ruta.replace('\\', '/');
        //Obtener el nombre del archivo------------------------------------------------------------------

        int largo_ruta = 0;
        String token = "";//out.print(ruta);
        StringTokenizer ruta_token = new StringTokenizer(ruta, "/");
        //out.print(ruta_token.lenght);
        while (ruta_token.hasMoreTokens()) {
            largo_ruta++;
            token = ruta_token.nextToken();
        }


        //------------------------------------------------------------------
        rset = stmt.executeQuery("select * from receta_carga_archivos where archivo='" + token + "'");
        while (rset.next()) {
            existe_abasto = 1;
            break;
        }
        if (existe_abasto == 1) {
%>
<script>
    alert("El archivo ya ha sido CARGADO EN EL INVENTARIO, intente con un archivo válido");
</script>
<%
} else {
%>
<script>
    //alert("PASO No. 2: Ingrese el ID del Paciente o Lea el Codigo de Barras del Paciente");
    window.opener = top;
    self.location = 'csv_abasto.jsp?archivo=<%=ruta%>&token=<%=token%>&usuario=<%=usuario_jv%>';
</script>
<%
        }
//out.print("Ingreso al proceso de carga"+ruta); 
    }


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <title>:: ESCOGER RUTA DEL ARCHIVO ::</title>
    <script language="javascript" src="code_jsn.js"></script>
    <style type="text/css">
        <!--
        .style1 {
            color: #990000;
            font-weight: bold;
        }

        -->
    </style>
</head>

<body>
<form action="carga_abasto.jsp?usuario=<%=usuario_jv%>" method="post" name="form">

    <center>
        <br/>

        <table width="863" border="0">
            <tr>
                <th colspan="4" scope="row" align="left">
                    <hr/>
                    <a href="index.jsp" title="Haga clic para Regresar a Menu" accesskey="q">Regresar a Men&uacute;</a>
                </th>
            </tr>
            <tr>
                <th colspan="4" scope="row">
                    <hr/>
                </th>
            </tr>
            <tr>
                <th width="141" scope="col"><img src="imagenes/usb2.jpg" width="82" height="67"/></th>
                <th colspan="2" scope="col"><span class="style1">CARGAR ARCHIVO CON EL ABASTO DE LA UNIDAD</span><br/>
                    <br/>
                    ESCOJA LA RUTA DONDE SE ENCUENTRE EL ARCHIVO
                </th>
                <th width="120" scope="col"><a href="existencias.jsp" target="_blank">Ver Existencias</a></th>
            </tr>
            <tr>
                <th colspan="4" scope="row">
                    <hr/>
                </th>
            </tr>
            <tr>
                <th scope="row">&nbsp;</th>
                <th colspan="2" scope="row">&nbsp; </th>
                <th scope="row">&nbsp;</th>
            </tr>

            <tr>
                <th scope="row">&nbsp;</th>
                <td width="179">Seleccione Archivo:</td>
                <td width="405" align="left"><input type="file" name="datasize" id="datasize" size="30"></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <th scope="row">&nbsp;</th>
                <th colspan="2" scope="row"></td>
                    <td>&nbsp;</td>
            </tr>
            <tr>
                <th colspan="4" scope="row">
                    <hr/>
                </th>
            </tr>
            <tr>
                <th scope="row">&nbsp;</th>
                <th colspan="2" scope="row">&nbsp;</th>
                <td></td>
            </tr>
            <tr>
                <th scope="row">&nbsp;</th>
                <th colspan="2" scope="row"><input name="Submit" type="submit" value="CARGAR ABASTO"/></th>

                <td>&nbsp;</td>
            </tr>
            <tr>
                <th colspan="4" scope="row">
                    <hr/>
                </th>
            </tr>
            <tr>
                <th colspan="4" scope="row"><img src="imagenes/nay_ima1.jpg" width="277" height="85"/>
                    <hr/>
                </th>
            </tr>
        </table>
    </center>
</form>
<%
    // ----- try que cierra la conexión a la base de datos
    try {
        // Se cierra la conexión dentro del try
        conexion.close();
    } catch (Exception e) {
        mensaje = e.toString();
    } finally {
        if (conexion != null) {
            conexion.close();
            if (conexion.isClosed()) {
                mensaje = "desconectado2";
            }
        }
    }
    //out.print(mensaje);
    // ---- fin de la conexión

%>
</body>
</html>
