<%-- 
    Document   : Menu
    Created on : 6/10/2020, 23:53:46
    Author     : aguare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/EstiloMenu.css" rel="stylesheet" type="text/css">
        <title>IGSS</title>
    </head>
    <body>
        <header>
            <% String nombrePaciente = request.getParameter("nombrePaciente");
                if (!nombrePaciente.equals("")) {%>                  
            <input type="checkbox" id="btn-menu">
            <label for="btn-menu"><img src="../Imagenes/menu.png" alt=""></label>
            <nav class="menu">
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Agendar</a>
                        <ul>
                            <li><a href="MenuPaciente.jsp?nombrePaciente=<%=nombrePaciente%>">Agendar cita médica</a></li>
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
                    <li><b href="#">Paciente: <%= nombrePaciente%></b>
                        <ul>
                            <li><a href="#">Editar información</a></li>
                            <li><a href="#">Cerrar Sesión</a></li>  
                        </ul>
                    </li>
                </ul>
            </nav> 


            <%}%>
        </header>

    </body>
</html>