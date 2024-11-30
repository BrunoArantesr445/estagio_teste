<?php
session_start(); // Inicia a sessão

// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}

include_once 'Database.php';
include_once 'LocalDepartamento.php';
include_once 'Supervisor.php';

// Conexão com o banco de dados
try {
    $database = new Database();
    $db = $database->getConnection();

    // Instanciar classes
    $localDepartamento = new LocalDepartamento($db);
    $supervisor = new Supervisor($db);

    // Query para listar supervisores e locais de estágio
    $query = "
        SELECT 
            s.nome AS supervisor_nome,
            s.disponibilidade_horario,
            s.especialidade,
            s.telefone,
            s.carga_horaria,
            ld.local AS local_estagio,
            ld.departamento,
            ld.limite_vagas,
            ld.fase_estagio
        FROM supervisor s
        JOIN locais_estagio ld ON ld.id = s.id
        ORDER BY s.nome ASC;
    ";

    $stmt = $db->prepare($query);
    $stmt->execute();

} catch (PDOException $e) {
    die("Erro ao conectar com o banco de dados: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Relatório de Supervisores</title>
    <link rel="stylesheet" href="estilinho.css">
</head>

<body>
    <a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Supervisores</h1>

    <table border="1">
        <tr>
            <th>Supervisor</th>
            <th>Disponibilidade</th>
            <th>Especialidade</th>
            <th>Telefone</th>
            <th>Carga Horária</th>
            <th>Local de Estágio</th>
            <th>Departamento</th>
            <th>Limite de Vagas</th>
            <th>Fase de Estágio</th>
        </tr>

        <?php
        // Exibir os resultados
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['supervisor_nome']) . "</td>";
            echo "<td>" . htmlspecialchars($row['disponibilidade_horario']) . "</td>";
            echo "<td>" . htmlspecialchars($row['especialidade']) . "</td>";
            echo "<td>" . htmlspecialchars($row['telefone']) . "</td>";
            echo "<td>" . htmlspecialchars($row['carga_horaria']) . "</td>";
            echo "<td>" . htmlspecialchars($row['local_estagio']) . "</td>";
            echo "<td>" . htmlspecialchars($row['departamento']) . "</td>";
            echo "<td>" . htmlspecialchars($row['limite_vagas']) . "</td>";
            echo "<td>" . htmlspecialchars($row['fase_estagio']) . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>

</html>
