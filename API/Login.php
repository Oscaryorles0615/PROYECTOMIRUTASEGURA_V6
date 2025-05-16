<?php
header('Content-Type: application/json');

// Datos de conexión
$host = "localhost";
$usuario_db = "root";
$clave_db = "";
$nombre_db = "API";

// Conectar a MySQL
$conn = new mysqli($host, $usuario_db, $clave_db, $nombre_db);

// Verificar conexión
if ($conn->connect_error) {
    echo json_encode(["error" => "Error de conexión a la base de datos"]);
    exit;
}

// Leer los datos enviados por Postman
$datos = json_decode(file_get_contents("php://input"), true);

if ($datos && isset($datos['usuario']) && isset($datos['clave'])) {
    $usuario = $conn->real_escape_string($datos['usuario']);
    $clave = $datos['clave'];

    // Buscar usuario en la base de datos
    $sql = "SELECT * FROM usuarios WHERE usuario = '$usuario'";
    $resultado = $conn->query($sql);

    if ($resultado->num_rows > 0) {
        $fila = $resultado->fetch_assoc();
        // Verificar la contraseña encriptada
        if (password_verify($clave, $fila['clave'])) {
            echo json_encode(["mensaje" => "Inicio de sesión exitoso", "usuario" => $usuario]);
        } else {
            echo json_encode(["error" => "Contraseña incorrecta"]);
        }
    } else {
        echo json_encode(["error" => "Usuario no encontrado"]);
    }
} else {
    echo json_encode(["error" => "Datos incompletos"]);
}

$conn->close();