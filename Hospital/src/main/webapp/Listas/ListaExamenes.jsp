<%-- 
    Document   : ListaExamenes
    Created on : 11/10/2020, 21:45:29
    Author     : aguare
--%>

<%@page import="Entidades.Examen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Usuario"%>
<%@page import="SQL.Consultas"%>
<%@page import="Entidades.Usuario"%>
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
        <h1>EXÁMENES DE LABORATORIO</h1>
        <%Consultas consulta = new Consultas();
            ArrayList<Examen> examenes = consulta.obtenerExamenes();%>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>CÓDIGO</th>
                        <th>NOMBRE</th>
                        <th>REQUIERE ORDEN</th>
                        <th>DESCRIPCION</th>
                        <th>FORMATO</th>
                        <th>COSTO</th>
                            <%if (sesion.getTipoUsuario().equals("Administrador")) {%>
                        <th>OPCIONES</th>
                            <%}%>
                    </tr>
                </thead>

                <% for (Examen pas : examenes) {%>
                <tr>
                    <td><%=pas.getCodigo()%></td>
                    <td><%=pas.getNombre()%></td>
                    <%if (pas.getRequiereOrden().equalsIgnoreCase("verdadero")) {%>
                    <td>SI</td>
                    <%} else { %>
                    <td>NO</td>
                    <%}%>
                    <td><%=pas.getDescripcion()%></td>
                    <td><%=pas.getFormato()%></td>
                    <td>Q.<%=pas.getCosto()%></td>
                    <%if (sesion.getTipoUsuario().equals("Administrador")) {%>
                    <td><a href="#" class="editar">Editar</a>
                        <%}%>
                </tr>   
                <%}%>
            </table>
        </div>
    </body>
</html>