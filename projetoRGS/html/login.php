<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="shortcut icon" type="imagex/png" href="../img/logo_projeto.png">
    <title>Login RGS</title>
</head>

<?php
session_start();

// Conexão com o banco de dados
$conn = new mysqli("localhost", "root", "", "projetoAtletas");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

// Processamento do formulário de login
if (isset($_POST['loginEmail']) && isset($_POST['loginPassword'])) {
    $email = $_POST['loginEmail'];
    $senha = $_POST['loginPassword'];

    // Verifique se o email e a senha correspondem aos valores específicos desejados
    $email_admin = 'cantinaGeV@gmail.com'; // Substitua pelo email desejado
    $senha_admin = 'GeVadministracao'; // Substitua pela senha desejada

    if ($email === $email_admin && $senha === $senha_admin) {
        $_SESSION['loggedin'] = true;
        $_SESSION['email'] = $email;

        // Redirecionar para a página de administração
        header("Location: administracao.php");
        exit();
    }

    $stmt = $conn->prepare("SELECT id_usuario, email, senha_hash FROM usuarios WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $hashed_password = $row['senha_hash'];

        if (password_verify($senha, $hashed_password)) {
            $_SESSION['loggedin'] = true;
            $_SESSION['email'] = $email;
            $_SESSION['id_usuario'] = $row["id_usuario"];
            // Redirecionar para a página após o login (ajuste conforme necessário)
            header("Location: home.html");
            exit();
        } else {
            $_SESSION['mensagem'] = array('tipo' => 'erro', 'texto' => 'Login falhou. Por favor, verifique seu e-mail e senha.');
        }
    } else {
        $_SESSION['mensagem'] = array('tipo' => 'erro', 'texto' => 'Login falhou. Por favor, verifique seu e-mail e senha.');
    }

    $stmt->close();
}

// Processamento do formulário de cadastro
if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['password']) && isset($_POST['cpf'])) {
    $nome = $_POST['name'];
    $email = $_POST['email'];
    $senha = $_POST['password'];
    $cpf = $_POST['cpf'];

     // Verificar se o e-mail já está em uso
     $stmt_check_email = $conn->prepare("SELECT id_usuario FROM usuarios WHERE email = ?");
     $stmt_check_email->bind_param("s", $email);
     $stmt_check_email->execute();
     $result_check_email = $stmt_check_email->get_result();

     // Verificar se o CPF já está em uso
    $stmt_check_cpf = $conn->prepare("SELECT id_usuario FROM usuarios WHERE cpf = ?");
    $stmt_check_cpf->bind_param("s", $cpf);
    $stmt_check_cpf->execute();
    $result_check_cpf = $stmt_check_cpf->get_result();

    // Use instruções preparadas para evitar SQL Injection
    $stmt = $conn->prepare("INSERT INTO usuarios (nome, email, senha_hash, cpf) VALUES (?, ?, ?, ?)");
    $hashed_password = password_hash($senha, PASSWORD_DEFAULT);
    $stmt->bind_param("ssss", $nome, $email, $hashed_password, $cpf);

    if ($stmt->execute()) {
        $_SESSION['mensagem'] = array('tipo' => 'sucesso', 'texto' => 'Cadastro realizado com sucesso!');
    } else {
        $_SESSION['mensagem'] = array('tipo' => 'erro', 'texto' => 'Erro ao cadastrar: ' . $stmt->error);
    }

    $stmt->close();
    $stmt_check_email->close();
    $stmt_check_cpf->close();
}

$conn->close();
?>


<body>
    <div class="mensagem">
        <?php
        // Exibir mensagens de sucesso ou erro aqui
        if (isset($_SESSION['mensagem'])) {
            echo '<div class="' . $_SESSION['mensagem']['tipo'] . '">' . $_SESSION['mensagem']['texto'] . '</div>';
            unset($_SESSION['mensagem']); // Limpar a mensagem para que ela não seja exibida novamente
        }
        ?>
    </div>
    <div class="conteudo">
        <input type="checkbox" class="checkbox" id="checkbox">
        <label for="checkbox"></label>
        <button id="toggleButton">Alternar para Cadastro</button>
        <div class="card-3d-wrap">
            <div class="card-3d-wrapper">
                <div class="card-front">
                    <form class="form" method="post">
                        <img src="../img/mascote_teste.png" alt="img mascote" style="height: 150px; width: 150px;">
                        <h2>Login</h2>
                        <div class="form-group">
                            <label for="loginEmail">Email:</label>
                            <input type="email" id="loginEmail" name="loginEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="loginPassword">Senha:</label>
                            <input type="password" id="loginPassword" name="loginPassword" required>
                        </div>
                        <button type="submit" class="CadEnt">Entrar</button>
                    </form>
                </div>
                <div class="card-back">
                    <form class="form" method="post">
                        <h2>Cadastro</h2>
                        <div class="form-group">
                            <label for="name">Nome:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
    <label for="cpf">CPF:</label>
    <input type="text" id="cpf" name="cpf" required maxlength="14" oninput="atualizarFormato(this)">
</div>
<div class="form-group">
    <label for="Celular">Celular:</label>
    <input type="text" id="Celular" name="Celular" maxlength="15" oninput="atualizarFormato(this)">
</div>
                        <div class="form-group">
                            <label for="password">Senha:</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <button type="submit" class="CadEnt">Cadastrar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    const checkbox = document.getElementById("checkbox");
    const toggleButton = document.getElementById("toggleButton");

    toggleButton.addEventListener("click", function () {
        // Alterne o estado do checkbox ao clicar no botão
        checkbox.checked = !checkbox.checked;

        // Altere o texto do botão com base no estado do checkbox
        toggleButton.textContent = checkbox.checked ? "Alternar para Login" : "Alternar para Cadastro";
    });
    // Função para formatar CPF
    function formatarCPF(cpf) {
        cpf = cpf.replace(/\D/g, ''); // Remove caracteres não numéricos
        cpf = cpf.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
        return cpf;
    }

    // Função para formatar Celular
    function formatarCelular(celular) {
        celular = celular.replace(/\D/g, ''); // Remove caracteres não numéricos
        celular = celular.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
        return celular;
    }

    // Função para atualizar o valor formatado nos campos
    function atualizarFormato(input) {
        var valor = input.value;

        if (input.id === 'cpf') {
            input.value = formatarCPF(valor);
        } else if (input.id === 'Celular') {
            input.value = formatarCelular(valor);
        }
    }
</script>

</html>