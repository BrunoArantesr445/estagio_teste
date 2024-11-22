<?php
include_once 'Database.php';
include_once 'Professor.php';

$database = new Database();
$db = $database->getConnection();

$professor = new Professor($db);

// Atribuição dos valores recebidos via POST
$professor->nome = $_POST['nome'];
$professor->disponibilidade_horario = $_POST['disponibilidade_horario'];
$professor->especialidade = $_POST['especialidade'];
$professor->telefone = $_POST['telefone'];
$professor->carga_horaria = $_POST['carga_horaria']; // Corrigido aqui para 'carga_horaria'

if ($professor->create()) {
    $msg = "Professor cadastrado com sucesso.";  // Mensagem de sucesso
    header("Location: index.php?txt=" . urlencode($msg)); // Redireciona com a mensagem
    exit(0);
} else {
    $msg = "Não foi possível cadastrar o professor.";  // Mensagem de erro
    header("Location: index.php?txt=" . urlencode($msg)); // Redireciona com a mensagem
    exit(0);
}
?>
