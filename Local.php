<?php
class Local {
    private $conn;
    private $table = 'local';

    public $id;
    public $instituicao;  // Corrigido o nome da variável
    public $especialidade;
    public $departamento;
    public $turno;
    public $disponibilidade;
    public $observacao;
  
    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET instituicao=:instituicao,especialidade=:especialidade,departamento=:departamento,turno=:turno,disponibilidade=:disponibilidade,observacao=:observacao";
        $stmt = $this->conn->prepare($query);

        // Atualizado o bind para ':instituicao' e a variável correta
        $stmt->bindParam(':instituicao', $this->instituicao);
        $stmt->bindParam(':especialidade', $this->especialidade);
        $stmt->bindParam(':departamento', $this->departamento);
        $stmt->bindParam(':turno', $this->turno);
        $stmt->bindParam(':disponibilidade', $this->disponibilidade);
        $stmt->bindParam(':observacao', $this->observacao);

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
            $this->instituicao = $row['instituicao'];

            return $row; // Retorna o array de dados
        } else {
            return null; // Retorna null se não encontrar o registro
        }
    }
}
?>
