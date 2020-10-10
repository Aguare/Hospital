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
        <link href="../CSS/EstiloInicioSesion.css" rel="stylesheet" type="text/css">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <h2>¡BIENVENIDO A HOSPITAL GUATEMALA!</h2>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="#">
                    <h1>REGISTRARSE</h1>
                    <span>Todos los campos son obligatorios</span>
                    <input type="text" placeholder="Name" />
                    <input type="email" placeholder="Email" />
                    <input type="password" placeholder="Password" />
                    <button>Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="#">
                    <h1>INICIAR SESIÓN</h1>
                    <span>Para los paciente su USUARIO es su #DPI</span>
                    <input type="email" placeholder="Email" />
                    <input type="password" placeholder="Password" />
                    <a href="#">Forgot your password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>¡BIENVENIDO DE NUEVO!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="../Js/InicioS.js"></script>
    </body>
</html>
