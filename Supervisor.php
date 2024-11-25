<?php
class supervisor {
    private $conn;
    private $table = 'supervisores';

    public $id;
    public $nome;
    public $disponibilidade_horario;
    public $especialidade;
    public $telefone;
    public $carga_horaria;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET nome=:nome, disponibilidade_horario=:disponibilidade_horario, especialidade=:especialidade, telefone=:telefone, carga_horaria=:carga_horaria";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':nome', $this->nome);
        $stmt->bindParam(':disponibilidade_horario', $this->disponibilidade_horario);
        $stmt->bindParam(':especialidade', $this->especialidade);
        $stmt->bindParam(':telefone', $this->telefone);
        $stmt->bindParam(':carga_horaria', $this->carga_horaria);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function read() {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Adicionando o método readById
    public function readById($id) {
        $query = "SELECT * FROM " . $this->table . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        // Bind ID
        $stmt->bindParam(1, $id);

        $stmt->execute();

        // Verifique se encontrou algum resultado
        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            // Atribuindo valores às propriedades do objeto
            $this->id = $row['id'];
            $this->nome = $row['nome'];
            $this->disponibilidade_horario = $row['disponibilidade_horario'];
            $this->especialidade = $row['especialidade'];

            return $row; // Retorna o array de dados
        } else {
            return null; // Retorna null se não encontrar o supervisor
        }
    }


     // Método para buscar alunos pelo nome
     public function searchByName($nome) {
        $query = "SELECT nome, disponibilidade_horario, especialidade, telefone, carga_horaria FROM " . $this->table . " WHERE nome LIKE :nome";
        $stmt = $this->conn->prepare($query);
        $nome = "%" . $nome . "%"; // Adiciona os curingas para busca parcial
        $stmt->bindParam(':nome', $nome);
        $stmt->execute();
        return $stmt;
    }
}
?>
