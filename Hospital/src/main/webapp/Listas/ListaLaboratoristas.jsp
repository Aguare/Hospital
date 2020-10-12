<%-- 
    Document   : ListaLaboratoristas
    Created on : 11/10/2020, 17:58:29
    Author     : aguare
--%>

<%@page import="Entidades.Usuario"%>
<%@page import="Entidades.Laboratorista"%>
<%@page import="SQL.Obtener"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../CSS/EstiloListas.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratoristas</title>
    </head>
    <body>
        <% Usuario sesion = (Usuario) request.getSession().getAttribute("user");%>
        <% if (sesion.getTipoUsuario().equalsIgnoreCase("Administrador")) {%>
        <%@include file="../Usuario/MAdmin.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%} else {%>
        <%@include file="../Usuario/MPaciente.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <%}%>
        <h1>LABORATORISTAS REGISTRADOS</h1>
        <%  Obtener obtener = new Obtener();
            ArrayList<Laboratorista> laboratoristas = obtener.obtenerLaboratoristasLista();%>

        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>CÓDIGO</th>
                        <th>NOMBRE</th>
                        <th>NO. REGISTRO</th>
                        <th>DPI</th>
                        <th>TELEFONO</th>
                        <th>CORREO</th>
                        <th>DIAS TRABAJO</th>
                        <th>INICIO LABORAL</th>
                        <th>EXAMEN REALIZA</th>
                        <th>OPCIONES</th>
                    </tr>
                </thead>

                <% for (Laboratorista lab : laboratoristas) {%>
                <tr>
                    <td><%=lab.getCodigo()%></td>
                    <td><%=lab.getNombre()%></td>
                    <td><%=lab.getNoRegistro()%></td>
                    <td><%=lab.getDPI()%></td>
                    <td><%=lab.getTelefono()%></td>
                    <td><%=lab.getCorreo()%></td>
                    <td><%=lab.getDiasTrabajo()%></td>
                    <td><%=lab.getFechaInicio()%></td>
                    <td><%=lab.getExamen().getNombre()%></td>
                    <td><a href="#" class="editar">Editar</a></td>
                </tr>   
                <%}%>
            </table>
        </div>

    </body>
</html>
