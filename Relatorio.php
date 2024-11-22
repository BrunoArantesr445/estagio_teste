<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilinho.css">
    <title>Relatório de Alocações</title>
</head>
<body>
    <h1>Relatório de Alocações</h1>
    <table border="1">
        <tr>
            <th>ID Alocação</th>
            <th>Nome do Aluno</th>
            <th>Nome do Local de Estágio</th>
        </tr>
        <?php
        include_once 'Database.php';
        include_once 'Alocacao.php';
        include_once 'Aluno.php';
        include_once 'LocalEstagio.php';

        $database = new Database();
        $db = $database->getConnection();

        $alocacao = new Alocacao($db);
        $stmt = $alocacao->read();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $aluno_id = $row['aluno_id'];
            $local_estagio_id = $row['local_estagio_id'];

            $aluno = new Aluno($db);
            $stmt_aluno = $aluno->read();
            $aluno_data = $stmt_aluno->fetchAll(PDO::FETCH_ASSOC);
            $aluno_nome = '';
            foreach ($aluno_data as $data) {
                if ($data['id'] == $aluno_id) {
                    $aluno_nome = $data['nome'];
                    break;
                }
            }

            $local_estagio = new LocalEstagio($db);
            $stmt_local = $local_estagio->read();
            $local_data = $stmt_local->fetchAll(PDO::FETCH_ASSOC);
            $local_nome = '';
            foreach ($local_data as $data) {
                if ($data['id'] == $local_estagio_id) {
                    $local_nome = $data['nome'];
                    break;
                }
            }

            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $aluno_nome . "</td>";
            echo "<td>" . $local_nome . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>
