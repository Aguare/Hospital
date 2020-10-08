<%-- 
    Document   : ArchivoCarga
    Created on : 6/10/2020, 18:46:42
    Author     : aguare
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Menu.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/cargaArchivo.css" rel="stylesheet" type="text/css">
        <title>Cargar Archivo</title>
    </head>
    <body>
        <% if (request.getAttribute("correcto") == null && request.getAttribute("errores") == null) {%>           
        <div class="seleccion">
            <h1>Seleccione los archivos de carga (XML)(IMG,PDF)</h1>
            <h2>El primer archivo es para la base de datos, los segundos para los exámenes de laboratorio (ordenes, resultados)</h2>
            <form action="../ServletArchivo" method="POST" enctype="multipart/form-data">
                <label>Seleccione el archivo XML:</label>
                <input type="file" name="archivoCarga" id="archivoCarga" accept=".xml" required>
                <label>Seleccione los archivos:</label>
                <input class="form-control" type="file"  name="archivosOtros" id="archivosOtros" accept=".pdf,image/*" multiple required>
                <br><br>
                <button type="submit" value="cargar">Cargar Archivo</button>
                <br><br>
            </form> 
        </div>
        <%} else {%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style>
        <style><%@include file="../CSS/cargaArchivo.css"%></style>
        <br><br>
        <label>DATOS INGRESADOS CORRECTAMENTE</label><br>
        <textarea name="ingresoC" rows="20" cols="100" readonly>
            <%
                ArrayList<String> c = (ArrayList<String>) request.getAttribute("correcto");
                for (String string : c) {
            %>
            <%= string%>
            <% } %>

        </textarea><br><br>
        <label>DATOS INGRESADOS CORRECTAMENTE</label><br>
        <textarea name="ingresoC" rows="20" cols="100" readonly>
            <%
                ArrayList<String> e = (ArrayList<String>) request.getAttribute("errores");
                for (String string : e) {
            %>
            <%= string%>
            <% } %>

        </textarea><br>

        <%}%>
    </body>
</html>
