<?php

class Alocacao {
    private $conn;
    private $table = 'alocacoes'; // Nome da sua tabela no banco

    public $id;
    public $nome;
    public $local;
    public $departamento;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " (nome, local, departamento) VALUES (:nome, :local, :departamento)";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':nome', $this->nome);
        $stmt->bindParam(':local', $this->local);
        $stmt->bindParam(':departamento', $this->departamento);

        try {
            return $stmt->execute();
        } catch (PDOException $e) {
            echo "Erro ao cadastrar alocação: " . $e->getMessage();
            return false;
        }
    }

    public function read() {
        $query = "SELECT id, nome, local, departamento FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}
?>
