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
        <%if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }%>
        <%if (request.getSession().getAttribute("user") != null) {
                Usuario user = (Usuario) request.getSession().getAttribute("user");
        %>                  
        <input type="checkbox" id="btn-menu">
        <nav class="menu">
            <ul>
                <li><a href="<%=request.getContextPath()%>/Usuario/MAdmin.jsp">Inicio</a></li>
                <li><a href="#">Nuevo Registro</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Ingreso/RegistroMedicos.jsp">Médico</a></li>
                        <li><a href="#">Exámen</a></li>
                        <li><a href="#">Consulta</a></li>
                        <li><a href="#">Laboratorista</a></li>                        
                    </ul>
                </li>
                <li><a href="#">Listados</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaMedicos.jsp">Médicos</a></li>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaExamenes.jsp">Exámenes</a></li>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaConsultas.jsp">Consultas</a></li>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaPacientes.jsp">Pacientes</a></li>
                        <li><a href="<%=request.getContextPath()%>/Listas/ListaLaboratoristas.jsp">Laboratoristas</a></li>
                    </ul>
                </li>
                <li><a href="#">Reportes</a>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Reportes/IngresosMedico.jsp">Ingresos por médico</a></li>
                        <li><a href="#">Ingresos por Paciente</a></li>
                        <li><a href="#">Médicos con más ordenes</a></li>
                        <li><a href="#">Exámenes más demandados</a></li>
                        <li><a href="#">5 Médicos con menos citas</a></li>
                        <li><a href="#">10 Médicos con más informes</a></li>                                             
                    </ul>
                </li>
                <li><a href="#">Admin: <%=user.getNombre()%></a>
                    <ul>
                        <li><a href="../Logout">Cerrar Sesión</a></li>
                    </ul>
                </li>
            </ul>
        </nav> 
        <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
        <%}%>
        <%if (request.getAttribute("mensaje") != null) {
                int numero = (Integer) request.getAttribute("mensaje");
                if (numero == 0) {%>
    <center>
        <h1>LA OPERACIÓN SE HA REALIZADO CON ÉXITO</h1>
    </center>
    <style><%@include file="../CSS/EstiloMenu.css"%></style>
    <%} else if (numero == 1) {%>
    <center>
        <h1>NO SE HA PODIDO REALIZAR LA OPERACIÓN</h1>
    </center>
    <style><%@include file="../CSS/EstiloMenu.css"%></style>
    <%} else if (numero == 3) {%>
    <h1><%=request.getAttribute("info")%></h1>
    <%}
        }
    %>
</body>
</html>
