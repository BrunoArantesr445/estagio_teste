<?php
session_start();  // Inicia a sessão
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Login - Controle de Estágio</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <h1>Login</h1>
    <form action="autenticar.php" method="post">
        <label for="login">Login:</label>
        <input type="text" id="login" name="login" required><br><br>

        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required><br><br>

        <input type="submit" value="Entrar">
    </form>
    <?php
    if(isset($_SESSION['erro'])) {
        echo "<p style='color:red;'>".$_SESSION['erro']."</p>";
        unset($_SESSION['erro']);
    }
    ?>
</body>
</html>
