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
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Cadastro de Professor</title>
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Cadastro de Professor</h1>
    <form action="processa_cadastro_professor.php" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="disponibilidade_horario">Disponibilidade de Horário:</label>
        <select id="disponibilidade_horario" name="disponibilidade_horario" required>
        <option value="Manhã">Manhã</option>
            <option value="Tarde">Tarde</option>
            <option value="Noite">Noite</option>
            <option value="Manhã e Tarde">Manhã e Tarde</option>
            <option value="Manhã e Noite">Manhã e Noite</option>
            <option value="Tarde e Noite">Tarde e Noite</option>
        </select><br><br>

        <label for="especialidade">Especialidade:</label>
        <input type="text" id="especialidade" name="especialidade" required><br><br>


        <label for="telefone">Telefone:</label>
        <input type="text" id="telefone" name="telefone" required><br><br>

        <label for="carga_horaria">Carga Horaria:</label>
        <input type="text" id="carga_horaria" name="carga_horaria" required><br><br>

        <input type="submit" value="Cadastrar">
    </form>
    
</body>
</html>
