<?php
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['usuario'])) {
    header("Location: login.php"); // Redireciona para o login caso não esteja autenticado
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Controle de Estágio</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <h1>Bem-vindo ao Sistema de Controle de Estágio!</h1>
    <p>Olá, <?php echo $_SESSION['usuario']; ?>. Você está logado!</p>
    <a href="logout.php">Sair</a>
</body>
</html>
