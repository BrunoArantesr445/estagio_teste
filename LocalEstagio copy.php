<?php
class LocalEstagio {
    private $conn;
    private $table = 'locais_estagio';

    public $id;
    public $nome;
    public $limite_vagas;
    public $horario_disponivel;
    public $supervisor_id;
    public $especialidade_supervisor;
    public $fase_estagio;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET nome=:nome, limite_vagas=:limite_vagas, horario_disponivel=:horario_disponivel, supervisor_id=:supervisor_id, especialidade_supervisor=:especialidade_supervisor, fase_estagio=:fase_estagio";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':nome', $this->nome);
        $stmt->bindParam(':limite_vagas', $this->limite_vagas);
        $stmt->bindParam(':horario_disponivel', $this->horario_disponivel);
        $stmt->bindParam(':supervisor_id', $this->supervisor_id);
        $stmt->bindParam(':especialidade_supervisor', $this->especialidade_supervisor);
        $stmt->bindParam(':fase_estagio', $this->fase_estagio);

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
}
?>
