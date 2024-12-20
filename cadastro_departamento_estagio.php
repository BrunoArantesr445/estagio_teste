<?php
session_start();  // Inicia a sessão
// Verifica se o usuário está autenticado
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();
}

    include_once 'Database.php';
    $database = new Database();
    $db = $database->getConnection();
    include_once 'Local.php';
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Cadastro de Departamento de Estágio</title>
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Cadastro de Departamento de Estágio</h1>
    <form action="processa_cadastro_departamento_estagio.php" method="post">
      
       

        <label for="departamento">Nome do Departamento:</label>
        <input type="text" id="departamento" name="departamento" required><br><br>

        <label for="especialidade_departamento">Especialidade do Departamento:</label>
        <input type="text" id="especialidade" name="especialidade" required><br><br>

        <label for="limite_vagas">Limite de Vagas:</label>
        <input type="number" id="limite_vagas" name="limite_vagas" required><br><br>

        <label for="horario_disponivel">Horário Disponível:</label>
        <select id="horario_disponivel" name="horario_disponivel" required>           
        <option value="Manhã">Manhã</option>
            <option value="Tarde">Tarde</option>
            <option value="Noite">Noite</option>
        </select><br><br>


        <label for="fase_estagio">Fase do Estágio:</label>
        <select id="fase_estagio" name="fase_estagio" required>
        <option value=""></option>
            <option value="UC4">UC4</option>
            <option value="UC7">UC7</option>
            <option value="UC10">UC10</option>
            <option value="UC17">UC17</option>
        </select><br><br>
        <label for="supervisor_id">Supervisor Responsável:</label>
        <select id="supervisor_id" name="supervisor_id" required>
        <option value=""></option>
            <?php
            include_once 'Supervisor.php';
            $supervisor = new supervisor($db);
            $stmt = $supervisor->read();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['id'] . "'>" . $row['nome'] . " - " . $row['especialidade'] . "</option>";
            }
            ?>
        </select>
        <input type="submit" value="Cadastrar">
    </form>
  
</body>
</html>
