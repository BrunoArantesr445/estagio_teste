<?php
class Fase {
    private $conn;
    private $table_name = "fases";

    public $id;
    public $nome;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para buscar todas as fases
    public function read() {
        $query = "SELECT * FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para buscar uma fase pelo ID
    public function readById($id) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        // Bind do ID
        $stmt->bindParam(1, $id);
        $stmt->execute();

        // Obtenha os dados
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            // Atribua os valores encontrados às propriedades do objeto
            $this->id = $row['id'];
            $this->nome = $row['nome'];
        }

        return $row; // Retorna a linha encontrada (ou false se não encontrar)
    }
}
?>
