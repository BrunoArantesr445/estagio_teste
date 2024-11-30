<?php
session_start();  // Inicia a sessão
// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="estiloss.css">
    <title>Relatório de Todas As Reservas</title>
</head>
<body>
    <a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Todas As Reservas</h1>
    <table border="1">
        <tr>
            <th>ID Alocação</th>
            <th>Nome do Aluno</th>
            <th>Supervisor</th>
            <th>Falta</th>
        </tr>
        <?php
        include_once 'Database.php';
        include_once 'Alocacao.php';

        $database = new Database();
        $db = $database->getConnection();

        $alocacao = new Alocacao($db);
        $stmt = $alocacao->readAllReservas();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars(date("d/m/Y", strtotime($row['data']))) . "</td>";
            echo "<td>" . htmlspecialchars($row['aluno_nome']) . "</td>";
            echo "<td>" . htmlspecialchars($row['supervisor_nome']) . "</td>";
            echo "<td>" . htmlspecialchars($row['fatla'] ?? 'N/A') . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>
