<%-- 
    Document   : ListaConsultas
    Created on : 11/10/2020, 22:09:22
    Author     : aguare
--%>

<%@page import="Entidades.Especialidad"%>
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
        <%@include file="../Usuario/MAdmin.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <h1>TIPOS DE CONSULTAS</h1>
        <%Consultas consulta = new Consultas();
            ArrayList<Especialidad> especialidades = consulta.obtenerEspecialidadesLista();%>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>ESPECIALIDAD</th>
                        <th>COSTO</th>
                        <th>OPCIONES</th>
                    </tr>
                </thead>

                <% for (Especialidad pas : especialidades) {%>
                <tr>
                    <td><%=pas.getNombre()%></td>
                    <td>Q.<%=pas.getCostoConsulta()%></td>
                    <td><a href="#" class="editar">Editar</a>
                </tr>   
                <%}%>
            </table>
        </div>
    </body>
</html>
