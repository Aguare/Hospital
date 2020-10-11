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
                <li><a href="#">Paciente: </a>
                    <ul>
                        <li><a href="#">Editar información</a></li>
                        <li><a href="#">Cerrar Sesión</a></li>  
                    </ul>
                </li>
            </ul>
        </nav> 

    </body>
</html>
