<?php
header('Content-Type: application/json');

// Datos de conexión (ajústalos si los cambiaste)
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

// Leer datos JSON del body
$datos = json_decode(file_get_contents("php://input"), true);

if ($datos && isset($datos['usuario']) && isset($datos['correo']) && isset($datos['clave'])) {
    $usuario = $conn->real_escape_string($datos['usuario']);
    $correo = $conn->real_escape_string($datos['correo']);
    $clave = password_hash($datos['clave'], PASSWORD_DEFAULT); // Encriptar contraseña

    // Insertar en la base de datos
    $sql = "INSERT INTO usuarios (usuario, correo, clave) VALUES ('$usuario', '$correo', '$clave')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["mensaje" => "Usuario registrado correctamente", "usuario" => $usuario]);
    } else {
        echo json_encode(["error" => "Error al registrar: " . $conn->error]);
    }
} else {
    echo json_encode(["error" => "Datos incompletos o inválidos"]);
}

$conn->close();