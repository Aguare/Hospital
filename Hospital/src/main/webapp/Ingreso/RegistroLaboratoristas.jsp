<%-- 
    Document   : Registro
    Created on : 5/10/2020, 00:04:31
    Author     : aguare
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="SQL.AuxInsertar"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="/WEB-INF/Extras/CSS.jsp"/> 
    </head>
    <body>
        <h1>INGRESAR LABORATORISTA</h1>
        <br>
        <div class="container">
            <form action="${pageContext.request.contextPath}/AgregarLaboratorista" method="POST">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Nombre</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nombre" required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Numero de Registro</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="registro" required>
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
                    <label class="col-sm-2 col-form-label">Dias de Trabajo</label>
                    <div class="col-sm-10">
                        <label class="checkbox-inline"><input type="checkbox" value="1">Lunes</label>
                        <label class="checkbox-inline"><input type="checkbox" value="2">Martes</label>
                        <label class="checkbox-inline"><input type="checkbox" value="3">Miercoles</label>
                        <label class="checkbox-inline"><input type="checkbox" value="4">Jueves</label>
                        <label class="checkbox-inline"><input type="checkbox" value="5">Viernes</label>
                        <label class="checkbox-inline"><input type="checkbox" value="6">Sabado</label>
                        <label class="checkbox-inline"><input type="checkbox" value="7">Domingo</label>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Examen a Realizar</label>
                    <select name="codigo_examen">
                        <%! AuxInsertar auxInsert = new AuxInsertar();%>
                        <% ArrayList<Integer> codigosExamen = auxInsert.codigosExamen();%>
                        <% for (Integer codigo : codigosExamen) {%>
                        <option value="<%=codigo%>"><%=codigo%></option> 
                        <%}%>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Agregar</button>
            </form>
        </div>
        <jsp:include page="/WEB-INF/Extras/JS.jsp"/>
    </body>
</html>
