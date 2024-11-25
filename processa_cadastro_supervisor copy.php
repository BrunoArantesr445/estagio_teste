<?php
include_once 'Database.php';
include_once 'supervisor.php';

$database = new Database();
$db = $database->getConnection();

$supervisor = new supervisor($db);

// Atribuição dos valores recebidos via POST
$supervisor->nome = $_POST['nome'];
$supervisor->disponibilidade_horario = $_POST['disponibilidade_horario'];
$supervisor->especialidade = $_POST['especialidade'];
$supervisor->telefone = $_POST['telefone'];
$supervisor->carga_horaria = $_POST['carga_horaria']; // Corrigido aqui para 'carga_horaria'

if ($supervisor->create()) {
    $msg = "supervisor cadastrado com sucesso.";  // Mensagem de sucesso
    header("Location: index.php?txt=" . urlencode($msg)); // Redireciona com a mensagem
    exit(0);
} else {
    $msg = "Não foi possível cadastrar o supervisor.";  // Mensagem de erro
    header("Location: index.php?txt=" . urlencode($msg)); // Redireciona com a mensagem
    exit(0);
}
?>
