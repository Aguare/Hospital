<%-- 
    Document   : Registro
    Created on : 5/10/2020, 00:04:31
    Author     : aguare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Varios.Encriptar" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encriptacion</title>
    </head>
    <body>
        <% if (request.getParameter("usuario") == null && request.getParameter("password") == null) {
        %>
        <FORM method="GET" ACTION="/Hospital/Ingreso/Registro.jsp">
            <h1>PRUEBA</h1>
            <label>Usuario:</label>
            <input name="usuario" type="Text">
            </br></br>
            <label>Contraseña:</label>
            <input name="password" type="password">
            </br>
            <input type="submit" value="Encriptar">
        </FORM>
        <%} else {
            String password = request.getParameter("password");
            Encriptar encriptar = new Encriptar();
            String encriptado = encriptar.encriptarPass(password);
            String des = encriptar.desencriptarPass(encriptado, "ipc");
        %>
        <label>Encriptado: </label>
        <%= encriptado %>
        </br>
        <label>Desencriptado: </label>
        <%= des %>
        <% } %>
    </body>
</html>
