<?php
//print_r($_POST);


include_once 'Database.php';
include_once 'Aluno.php';

$database = new Database();
$db = $database->getConnection();

$aluno = new Aluno($db);

$aluno->nome = $_POST['nome'];
$aluno->disponibilidade_horario = $_POST['disponibilidade_horario'];
$aluno->fase_estagio = $_POST['fase_estagio'];
$aluno->email = $_POST['email'];
$aluno->telefone = $_POST['telefone'];
$aluno->cpf = $_POST['cpf'];
$aluno->turma = $_POST['turma'];
$aluno->status = $_POST['status'];
$aluno->carga_horaria = $_POST['carga_horaria'];

if ($aluno->create()) {
    echo $msg = "Aluno_cadastrado_com_sucesso.";
    header("location: index.php?txt=$msg");
    exit(0);
} else {
    echo $msg = "Não_foi_possível_cadastrar_o_aluno.";
    header("location: index.php?txt=$msg");
    exit(0);
}

?>
