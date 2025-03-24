<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iniciosesion</title>
    <!-- Importando Bootstrap desde CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Iconos de Materialize -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body {
            background-image: url('PaginaInicio.png');
            background-size: cover; /* Hace que la imagen cubra todo el fondo */
            background-position: center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita que la imagen se repita */
            height: 100vh; /* Ocupa el 100% del viewport */
            margin: 0; /* Elimina el margen por defecto del body */
        }

        .login-container {
            max-width: 350px;
            margin: 7% 0 10% 17%; /* 7% de margen en la parte superior, 0 a la derecha, 10% abajo y 17% a la izquierda */
            background-color: rgba(255, 255, 255, 0.9); /* Fondo semi-transparente */
            padding: 15px;
            border-radius: 15px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2); /* Sombra para el contenedor */
        }

        .google-btn {
            background-color: #4285F4;
            color: white;
            
            
        }

        .google-btn i {
            margin-right: 10px;
        }

        .footer-text {
            margin-top: 20px;
            text-align: center;
        }

        .center-btn {
            text-align: center;
        }

        .input-group-text {
            cursor: pointer; /* Cambia el cursor al pasar sobre el ícono */
        }
    </style>
</head>
<body>

    <div class="container login-container shadow-sm">
    <form method="POST" action="">    
        <h2 class="text-center">Mi Ruta Segura</h2><br>
        <?php
        include("conexionbd.php");
        include("controlador.php");
        ?>                 
        <div class="form-row">
            <form class="col-12">
                <!-- Campo de correo electrónico -->
                <div class="form-group col-12">
                    <label for="email">CorreoElectrónico</label>
                    <input id="email" type="email" class="form-control" required>
                </div>

                <!-- Campo de contraseña con ícono -->
                <div class="form-group col-12">
                    <label for="password">Contraseña</label>
                    <div class="input-group">
                        <input id="password" type="password" class="form-control" required>
                        <div class="input-group-append">
                            <span class="input-group-text password-toggle" onclick="togglePassword()">
                                <i class="material-icons">visibility</i>
                            </span>
                        </div>
                    </div>
                </div>

                <!-- ¿Olvidó su contraseña? -->
                <div class="col-12 text-right">
                    <a href="2_RecuperaPass_ok.html">¿Olvidó su contraseña?</a> <!-- Enlace añadido -->
                <br><br>
                </div>

                <!-- Botón de iniciar sesión centrado -->
                <div class="col-12 center-btn">
                    <button class="btn btn btn-primary btn-lg" type="submit" onclick="window.location.href='4_PaginaPpal_ok.html'; return false;">
                        Iniciar Sesión <!-- Enlace añadido -->
                    </button>
                </div>

                <!-- ¿No tienes cuenta? -->
                <div class="col-12 footer-text">
                    <p>¿No tienes cuenta? <a href="3_RegistroUsuario_ok.html">¡Regístrate ahora!</a></p> <!-- Enlace añadido -->
                </div>
            </form>
        </div>
    </form>
    </div>

    <!-- Importando Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script>
        // Función para mostrar/ocultar la contraseña
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const passwordToggleIcon = document.querySelector('.password-toggle i');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                passwordToggleIcon.textContent = 'visibility_off';
            } else {
                passwordField.type = 'password';
                passwordToggleIcon.textContent = 'visibility';
            }
        }
    </script>
</body>
</html>