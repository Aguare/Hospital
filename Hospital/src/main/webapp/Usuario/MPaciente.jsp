<%-- 
    Document   : Menu
    Created on : 6/10/2020, 23:53:46
    Author     : aguare
--%>

<%@page import="Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/EstiloMenu.css" rel="stylesheet" type="text/css">
        <title>Hospital Guatemala</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }%>
        <%if (request.getSession().getAttribute("user") != null) {
                Usuario user = (Usuario) request.getSession().getAttribute("user");
        %>                  
        <input type="checkbox" id="btn-menu">
        <nav class="menu">
            <ul>
                <li><a href="<%=request.getContextPath()%>/Usuario/MPaciente.jsp">Inicio</a></li>
                <li><a href="#">Agendar</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaMedicos.jsp">Agendar cita médica</a></li>
                        <li><a href="#">Agendar exámen de Laboratorio</a></li>
                    </ul>
                </li>
                <li><a href="#">Informes</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Reportes/HistorialMedico.jsp">Ver Historial</a></li>
                        <li><a href="#">Últimos 5 exámenes</a></li>
                        <li><a href="#">Últimas 5 consultas</a></li>                         
                    </ul>
                </li>
                <li><a href="#">Paciente: <%=user.getNombre()%></a>
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