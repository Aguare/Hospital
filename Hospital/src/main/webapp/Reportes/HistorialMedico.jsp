<%-- 
    Document   : HistorialMedico
    Created on : 12/10/2020, 05:19:12
    Author     : aguare
--%>

<%@page import="Entidades.Paciente"%>
<%@page import="SQL.Obtener"%>
<%@page import="Entidades.CitaMedica"%>
<%@page import="Entidades.CitaExamen"%>
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
        <% Usuario sesion = (Usuario) request.getSession().getAttribute("user");
            String codPaciente = "";
            Obtener obtener = new Obtener();
            Paciente paciente;%>
        <% if (sesion.getTipoUsuario().equalsIgnoreCase("Medico")) {
                codPaciente = request.getParameter("paciente");
                paciente = obtener.obtenerPaciente(codPaciente);%>
        <%@include file="../Usuario/MMedico.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%} else {
            codPaciente = sesion.getUsuario();
            paciente = obtener.obtenerPaciente(codPaciente);%>
        <%@include file="../Usuario/MPaciente.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%}%>
        <h1>HISTORIAL MÉDICO DE: <%=paciente.getNombre()%></h1>
        <%Consultas consulta = new Consultas();
            ArrayList<Object> fila = consulta.obtenerHistorialMedico(codPaciente);%>
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

                <% for (Object pas : fila) {%>
                <% if (pas instanceof CitaExamen) {
                        CitaExamen c = (CitaExamen) pas;
                %>
                <tr>
                    <td><%=c.getCodigo()%></td>
                    <td><%=c.getFecha()%></td>
                    <td><%=c.getHora()%></td>
                    <td><%=c.getCosto()%></td>
                    <% if (c.getEstaFinalizado().equalsIgnoreCase("VERDADERO")) {%>
                    <td>REALIZADO</td>
                    <%} else {%>
                    <td>SIN RESULTADOS</td>
                    <%}%>
                    <% if (c.getMedico() != null) {%>
                    <td><%=c.getMedico().getNombre()%></td>
                    <%} else {%>
                    <td>No requiere</td>
                    <%}%>
                    <td><%=c.getPaciente().getNombre()%></td>
                    <td>
                        <a href="#" class="editar">Ver Exámen</a>
                    </td>
                </tr>   
                <% } else {
                    CitaMedica ci = (CitaMedica) pas;%>
                <tr>
                    <td><%=ci.getCodigo()%></td>
                    <td><%=ci.getFecha()%></td>
                    <td><%=ci.getHora()%></td>
                    <td><%=ci.getCosto()%></td>
                    <% if (ci.getEstaFinalizado().equalsIgnoreCase("VERDADERO")) {%>
                    <td>ATENDIDA</td>
                    <%} else {%>
                    <td>POR REALIZAR</td>
                    <%}%>
                    <td><%=ci.getMedico().getNombre()%></td>
                    <td><%=ci.getPaciente().getNombre()%></td>
                    <td>
                        <a href="#" class="editar">Ver Informe</a>
                    </td>
                </tr> 
                <%}
                    }%>
            </table>
            <% if (fila.size() == 0) {%>
            <h1>NO TIENE NADA PARA MOSTRAR</h1>
            <%}%>
        </div>
    </body>
</html>
