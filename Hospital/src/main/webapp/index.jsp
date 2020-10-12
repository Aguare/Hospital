<%-- 
    Document   : InicioSesion
    Created on : 9/10/2020, 18:53:20
    Author     : aguare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/EstiloInicioSesion.css" rel="stylesheet" type="text/css">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <% if (request.getAttribute("success") == null) {%>
        <h2>¡BIENVENIDO A HOSPITAL GUATEMALA!</h2>
        <%} else if (request.getAttribute("success") != null) {
            String succ = String.valueOf(request.getAttribute("success"));
            if (succ.equals("3")) {%>
        <h1>ESTA REGISTRADO CORRECTAMENTE, AHORA INICIE SESIÓN</h1>
        <%} else if (succ.equals("2")) {%>
        <h1>USUARIO O CONTRASEÑA INCORRECTA, INTENTELO DE NUEVO O REGISTRESE</h1>
        <%} else if (succ.equals("0")) {%>
        <h1>ERROR AL REGISTRARSE, PUEDE QUE EL #DPI YA ESTÉ REGISTRADO</h1>
        <%}
                }%>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="Registrar" method="POST">
                    <h1>REGISTRARSE</h1>
                    <span>Todos los campos son obligatorios</span>
                    <input type="text" placeholder="Nombre completo" name="nombre" required/>
                    <select name="sexo">
                        <option>Hombre</option>
                        <option>Mujer</option>
                    </select>
                    <input type="date" name="fechaNacimiento" required/>
                    <input type="number" placeholder="DPI" name="DPI" required/>
                    <input type="tel" placeholder="Telefono" name="telefono" required/>
                    <input type="number" placeholder="Peso en Kg" name="peso" required/>
                    <select name="tipoSangre">
                        <option>A+</option>
                        <option>A-</option>
                        <option>B+</option>
                        <option>B-</option>
                        <option>AB+</option>
                        <option>AB-</option>
                        <option>O+</option>
                        <option>O-</option>
                    </select>
                    <input type="email" placeholder="Correo" name="correo" required/>
                    <input type="password" placeholder="Password" name="passRegistro" required/>
                    <button>REGISTRARSE</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="Login" method="POST">
                    <h1>INICIAR SESIÓN</h1>
                    <span>Para los paciente su USUARIO es su #DPI</span>
                    <input type="text" placeholder="Usuario" name="id" required/>
                    <input type="password" placeholder="Contraseña" name="password" required/>
                    <a href="#">¿Olvidó su contraseña?</a>
                    <button>Ingresar</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>BIENVENIDO</h1>
                        <p>DISFRUTARAS DE LOS MEJORES BENEFICIOS PARA TU SALUD</p>
                        <button class="ghost" id="signIn">INICIAR SESION</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>¿NO TIENES USUARIO?</h1>
                        <p>REGISTRATE AHORA PARA OBTENER LOS MEJORES BENEFICIOS EN NUESTRO SISTEMA</p>
                        <button class="ghost" id="signUp">REGISTRARSE</button>
                    </div>
                </div>
            </div>

        </div>      
    </body>
    <script type="text/javascript" src="Js/InicioS.js"></script>
</html>
