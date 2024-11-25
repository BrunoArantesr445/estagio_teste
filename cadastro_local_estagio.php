<?php
session_start();  // Inicia a sessão
// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Cadastro de Local de Estágio</title>
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Cadastro de Local de Estágio</h1>
    <form action="processa_cadastro_local.php" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="instituicao" name="instituicao" required><br><br>
        <label for="especialidade">Especialidade</label>
        <input type="text" id="especialidade" name="especialidade" required><br><br>
        <label for="departamento">Departamento:</label>
        <input type="text" id="departamento" name="departamento" required><br><br>
        <label for="turno">Turno:</label>
        <input type="text" id="turno" name="turno" required><br><br>
        <label for="disponibilidade">Disponibilidade:</label>
        <input type="text" id="disponibilidade" name="disponibilidade" required><br><br>
        <label for="observacao">Observação:</label>
        <textarea id="observacao" name="observacao" rows="4" cols="50"></textarea>
        <br><br>
        <input type="submit" value="Cadastrar">
    </form>
    
</body>
</html>
