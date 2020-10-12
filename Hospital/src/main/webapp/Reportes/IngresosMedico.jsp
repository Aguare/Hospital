<%-- 
    Document   : IngresosMedico
    Created on : 11/10/2020, 23:01:33
    Author     : aguare
--%>

<%@page import="Entidades.Medico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SQL.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../CSS/EstiloListas.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informe</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {%>
        <% Usuario usuario = (Usuario) request.getSession().getAttribute("user");
            if (usuario.getTipoUsuario().equalsIgnoreCase("Administrador")) {%>
        <%@include file="../Usuario/MAdmin.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <% %>
        <%Consultas consulta = new Consultas();
            ArrayList<Medico> medicos = consulta.obtenerMedicos();%>
        <br>
    <center>
        <h1>INGRESOS POR MÉDICO EN UN INTERVALO DE TIEMPO</h1>
        <div class="busqueda">
            <label>Seleccione al médico:</label>
            <select name="codMedico" class="busqueda">
                <option>Seleccione el Médico</option>
                <%for (Medico med : medicos) {%>
                <option><%=med.getCodigo() + ", " + med.getNombre()%></option>
                <%}%>
            </select>
            <label>Fecha Inicio:</label>
            <input type="date" name="fechaInicio" required>
            <label>Fecha Final:</label>
            <input type="date" name="fechaFinal" required>
                <button>REALIZAR CONSULTA</button>
        </div>
    </center>
    
    <%}}%>
</body>
</html>
