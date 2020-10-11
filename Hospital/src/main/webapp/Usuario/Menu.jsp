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
            <input type="checkbox" id="btn-menu">
            <label for="btn-menu"><img src="../Imagenes/menu.png" alt=""></label>
            <nav class="menu">
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Médicos</a>
                        <ul>
                            <li><a href="#">Citas del día</a></li>
                            <li><a href="#">Citas agendadas</a></li>
                            <li><a href="#">Pacientes con más Informes</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Pacientes</a>
                        <ul>
                            <li><a href="#">Últimos 5 exámenes</a></li>
                            <li><a href="#">Últimas 5 consultas</a></li>
                            <li><a href="#">Busqueda de exámenes</a></li>
                            <li><a href="#">Busqueda consultas</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Laboratorista</a>
                        <ul>
                            <li><a href="#">Exámenes del día</a></li>
                            <li><a href="#">Exámenes realizados hoy</a></li>
                            <li><a href="#">10 fechas con más trabajo</a></li>
                            <li><a href="#">Utilización del día</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Administrador</a>
                        <ul>
                            <li><a href="#">10 médicos con más informes</a></li>
                            <li><a href="#">Ingresos por médico</a></li>
                            <li><a href="#">5 médicos con menos citas</a></li>
                            <li><a href="#">Exámenes más demandados</a></li>
                            <li><a href="#">Médicos con más ordenes</a></li>
                            <li><a href="#">Ingresos por paciente</a></li>
                        </ul>
                    </li>
                    <li><b>Paciente: Marcos Andrés Aguare Bravo</b>
                        <ul>
                            <li><a href="#">Editar información</a></li>
                            <li><a href="#">Cerrar Sesión</a></li>  
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>

    </body>
</html>
