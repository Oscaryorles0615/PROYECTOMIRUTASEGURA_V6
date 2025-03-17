<?php

    if(insert($_POST['formulario'])){

        $nombre= $_POST ['nombre'];
        $correo= $_POST ['correo'];
        $telfono= $_POST ['telefono'];

        $insertarDatos = "INSERT INTO MI_RUTA_SEGURA VALUES('$nombre','$correo','$telefono','')";

        $ejecutarInsertar = mysqli_query ($enlace,$insertarDatos);


    }   

?>  