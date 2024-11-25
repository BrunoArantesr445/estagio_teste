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
            // Depuração para verificar o conteúdo de $row
            // var_dump($row); // Coloque isso temporariamente para depuração

            // Verifique se 'supervisor_id' existe no array $row
            if (isset($row['supervisor_id'])) {
                $supervisor_id = $row['supervisor_id'];

                // Verifique se o supervisor existe no banco de dados
                $supervisor = new supervisor($db);
                $stmt_supervisor = $supervisor->readById($supervisor_id);

                // Verifique se a consulta retornou um supervisor
                if ($stmt_supervisor) {
                    $supervisor_nome = $stmt_supervisor['nome'];
                } else {
                    $supervisor_nome = 'Não encontrado';  // Caso o supervisor não exista
                }
            } else {
                $supervisor_nome = 'Não atribuído';  // Caso 'supervisor_id' não esteja presente
            }

            // Obtenha o nome LOCAL
            $local_id = $row['local'];
            $local = new Local($db);
            $stmt_local = $local->readById($local_id);
            $local_nome = $stmt_local['nome'];  // Nome do local

            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $local_nome . "</td>";
            echo "<td>" . $row['departamento'] . "</td>";
            echo "<td>" . $row['limite_vagas'] . "</td>";
            echo "<td>" . $row['horario_disponivel'] . "</td>";
            echo "<td>" . $supervisor_nome . "</td>";  
            echo "<td>" . $row['especialidade'] . "</td>";
            echo "<td>" . $row['fase_estagio'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
  
</body>
</html>
