<?php
session_start();  // Inicia a sessão
// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}

// Inclui os arquivos necessários
include_once 'Database.php';
include_once 'LocalDepartamento.php';
include_once 'Supervisor.php';

try {
    // Conexão com o banco de dados
    $database = new Database();
    $db = $database->getConnection();

    // Instancia as classes necessárias
    $localDepartamento = new LocalDepartamento($db);
    $supervisor = new Supervisor($db);

    // Consulta os locais de estágio
    $stmt = $localDepartamento->read();
} catch (Exception $e) {
    die("Erro ao conectar com o banco de dados: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="estilinho.css">
    <link rel="stylesheet" type="text/css" href="estiloss.css">
    <title>Relatório de Departamentos de Estágio</title>
</head>

<body>
    <a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Departamentos de Estágio</h1>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Departamento</th>
            <th>Limite de Vagas</th>
            <th>Horário Disponível</th>
            <th>Supervisor Responsável</th>
            <th>Especialidade</th>
            <th>Fase de Estágio</th>
        </tr>

        <?php
        // Exibe os dados da tabela locais_estagio
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // Busca o nome do supervisor responsável
            $supervisor_id = $row['id']; // Altere para a chave correta, se necessário
            $supervisor_data = $supervisor->readById($supervisor_id);
            $supervisor_nome = $supervisor_data ? $supervisor_data['nome'] : 'Não atribuído';

            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
            echo "<td>" . htmlspecialchars($row['departamento']) . "</td>";
            echo "<td>" . htmlspecialchars($row['limite_vagas']) . "</td>";
            echo "<td>" . htmlspecialchars($row['turno']) . "</td>";
            echo "<td>" . htmlspecialchars($supervisor_nome) . "</td>";
            echo "<td>" . htmlspecialchars($row['especialidade']) . "</td>";
            echo "<td>" . htmlspecialchars($row['fase_estagio']) . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

</html>
