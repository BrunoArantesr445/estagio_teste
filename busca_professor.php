<?php
include_once 'Database.php';
include_once 'Professor.php'; // Certifique-se de que a classe professor está definida e implementa o método read()
 
$database = new Database();
$db = $database->getConnection();
 
$professor = new professor($db);
 
// Verifica se um nome foi enviado para busca
$nome_busca = isset($_POST['nome_busca']) ? $_POST['nome_busca'] : '';
 
// Busca professors pelo nome se houver um termo de busca
if (!empty($nome_busca)) {
    $stmt = $professor->searchByName($nome_busca);
} else {
    $stmt = $professor->read(); // Retorna todos os professors se não houver busca
}
?>
 
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Busca de professor</title>
    <link rel="stylesheet" type="text/css" href="estiloss.css">
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Busca de professores</h1>
 
    <!-- Formulário de busca -->
    <form action="busca_professor.php" method="post">
        <label for="nome_busca">Buscar professor por Nome:</label>
        <input type="text" id="nome_busca" name="nome_busca" value="<?php echo htmlspecialchars($nome_busca); ?>">
        <input type="submit" value="Buscar">
    </form>
 
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Disponibilidade de Horário</th>
                <th>Especialidade</th>
                <th>Telefone</th>
                <th>Carga Horaria</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Verifica se existem registros
            if ($stmt->rowCount() > 0) {
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($row['nome']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['disponibilidade_horario']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['especialidade']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['telefone']) . "</td>";
                    echo "<td>" . htmlspecialchars($row['carga_horaria']) . "</td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='9'>Nenhum professor encontrado.</td></tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>