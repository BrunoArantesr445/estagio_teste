<?php
include_once 'Database.php';
include_once 'Supervisor.php';
include_once 'Aluno.php';
include_once 'Local.php';

// Estabelece conexão com o banco de dados
$database = new Database();
$db = $database->getConnection();

// Obtém os dados para exibição
$stmt_agenda = $db->prepare("SELECT a.*, p.nome AS supervisor_nome, al.nome AS aluno_nome, l.instituicao AS local_nome
FROM agenda a
JOIN supervisor p ON a.supervisor_id = p.id
JOIN alunos al ON a.aluno_id = al.id
JOIN local l ON a.local_id = l.id
ORDER BY a.horario ASC LIMIT 0, 5000;");
$stmt_agenda->execute();
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Agenda do Estágio</title>
    <link rel="stylesheet" type="text/css" href="estiloss.css">
</head>

<body>
    <a href="index.php">Voltar para o menu</a>
    <h1>Agenda do Estágio</h1>

    <table border="1">
        <tr>
            <th>Data e Hora</th>
            <th>supervisor</th>
            <th>Aluno</th>
            <th>Local de Estágio</th>
            <th>Status</th>
        </tr>

        <?php
        // Exibindo a agenda do estágio
        while ($row = $stmt_agenda->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . date("d/m/Y H:i", strtotime($row['horario'])) . "</td>";
            echo "<td>" . $row['supervisor_nome'] . "</td>";
            echo "<td>" . $row['aluno_nome'] . "</td>";
            echo "<td>" . $row['local_nome'] . "</td>";
            echo "<td>" . $row['status'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>

</body>

</html>