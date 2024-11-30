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

    public function readAllReservas() {
        $query = "
            SELECT 
                r.id AS reserva_id,
                r.data,
                a.nome AS aluno_nome,
                s.nome AS supervisor_nome,
                r.fatla
            FROM 
                reserva r
            JOIN 
                alunos a ON r.alunos_id = a.id
            JOIN 
                supervisor s ON r.supervisor_id = s.id
            ORDER BY 
                r.data DESC;
        ";

        $stmt = $this->conn->prepare($query);

        try {
            $stmt->execute();
            return $stmt; // Retorna o PDOStatement para processamento
        } catch (PDOException $e) {
            echo "Erro ao buscar reservas: " . $e->getMessage();
            return null;
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
