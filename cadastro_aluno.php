<?php
session_start();  // Inicia a sessão
// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}
include_once 'Database.php';
include_once 'Fase.php';



$database = new Database();
$db = $database->getConnection();

$fase = new Fase($db);
$fases = $fase->read();
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Aluno</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Cadastro de Aluno</h1>
    <form action="processa_cadastro_aluno.php" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="turno_disponivel">Disponibilidade de Horário:</label>
        <select id="turno_disponivel" name="turno_disponivel" required>
            <option value="Manhã">Manhã</option>
            <option value="Tarde">Tarde</option>
            <option value="Noite">Noite</option>
        </select><br><br>

        <label for="fase_estagio">Fase do Estágio:</label>
        <select id="fase_estagio" name="fase_estagio" required>
            <option value="1ª Fase">UC4</option>
            <option value="2ª Fase">UC7</option>
            <option value="3ª Fase">UC10</option>
            <option value="3ª Fase">UC17</option>

<?php
            $fase = new Fase($db);
$stmt = $fase->read();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo "<option value='" . $row['id'] . "'>" . $row['nome'] . "</option>";
}
?>
        </select><br><br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br><br>


        <label for="telefone">Telefone:</label>
        <input type="text" id="telefone" name="telefone" required><br><br>

        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" required><br><br>


        <label for="turma">Turma:</label>
        <input type="text" id="turma" name="turma" required><br><br>


        <label for="status">Status:</label>
        <input type="text" id="status" name="status" required><br><br>

        <label for="carga_horaria">Carga Horaria:</label>
        <input type="text" id="carga_horaria" name="carga_horaria" required><br><br>


        <input type="submit" value="Cadastrar">
    </form>
   
</body>
</html>
