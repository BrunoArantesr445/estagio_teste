<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilinho.css">
    <title>Relatório de Alocações</title>
</head>
<body>
    <a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Alocações</h1>
    <table border="1">
        <tr>
            <th>ID Alocação</th>
            <th>Nome do Aluno</th>
            <th>Nome do Local de Estágio</th>
            <th>Departamento</th>
        </tr>
        <?php
        include_once 'Database.php';
        include_once 'Alocacao.php';

        $database = new Database();
        $db = $database->getConnection();

        $alocacao = new Alocacao($db);
        $stmt = $alocacao->read();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
            echo "<td>" . htmlspecialchars($row['nome']) . "</td>";
            echo "<td>" . htmlspecialchars($row['local']) . "</td>";
            echo "<td>" . htmlspecialchars($row['departamento']) . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>
