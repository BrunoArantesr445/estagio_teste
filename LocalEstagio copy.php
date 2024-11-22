<?php
class LocalEstagio {
    private $conn;
    private $table = 'locais_estagio';

    public $id;
    public $nome;
    public $limite_vagas;
    public $horario_disponivel;
    public $professor_id;
    public $especialidade_professor;
    public $fase_estagio;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET nome=:nome, limite_vagas=:limite_vagas, horario_disponivel=:horario_disponivel, professor_id=:professor_id, especialidade_professor=:especialidade_professor, fase_estagio=:fase_estagio";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':nome', $this->nome);
        $stmt->bindParam(':limite_vagas', $this->limite_vagas);
        $stmt->bindParam(':horario_disponivel', $this->horario_disponivel);
        $stmt->bindParam(':professor_id', $this->professor_id);
        $stmt->bindParam(':especialidade_professor', $this->especialidade_professor);
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
