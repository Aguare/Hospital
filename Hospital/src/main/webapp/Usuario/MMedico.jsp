<%-- 
    Document   : MMedico
    Created on : 10/10/2020, 19:22:12
    Author     : aguare
--%>

<%@page import="Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/EstiloMenu.css" rel="stylesheet" type="text/css">
        <title>Médico</title>
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
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Listas</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaPacientes.jsp">Pacientes</a></li>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaExamenes.jsp">Exámenes</a></li>
                    </ul>
                </li>
                <li><a href="#">Informes</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Reportes/CitasdelDia.jsp">Citas del día</a></li>
                        <li><a href="#">Citas en cierto tiempo</a></li>
                        <li><a href="#">Pacientes con más Informes</a></li>                         
                    </ul>
                </li>
                <li><a href="#">Médico: <%=user.getNombre()%></a>
                    <ul>
                        <li><a href="../Logout">Cerrar Sesión</a></li>  

                    </ul>
                </li>
            </ul>
        </nav> 
        <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <%}%>
    </body>
</html>
