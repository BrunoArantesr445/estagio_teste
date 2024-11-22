<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilinho.css">
    <title>Relatório de Professor</title>
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Professor</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Disponibilidade de Horário</th>
            <th>Especialidade</th>
            <th>Telefone</th>
            <th>a Horaria</th>
        </tr>
        <?php
        include_once 'Database.php';
        include_once 'Professor.php';

        $database = new Database();
        $db = $database->getConnection();

        $professor = new Professor($db);
        $stmt = $professor->read();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['nome'] . "</td>";
            echo "<td>" . $row['disponibilidade_horario'] . "</td>";
            echo "<td>" . $row['especialidade'] . "</td>";
            echo "<td>" . $row['telefone'] . "</td>";
            echo "<td>" . $row['carga_horaria'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
   
</body>
</html>
