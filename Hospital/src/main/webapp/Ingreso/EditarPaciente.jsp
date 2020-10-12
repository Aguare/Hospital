<%-- 
    Document   : EditarPaciente
    Created on : 12/10/2020, 00:20:50
    Author     : aguare
--%>

<%@page import="SQL.Obtener"%>
<%@page import="Entidades.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/Extras/CSS.jsp"/> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Paciente</title>
    </head>
    <body>
    <%@include file="../Usuario/MAdmin.jsp"%>
    <style><%@include file="../CSS/EstiloMenu.css"%></style>
    <br>
    <% if (request.getParameter("paciente") != null) {
            Obtener obtener = new Obtener();
            Paciente pas = obtener.obtenerPaciente(request.getParameter("paciente"));%>
    <center><h1>EDITE LOS CAMPOS NECESARIOS</h1></center>
    <div class="container">
        <form action="${pageContext.request.contextPath}/EditarPaciente" method="POST">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Código</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="codigo"  disabled="" value="<%=pas.getCodigo()%>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nombre" value="<%=pas.getNombre()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Sexo</label>
                <div class="col-sm-10">
                    <select name="sexo">
                        <%if (pas.getSexo().equalsIgnoreCase("Hombre")) {%>
                        <option>Hombre</option>
                        <option>Mujer</option>
                        <%} else {%>
                        <option>Mujer</option>
                        <option>Hombre</option>
                        <%}%>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Fecha de Nacimiento</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" name="fechaNacimiento" value="<%=pas.getFechaNacimiento().toString()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">DPI</label>
                <div class="col-sm-10">
                    <input type="number" size="13" class="form-control" name="DPI" value="<%=pas.getDPI()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Teléfono</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="telefono" value="<%=pas.getTelefono()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Peso aproximado en KG</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="peso" value="<%=pas.getPeso()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Tipo de Sangre</label>
                <div class="col-sm-10">
                    <select name="tipoSangre">
                        <option><%=pas.getTipoSangre()%></option>
                        <option>A+</option>
                        <option>A-</option>
                        <option>B+</option>
                        <option>B-</option>
                        <option>AB+</option>
                        <option>AB-</option>
                        <option>O+</option>
                        <option>O-</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Correo Electrónico</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="correo" value="<%=pas.getCorreo()%>" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            <a href="../Usuario/MAdmin.jsp">Volver</a>
        </form>
    </div>
    <jsp:include page="/WEB-INF/Extras/JS.jsp"/>
    <% } else {
            response.sendRedirect(request.getContextPath() + "/Usuario/MAdmin.jsp");
        }%>
</body>
</html>
