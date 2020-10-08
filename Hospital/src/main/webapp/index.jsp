<%-- 
    Document   : index
    Created on : 8/10/2020, 00:53:39
    Author     : aguare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Encriptar contraseña</h1>
        <a href="Sesion/ArchivoCarga.jsp">Cargar Archivos</a>
        <a href="Sesion/MenuPaciente.jsp">Menú Paciente</a>
        <form method="POST" action="Sesion/MenuPaciente.jsp">   
            <input type="text" name="nombrePaciente">
            <input type="submit" name="button">
        </form>
        <%
            String nombre = request.getParameter("nombrePaciente");
        %>
    </body>
</html>
