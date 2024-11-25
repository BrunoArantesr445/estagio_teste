<?php
session_start();  // Inicia a sessão
// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}
        include_once 'Database.php';
        include_once 'LocalDepartamento.php';
        include_once 'supervisor.php';
        include_once 'Local.php';
        ?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilinho.css">
    <title>Relatório de Local de Estágio</title>
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Local de Estágio</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Local</th>
            <th>Departamento</th>
            <th>Limite de Vagas</th>
            <th>Horário Disponível</th>
            <th>supervisor Responsável</th>
            <th>Especialidade</th>
            <th>Fase</th>
        </tr>
        <?php

        $database = new Database();
        $db = $database->getConnection();

        $local_estagio = new LocalDepartamento($db);
        $stmt = $local_estagio->read();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // Obtenha o nome do supervisor responsável
            $supervisor_id = $row['supervisor_id'];
            $supervisor = new supervisor($db);
            $stmt_supervisor = $supervisor->readById($supervisor_id);
            $supervisor_nome = $stmt_supervisor['nome'];

             // Obtenha o nome LOCAL
             $local_id = $row['local'];
             $local = new Local($db);
             $stmt_local = $local->readById($local_id);
             $local_nome = $stmt_local['nome'];


            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['local'] . "</td>";
            echo "<td>" . $row['departamento'] . "</td>";
            echo "<td>" . $row['limite_vagas'] . "</td>";
            echo "<td>" . $row['horario_disponivel'] . "</td>";
            echo "<td>" . $row['supervisor'] . "</td>";
            echo "<td>" . $row['especialidade'] . "</td>";
            echo "<td>" . $row['fase_estagio'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
  
</body>
</html>
