<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilinho.css">
    <title>Relatório de Professor</title>
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Locais de Estágio</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Local</th>
            <th>Observação</th>
        </tr>
        <?php
        include_once 'Database.php';
        include_once 'Local.php';

        $database = new Database();
        $db = $database->getConnection();

        $local = new Local($db);
        $stmt = $local->read();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['instituicao'] . "</td>";
            echo "<td>" . $row['observacao'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
   
</body>
</html>
