<%-- 
    Document   : Registro
    Created on : 5/10/2020, 00:04:31
    Author     : aguare
--%>
<%@page import="Entidades.Especialidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SQL.Consultas"%>
<%@page import="Entidades.Medico"%>
<%@page import="SQL.Obtener"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/Extras/CSS.jsp"/> 
    </head>
    <body>
        <%@include file="../Usuario/MAdmin.jsp"%>
        <style><%@include file="../CSS/EstiloMenu.css"%></style><br>
        <%if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }%>
        <% if (request.getParameter("medico") == null) {%>  
        <%Consultas consulta = new Consultas();
            ArrayList<Especialidad> especialidades = consulta.obtenerEspecialidadesLista();%>
    <center><h1>REGISTRO DE UN MÉDICO</h1></center>
    <br>

    <div class="container">
        <form action="${pageContext.request.contextPath}/AgregarMedico" method="POST">
            <input type="hidden" id="opcion" name="opcion" value="0">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nombreR" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Numero de Colegiado</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="colegiadoR" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">DPI</label>
                <div class="col-sm-10">
                    <input type="number" min="1111111111" max="9999999999999" class="form-control" name="DPIR" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Numero de Telefono</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="telefonoR" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Correo Electronico</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="correoR" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Especialidad</label>
                <div class="col-sm-10">
                    <select name="especialidadR">
                        <% for (Especialidad pas : especialidades) {%>
                        <option><%=pas.getNombre()%></option>
                        <%}%>
                    </select>
                </div>
            </div>                       
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Hora Inicio</label>
                <div class="col-sm-10">
                    <input type="time" class="form-control" name="hora_inicioR" required step="3600">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Hora Fin</label>
                <div class="col-sm-10">
                    <input type="time" class="form-control" name="hora_finR" required step="3600">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Contraseña de Acceso</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="passwordR" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" name="opcion" value="0">Registrar</button>
            <a href="../Usuario/MAdmin.jsp">Volver</a>
        </form>
    </div>
    <jsp:include page="/WEB-INF/Extras/JS.jsp"/>
    <%} else {
        String codMedico = request.getParameter("medico");
        Obtener obtener = new Obtener();
        Medico med = obtener.obtenerMedico(codMedico);
    %>

    <center><h1>EDITAR MÉDICO</h1></center>
    <style><%@include file="../CSS/EstiloMenu.css"%></style>
    <br>
    <br>
    <div class="container">
        <form action="${pageContext.request.contextPath}/AgregarMedico" method="POST">
            <input type="hidden" id="opcion" name="opcion" value="1">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Codigo</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="codigo" value="<%=med.getCodigo()%>" disabled="" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nombre" value="<%=med.getNombre()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Numero de Colegiado</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="colegiado" value="<%=med.getNoColegiado()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">DPI</label>
                <div class="col-sm-10">
                    <input type="number"  min="1111111111" max="9999999999999" class="form-control" name="DPI" value="<%=med.getDPI()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Numero de Telefono</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="telefono" value="<%=med.getTelefono()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Correo Electronico</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="correo" value="<%=med.getCorreo()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Fecha Inicio Trabajo</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" name="fecha_inicio" value="<%=med.getFechaInicio().toString()%>" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Hora Inicio</label>
                <div class="col-sm-10">
                    <input type="time" class="form-control" name="hora_inicio" value="<%=med.getHoraInicio()%>" required step="3600">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Hora Fin</label>
                <div class="col-sm-10">
                    <input type="time" class="form-control" name="hora_fin" value="<%=med.getHoraFinal()%>" required step="3600">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            <a href="../Usuario/MAdmin.jsp">Volver</a>
        </form>
    </div>
    <%}%>
    <jsp:include page="/WEB-INF/Extras/CSS.jsp"/>
    <jsp:include page="/WEB-INF/Extras/JS.jsp"/>
</body>
</html>
