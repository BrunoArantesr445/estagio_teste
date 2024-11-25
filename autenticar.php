<?php
session_start();

// Defina o login e a senha predefinidos
$login_valido = 'keila';  // Login predefinido
$senha_valida = '12345';  // Senha predefinida

// Verifica se os campos foram preenchidos
if (isset($_POST['login']) && isset($_POST['senha'])) {
    $login = $_POST['login'];
    $senha = $_POST['senha'];

    // Verifica se o login e senha são válidos
    if ($login === $login_valido && $senha === $senha_valida) {
        $_SESSION['usuario'] = $login;  // Armazena o login do usuário na sessão
        header("Location: index.php"); // Redireciona para a página principal
        exit();
    } else {
        // Se o login ou senha estiverem incorretos, exibe erro
        $_SESSION['erro'] = "Login ou senha inválidos!";
        header("Location: login.php");
        exit();
    }
} else {
    // Caso os dados não sejam enviados, redireciona de volta para o login
    $_SESSION['erro'] = "Preencha todos os campos!";
    header("Location: login.php");
    exit();
}
?>
