<?php
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
      
        <label for="nome">Local:</label>
        <select id="local" name="local" required>
        <option value=""></option>         
      <?php
      include_once 'Local.php';

    
      $local = new Local($db);
      $stmt = $local->read();
      while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
          echo "<option value='" . $row['id'] . "'>" . $row['instituicao'] .  "</option>";
      }
      ?>
        </select><br><br>

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
            <option value="Manhã e Tarde">Manhã e Tarde</option>
            <option value="Manhã e Noite">Manhã e Noite</option>
            <option value="Tarde e Noite">Tarde e Noite</option>
        </select><br><br>


        <label for="fase_estagio">Fase do Estágio:</label>
        <select id="fase_estagio" name="fase_estagio" required>
        <option value=""></option>
            <option value="UC4">UC4</option>
            <option value="UC7">UC7</option>
            <option value="UC10">UC10</option>
            <option value="UC17">UC17</option>
        </select><br><br>


        <label for="professor_id">Professor Responsável:</label>
        <select id="professor_id" name="professor_id" required>
        <option value=""></option>
            <?php
            include_once 'Professor.php';

          
            $professor = new Professor($db);
            $stmt = $professor->read();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['id'] . "'>" . $row['nome'] . " - " . $row['especialidade'] . "</option>";
            }
            ?>
        </select><br><br>

     
       

        <input type="submit" value="Cadastrar">
    </form>
  
</body>
</html>
