<?php
    //primeiro passo Conexão ao banco
$servidor = "localhost";
$usuario =  "root";
$senha = "";
$banco = "projetoAtletas";
$conecta = mysqli_connect($servidor, $usuario, $senha, $banco);

//passo 2 verificação de falha
if (mysqli_connect_errno()) {
    die("Conexão falhou: " . mysqli_connect_errno());
}
