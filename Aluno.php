<?php
class Aluno {
    private $conn;
    private $table = 'alunos';

    public $id;
    public $nome;
    public $disponibilidade_horario;
    public $fase_estagio;
    public $email;
    public $telefone;
    public $cpf;
    public $turma;
    public $status;
    public $carga_horaria;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET 
            nome=:nome, 
            disponibilidade_horario=:disponibilidade_horario, 
            fase_estagio=:fase_estagio,
            email=:email,
            telefone=:telefone,
            cpf=:cpf,
            turma=:turma,
            status=:status,
            carga_horaria=:carga_horaria";
        
        $stmt = $this->conn->prepare($query);

        // Bind dos parâmetros
        $stmt->bindParam(':nome', $this->nome);
        $stmt->bindParam(':disponibilidade_horario', $this->disponibilidade_horario);
        $stmt->bindParam(':fase_estagio', $this->fase_estagio);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':telefone', $this->telefone);
        $stmt->bindParam(':cpf', $this->cpf);
        $stmt->bindParam(':turma', $this->turma);
        $stmt->bindParam(':status', $this->status);
        $stmt->bindParam(':carga_horaria', $this->carga_horaria);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function read() {
        $query = "SELECT id,nome, disponibilidade_horario, fase_estagio, email, telefone, cpf, turma, status, carga_horaria FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
 
    // Método para buscar alunos pelo nome
    public function searchByName($nome) {
        $query = "SELECT nome, disponibilidade_horario, fase_estagio, email, telefone, cpf, turma, status, carga_horaria FROM " . $this->table . " WHERE nome LIKE :nome";
        $stmt = $this->conn->prepare($query);
        $nome = "%" . $nome . "%"; // Adiciona os curingas para busca parcial
        $stmt->bindParam(':nome', $nome);
        $stmt->execute();
        return $stmt;
    }


    
    // public function read() {
    //     $query = "SELECT * FROM " . $this->table;
    //     $stmt = $this->conn->prepare($query);
    //     $stmt->execute();
    //     return $stmt;
    // }

//     public function buscarPorNome($nome) {
//         $query = "SELECT * FROM " . $this->table . " WHERE nome LIKE :nome";
//         $stmt = $this->conn->prepare($query);
//         $stmt->bindValue(':nome', "%" . $nome . "%", PDO::PARAM_STR);
//         $stmt->execute();
//         return $stmt->fetchAll(PDO::FETCH_ASSOC);
//     }



 }
?>
