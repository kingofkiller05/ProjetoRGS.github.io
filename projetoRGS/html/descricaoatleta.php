<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="imagex/png" href="../img/logo_projeto.png">
    
</head>


<?php

require_once("../conexao/Conexao.php");
require_once("../conexao/funcoes.php");
if (isset($_GET["codigo"])) {
    $codigo = $_GET["codigo"];
} else {
    Header("Location: atletas.php");
}
mysqli_set_charset($conecta, "utf8");

$consultaFilme = "SELECT * FROM filme WHERE codigo_Filme = {$codigo}";
$consultaProducaoFilme = "SELECT * FROM producaoFilme Where codigo_Filme = $codigo";
$consultaComplementares = "SELECT * FROM complementaresFilmes Where codigo_Filme = $codigo";
$detalheFilme = mysqli_query($conecta, $consultaFilme);
$detalheProducaoFilme = mysqli_query($conecta, $consultaProducaoFilme);
$detalheComplementares = mysqli_query($conecta, $consultaComplementares);

if (!$detalheFilme) {
    die("Falha no banco de Dados");
} else {
    $dados_detalheFilme = mysqli_fetch_assoc($detalheFilme);
    $codigoFilme = $dados_detalheFilme['codigo_Filme'];
    $nome_Filme = $dados_detalheFilme['nome_Filme'];
    $sinopse = $dados_detalheFilme['sinopse'];
    $produtora = $dados_detalheFilme['produtora'];
    $data_Lancamento = $dados_detalheFilme['data_Lancamento'];
    $genero = $dados_detalheFilme['genero'];
    $idioma = $dados_detalheFilme['idioma'];
    $receita = $dados_detalheFilme['receita'];
}

if (!$detalheComplementares) {
    die("Falha no Banco de Dados");
} else {
    $dados_detalheComplementares = mysqli_fetch_assoc($detalheComplementares);
    $imagem_capa = $dados_detalheComplementares['imagem_Capa'];
    $trailer1 = $dados_detalheComplementares['link_Trailer1'];
    $trailer2 = $dados_detalheComplementares['link_Trailer2'];
}

?>

<head>
    <!-- <meta charset="UTF-8"> -->
    <meta charset="ISO-8859-15">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/descricaoatletas.css">
    <link rel="stylesheet" href="../css/cabecalho.css">
    <link rel="stylesheet" href="../css/rodape.css">
    <title><?php echo $nome_Filme ?></title>
</head>

<body>
    <div>
        <?php require_once("cabecalho.php"); ?>
    </div>
    <main>
        <div class="conteudo">
            <ul>
                <li>
                    <h1> <?php echo $nome_Filme; ?> </h1>
                </li>
                <li> <img class="imagem_Capa" src="<?php echo $imagem_capa ?>"></li>
                <li class="text1">
                    <h3 class="Subtitulos">Descrição:</h3><?php echo $sinopse; ?>
                </li>
                <li class="text1">
                    <h3 class="Subtitulos">Morador:</h3><?php echo $produtora; ?>
                </li>
                <li class="text1">
                    <h3 class="Subtitulos">Ano de Nascimento:</h3><?php echo $data_Lancamento; ?>
                </li>
                <li class="text1">
                    <h3 class="Subtitulos">Posição:</h3><?php echo $genero; ?>
                </li>           
                <br><br>
                <li>
                    <h3 style="clear:both">Trailer(Português):</h3><?php echo $trailer1 ?>
                </li>
                <li>
                    <h3>Trailer(Original):</h3><?php echo $trailer2 ?>
                </li>
            </ul>
        </div>
    </main>
    <?php
    require_once("rodape.php");
    ?>
</body>

</html>