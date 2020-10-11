<%-- 
    Document   : MenuAdmin
    Created on : 10/10/2020, 18:49:33
    Author     : aguare
--%>

<%@page import="Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/EstiloMenu.css" rel="stylesheet" type="text/css">
        <title>Administrador</title>

    </head>
    <body>
        <%if (request.getSession().getAttribute("user") != null) {
                Usuario user = (Usuario) request.getSession().getAttribute("user");
        %>                  
        <input type="checkbox" id="btn-menu">
        <nav class="menu">
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Nuevo Registro</a>
                    <ul>
                        <li><a href="#">Paciente</a></li>
                        <li><a href="#">Médico</a></li>
                        <li><a href="#">Laboratorista</a></li>
                        <li><a href="#">Exámene</a></li>
                        <li><a href="#">Consulta</a></li>
                    </ul>
                </li>
                <li><a href="#">Listados</a>
                    <ul>
                        <li><a href="#">Pacientes</a></li>
                        <li><a href="../Listas/ListaMedicos.jsp">Médicos</a></li>
                        <li><a href="#">Laboratoristas</a></li>
                        <li><a href="#">Exámenes</a></li>
                        <li><a href="#">Consultas</a></li>
                    </ul>
                </li>
                <li><a href="#">Reportes</a>
                    <ul>
                        <li><a href="#">10 Médicos con más informes</a></li>
                        <li><a href="#">Ingresos por médico</a></li>
                        <li><a href="#">5 Médicos con menos citas</a></li>
                        <li><a href="#">Exámenes más demandados</a></li>
                        <li><a href="#">Ingresos por Paciente</a></li>
                        <li><a href="#">Médicos con más ordenes</a></li>
                    </ul>
                </li>
                <li><a href="#">Admin: <%=user.getNombre()%></a>
                    <ul>
                        <li><a href="#">Editar información</a></li>
                        <li><a href="../Logout">Cerrar Sesión</a></li>  

                    </ul>
                </li>
            </ul>
        </nav> 
        <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <%}%>
    </body>
</html>
