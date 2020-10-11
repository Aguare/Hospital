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
                <li><a href="#">Agendar</a>
                    <ul>
                        <li><a href="">Agendar cita médica</a></li>
                        <li><a href="#">Agendar exámen de Laboratorio</a></li>
                    </ul>
                </li>
                <li><a href="#">Informes</a>
                    <ul>
                        <li><a href="#">Ver Historial</a></li>
                        <li><a href="#">Últimos 5 exámenes</a></li>
                        <li><a href="#">Últimas 5 consultas</a></li>                         
                    </ul>
                </li>
                <li><a href="#">Admin: <%=user.getNombre()%></a>
                    <ul>
                        <li><a href="#">Editar información</a></li>
                        <li><a href="Logout">Cerrar Sesión</a></li>  

                    </ul>
                </li>
            </ul>
        </nav> 
        <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <%}%>
    </body>
</html>
