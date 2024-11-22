<?php
include_once 'Database.php';
include_once 'Alocacao.php';

$database = new Database();
$db = $database->getConnection();

$alocacao = new Alocacao($db);

$alocacao->nome = $_POST['nome'];
$alocacao->local = $_POST['local'];
$alocacao->departamento = $_POST['departamento'];

if ($alocacao->create()) {
    $msg = "Alocacao_registrada_com_sucesso.";
    header("location: index.php?txt=$msg");
    exit(0);
} else {
    $msg = "Nao_foi_possível_registrar_a_alocacao.";
    header("location: index.php?txt=$msg");
    exit(0);
}
?>
