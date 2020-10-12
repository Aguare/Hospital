<%-- 
    Document   : ListaPacientes
    Created on : 11/10/2020, 20:38:13
    Author     : aguare
--%>

<%@page import="Entidades.Paciente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SQL.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../CSS/EstiloListas.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }%>
        <% Usuario sesion = (Usuario) request.getSession().getAttribute("user");%>
        <% if (sesion.getTipoUsuario().equalsIgnoreCase("Administrador")) {%>
        <%@include file="../Usuario/MAdmin.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%} else {%>
        <%@include file="../Usuario/MMedico.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%}%>
        <h1>PACIENTES REGISTRADOS</h1>
        <%Consultas consulta = new Consultas();
            ArrayList<Paciente> pacientes = consulta.obtenerPacientes();%>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>CÓDIGO</th>
                        <th>NOMBRE</th>
                        <th>SEXO</th>
                        <th>FECHA NACIMIENTO</th>
                        <th>DPI</th>
                        <th>TELEFONO</th>
                        <th>PESO(Kg)</th>
                        <th>TIPO SANGRE</th>
                        <th>CORREO</th>
                        <th>OPCIONES</th>
                    </tr>
                </thead>

                <% for (Paciente pas : pacientes) {%>
                <tr>
                    <td><%=pas.getCodigo()%></td>
                    <td><%=pas.getNombre()%></td>
                    <td><%=pas.getSexo()%></td>
                    <td><%=pas.getFechaNacimiento()%></td>
                    <td><%=pas.getDPI()%></td>
                    <td><%=pas.getTelefono()%></td>
                    <td><%=pas.getPeso()%></td>
                    <td><%=pas.getTipoSangre()%></td>
                    <td><%=pas.getCorreo()%></td>
                    <%if (sesion.getTipoUsuario().equalsIgnoreCase("Administrador")) {%>
                    <td><a href="../Reportes/HistorialMedico.jsp?paciente=<%=pas.getCodigo()%>" class="editar">Ver Historial</a>
                        <a href="../Ingreso/EditarPaciente.jsp?paciente=<%=pas.getCodigo()%>" class="editar">Editar</a>
                    </td><%} else {%>
                    <td><a href="../Reportes/HistorialMedico.jsp?paciente=<%=pas.getCodigo()%>" class="editar">Ver Historial</a>
                        <%}%>
                </tr>   
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
