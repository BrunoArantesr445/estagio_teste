<?php
    include_once 'Database.php';
    include_once 'Aluno.php';
    include_once 'LocalDepartamento.php';
    
    $database = new Database();
    $db = $database->getConnection();
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Cadastro de Alocação</title>
</head>
<body>
    <a href="index.php">Voltar para o menu</a>
    <h1>Cadastro de Alocação</h1>

    <form action="processa_cadastro_alocacao.php" method="post">
        <label for="nome">Nome do Aluno:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="local">Local de Estágio:</label>
        <input type="text" id="local" name="local" required><br><br>

        <label for="departamento">Departamento:</label>
        <input type="text" id="departamento" name="departamento" required><br><br>

        <input type="submit" value="Alocar">
    </form>
</body>
</html>
