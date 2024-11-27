<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    // Se não estiver autenticado, redireciona para a página de login
    header("Location: login.php");
    exit();  // Garantir que o código pare de executar após o redirecionamento
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Sistema de Controle de Estágios</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Sistema de Controle de Estágios</h1>
    <nav>
        <ul>
            <li><a href="cadastro_aluno.php">Cadastro de Aluno</a></li>
            <li><a href="cadastro_surpervisor.php">Cadastro de Supervisor</a></li>
            <li><a href="cadastro_local_estagio.php">Cadastro de Local de Estágio</a></li>
            <li><a href="cadastro_departamento_estagio.php">Cadastro de Departamento de Estágio</a></li>
            <li><a href="cadastro_alocacao.php">Cadastro de Alocação</a></li>
            </ul>  
            <hr>
            <ul>
            <li><a href="relatorio_aluno.php">Relatório de Aluno</a></li>
            <li><a href="relatorio_supervisor.php">Relatório de Supervisor</a></li>
            <li><a href="relatorio_local.php">Relatório de Local de Estágio</a></li>
            <li><a href="relatorio_local_estagio.php">Relatório de Departamento de Estágio</a></li>
            <li><a href="relatorio_alocacoes.php">Relatório de Alocações</a></li>
        </ul>
        <hr>
            <ul>
            <li><a href="busca_aluno.php">Busca Aluno</a></li>
            <li><a href="busca_supervisor.php">Busca Supervisor</a></li>
        </ul>
        <hr>
            <ul>
            <li><a href="agenda.php">Agenda do Dia</a></li>
            <li><a href="logout.php">Sair</a></li>
        </ul>
    </nav>
</body>
</html>
