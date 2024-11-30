<?php

session_start();  // Inicia a sessão
// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}
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
     
    <label for="aluno">Nome Do Aluno:</label>
        <select id="aluno" name="aluno" required>
        <option value=""></option>
            <?php
            include_once 'Aluno.php';
           $aluno = new Aluno($db);
            $stmt = $aluno->read();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['id'] . "'>" . $row['nome'] . "</option>";
            }
            ?>
        </select><br><br>


       
        <label for="localdepartamento">Local De Estagio:</label>
        <select id="localdepartamento" name="localdepartamento" required>
        <option value=""></option>
            <?php
            include_once 'LocalDepartamento.php';
           $localdepartamento = new LocalDepartamento($db);
            $stmt = $localdepartamento->read();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['id'] . "'>" . $row['local'] . "</option>";
            }
            ?>
        </select><br><br>

        <label for="localdepartamento">Departamento:</label>
        <select id="localdepartamento" name="localdepartamento" required>
        <option value=""></option>
            <?php
            include_once 'LocalDepartamento.php';
           $localdepartamento = new LocalDepartamento($db);
            $stmt = $localdepartamento->read();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['id'] . "'>" . $row['departamento'] . "</option>";
            }
            ?>
        </select><br><br>

        <input type="submit" value="Alocar">
    </form>
</body>
</html>
