<%-- 
    Document   : ListaMedicos
    Created on : 11/10/2020, 03:13:32
    Author     : aguare
--%>

<%@page import="Entidades.Usuario"%>
<%@page import="Entidades.Medico"%>
<%@page import="SQL.Consultas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../CSS/EstiloListas.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Médicos</title>
    </head>
    <body>
        <%@include file="../Usuario/MAdmin.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%Usuario user = (Usuario) request.getSession().getAttribute("user");%>
        <h1>MÉDICOS REGISTRADOS</h1>
        <%Consultas consulta = new Consultas();
            ArrayList<Medico> medicos = consulta.obtenerMedicos();%>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>CÓDIGO</th>
                        <th>NOMBRE</th>
                        <th>NO. COLEGIADO</th>
                        <th>DPI</th>
                            <%if (user != null && user.getTipoUsuario().equalsIgnoreCase("Administrador")) {%>
                        <th>TELEFONO</th>
                        <th>INICIO LABORAL</th>
                            <%}%>
                        <th>CORREO</th>
                        <th>HORA INGRESO</th>
                        <th>HORA SALIDA</th>
                        <th>OPCIONES</th>
                    </tr>
                </thead>

                <% for (Medico medico : medicos) {%>
                <tr>
                    <td><%=medico.getCodigo()%></td>
                    <td><%=medico.getNombre()%></td>
                    <td><%=medico.getNoColegiado()%></td>
                    <td><%=medico.getDPI()%></td>
                    <%if (user != null && user.getTipoUsuario().equalsIgnoreCase("Administrador")) {%>
                    <td><%=medico.getTelefono()%></td>
                    <td><%=medico.getFechaInicio()%></td>
                    <%}%>
                    <td><%=medico.getCorreo()%></td>
                    <td><%=medico.getHoraInicio()%></td>
                    <td><%=medico.getHoraFinal()%></td>
                    <td><a class="editar">Editar   </a><a class="eliminar">Eliminar</a></td>


                </tr>   
                <%}
                %>

            </table>
        </div>
    </body>
</html>
