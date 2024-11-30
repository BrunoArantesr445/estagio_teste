<?php
include_once 'Database.php';

// Estabelece conexão com o banco de dados
try {
    $database = new Database();
    $db = $database->getConnection();
} catch (PDOException $e) {
    die("Erro ao conectar com o banco de dados: " . $e->getMessage());
}

// Consulta otimizada para a tabela "reserva" com JOINs
try {
    $query = "
       SELECT 
    r.data, 
    a.nome AS aluno_nome, 
    s.nome AS supervisor_nome, 
    r.fatla
FROM reserva r
JOIN alunos a ON r.alunos_id = a.id
JOIN supervisor s ON r.supervisor_id = s.id
ORDER BY r.data ASC
LIMIT 100;
";
    
    $stmt = $db->prepare($query);
    $stmt->execute();
} catch (PDOException $e) {
    die("Erro ao executar a consulta: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Agenda de Reservas</title>
    <link rel="stylesheet" type="text/css" href="estiloss.css">
</head>

<body>
    <a href="index.php">Voltar para o menu</a>
    <h1>Agenda de Reservas</h1>

    <table border="1">
        <tr>
            <th>Data</th>
            <th>Aluno</th>
            <th>Supervisor</th>
            <th>Falta</th>
        </tr>

        <?php
        // Exibindo os dados da tabela "reserva"
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars(date("d/m/Y", strtotime($row['data']))) . "</td>";
            echo "<td>" . htmlspecialchars($row['aluno_nome']) . "</td>";
            echo "<td>" . htmlspecialchars($row['supervisor_nome']) . "</td>";
            echo "<td>" . htmlspecialchars($row['falta'] ?? 'N/A') . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

</html>
