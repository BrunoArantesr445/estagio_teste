<?php
include_once 'Database.php';
include_once 'LocalEstagio.php';

$database = new Database();
$db = $database->getConnection();

$local_estagio = new LocalEstagio($db);

$local_estagio->nome = $_POST['nome'];
$local_estagio->limite_vagas = $_POST['limite_vagas'];
$local_estagio->horario_disponivel = $_POST['horario_disponivel'];
$local_estagio->professor_id = $_POST['professor_id'];
$local_estagio->especialidade_professor = $_POST['especialidade_professor'];
$local_estagio->fase_estagio = $_POST['fase_estagio'];

if ($local_estagio->create()) {
    echo $msg ="Local_de_estagio_cadastrado_com_sucesso.";
     header("location: index.php?txt=$msg");
    exit(0);
} else {
    echo $msg ="Não_foi_possivel_cadastrar_o_local_de_estagio.";
        header("location: index.php?txt=$msg");
    exit(0);
}
?>

