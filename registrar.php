<?php

include("conexion_bd.php");

    if (iseet($_POST['Registrarse'])) {
        if(
            strlen($_POST['Nombre']) >= 1 &&
            strlen($_POST['Correo']) >= 1 &&
            strlen($_POST['Usuario']) >= 1 &&
            strlen($_POST['Contraseña']) >= 1 
            ) {
                $Nombre = trim($_POST['Nombre']);
                $Correo = trim($_POST['Correo']);
                $Usuario = trim($_POST['Usuario']);
                $Contraseña = trim($_POST['Contraseña']);
                $consulta = " INSERT INTO REGISTRO(Nombre, Correo, Usuario, Contraseña)
                    VALUES('$Nombre' , '$Correo' , '$Usuario' , '$Contraseña')";
                $resultado = mysqli_query($conex, $consulta);
                if ($resultado) {    
                 ?>
                    <h3 class="success" >Tu registro se a completado</h3>
                 <?php
                } else {
                 ?> 
                    <h3 class="success" >Ocurrio un error</h3>
                 <?php
                 }
            } else {
                ?> 
                    <h3 class="success" >Lllena todos los campos</h3>
                <?php
            }

        }
    
    
?>