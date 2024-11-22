<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilinho.css">
    <title>Relatório de Aluno</title>
    <link rel="stylesheet" type="text/css" href="estiloss.css">
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Aluno</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Disponibilidade de Horário</th>
            <th>Fase do estagio</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>cpf</th>
            <th>Turma</th>
            <th>Status</th>
            <th>Carga Horaria</th>
        </tr>
        <?php
        include_once 'Database.php';
        include_once 'Aluno.php';

        $database = new Database();
        $db = $database->getConnection();

        $aluno = new Aluno($db);
        $stmt = $aluno->read();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['nome'] . "</td>";
            echo "<td>" . $row['disponibilidade_horario'] . "</td>";
            echo "<td>" . $row['fase_estagio'] . "</td>";
            echo "<td>" . $row['email'] . "</td>";
            echo "<td>" . $row['telefone'] . "</td>";
            echo "<td>" . $row['cpf'] . "</td>";
            echo "<td>" . $row['turma'] . "</td>";
            echo "<td>" . $row['status'] . "</td>";
            echo "<td>" . $row['carga_horaria'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
   
</body>
</html>
