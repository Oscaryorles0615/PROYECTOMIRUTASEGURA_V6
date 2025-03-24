<?php
    
if (!$enmpty($_POST["btn btn btn-primary btn-lg"])) {
    IF (empty($_POST["CorreoElectronico"]) and empty($_POST["Contraseña"])) {
        echo "LOS CAMPOS ESTAN VACIOS";
    } else {
        $CorreoElectronico=$_POST["CorreoElectronico"];
        $Contraseña=$_POST["Contraseña"];
        $sql=$conexion->query("select - from REGISTRO where CorreoElectronico=$CorreoElectronico and Contraseña=$Contraseña ");
        if ($datos=$sql->fetch_object()) {
            header("location:iniciosesion.php");
        } else {
            echo "ACCESO DENEGADO"; 
        }           
    }

}    
    
?>
