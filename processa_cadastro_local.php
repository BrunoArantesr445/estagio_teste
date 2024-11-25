<?php
include_once 'Database.php';
include_once 'Local.php';

$database = new Database();
$db = $database->getConnection();

$local  = new Local($db);

$local->instituicao = $_POST['instituicao'];
$local->especialidade = $_POST['especialidade'];
$local->departamento = $_POST['departamento'];
$local->turno = $_POST['turno'];
$local->disponibilidade = $_POST['disponibilidade'];
$local->observacao = $_POST['observacao'];

if ($local->create()) {
    $msg = "Local_cadastrado_com_sucesso.";   
    header("location: index.php?txt=$msg");
    exit;
} else {
    $msg = "Não_foi_possível_cadastrar_o_Local.";   
    header("location: index.php?txt=$msg");
    exit;
}
?>
