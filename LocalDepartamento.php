<?php
class LocalDepartamento {
    private $conn;
    private $table = 'locais_estagio';

    public $id;
    public $local;
    public $departamento;
    public $limite_vagas;
    public $especialidade;
    public $horario_disponivel;
    public $fase_estagio;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET local=:local, departamento=:departamento,limite_vagas=:limite_vagas,
         horario_disponivel=:horario_disponivel, especialidade=:especialidade, fase_estagio=:fase_estagio";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':local', $this->local);
        $stmt->bindParam(':departamento', $this->departamento);
        $stmt->bindParam(':limite_vagas', $this->limite_vagas);
        $stmt->bindParam(':horario_disponivel', $this->horario_disponivel);
        $stmt->bindParam(':especialidade', $this->especialidade);
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
