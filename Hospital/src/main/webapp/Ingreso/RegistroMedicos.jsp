<%-- 
    Document   : Registro
    Created on : 5/10/2020, 00:04:31
    Author     : aguare
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/Extras/CSS.jsp"/> 
    </head>
    <body>
        <h1>Form Registro Medicos</h1>
        <br>
        <div class="container">
            <form action="${pageContext.request.contextPath}/AgregarMedico" method="POST">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nombre" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Numero de Colegiado</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="colegiado" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">DPI</label>
                    <div class="col-sm-10">
                        <input type="number"  min="1111111111111" max="9999999999999" class="form-control" name="DPI" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Numero de Telefono</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="telefono" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Correo Electronico</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" name="correo" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Fecha Inicio Trabajo</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" name="fecha_inicio" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Hora Inicio</label>
                    <div class="col-sm-10">
                        <input type="time" class="form-control" name="hora_inicio" required step="3600">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Hora Fin</label>
                    <div class="col-sm-10">
                        <input type="time" class="form-control" name="hora_fin" required step="3600">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>

        <jsp:include page="/WEB-INF/Extras/JS.jsp"/>
    </body>
</html>
