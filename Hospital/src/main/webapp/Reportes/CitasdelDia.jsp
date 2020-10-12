<%-- 
    Document   : CitasdelDia
    Created on : 12/10/2020, 04:55:28
    Author     : aguare
--%>

<%@page import="Entidades.CitaMedica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SQL.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../CSS/EstiloListas.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas del Día</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }%>
        <% Usuario sesion = (Usuario) request.getSession().getAttribute("user");%>
        <% if (sesion.getTipoUsuario().equalsIgnoreCase("Medico")) {%>
        <%@include file="../Usuario/MMedico.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%} else {%>
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        <%}%>
        <h1>CITAS DEL DÍA</h1>
        <%Consultas consulta = new Consultas();
            ArrayList<CitaMedica> pacientes = consulta.obtenerCitasDelDia(sesion.getUsuario());%>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>CÓDIGO</th>
                        <th>FECHA</th>
                        <th>HORA</th>
                        <th>COSTO</th>
                        <th>ESTADO</th>
                        <th>MEDICO</th>
                        <th>PACIENTE</th>
                        <th>OPCIONES</th>
                    </tr>
                </thead>

                <% for (CitaMedica pas : pacientes) {%>
                <tr>
                    <td><%=pas.getCodigo()%></td>
                    <td><%=pas.getFecha()%></td>
                    <td><%=pas.getHora()%></td>
                    <td><%=pas.getCosto()%></td>
                    <% if (pas.getEstaFinalizado().equalsIgnoreCase("VERDADERO")) {%>
                    <td>ATENDIDA</td>
                    <%} else {%>
                    <td>POR REALIZAR</td>
                    <%}%>
                    <td><%=pas.getMedico().getNombre()%></td>
                    <td><%=pas.getPaciente().getNombre()%></td>
                    <td>
                        <a href="../Ingreso/EditarPaciente.jsp?paciente=<%=pas.getCodigo()%>" class="editar">Ver Historial</a>
                        <a href="../Ingreso/EditarPaciente.jsp?paciente=<%=pas.getCodigo()%>" class="editar">Realizar Informe</a>
                    </td>
                </tr>   
                <%
                    }
                %>
            </table>
            <% if (pacientes.size() == 0) {%>
            <h1>NO TIENE CITAS PROGRAMADAS</h1>
            <%}%>
        </div>
    </body>
</html>
