<html lang="en">

<head>
    <!--  <meta charset="UTF-8"> -->
    <meta charset="ISO-8859-15">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/atletas.css"> 
    <link rel="stylesheet" href="../css/cabecalho.css"> 
    <link rel="shortcut icon" type="imagex/png" href="../img/logo_projeto.png">
    <title>Atletas</title>
</head>

<body>
    <?php
    require_once("../conexao/Conexao.php");
    mysqli_set_charset($conecta, "utf8");
    require_once("cabecalho.php");
    $consultaComplementaresFilmes = "SELECT * FROM complementaresFilmes";
    $consultaFilmes = "SELECT * FROM filme where codigo_filme = ";
    $consultaProducaoFilme = "SELECT * FROM producaofilme where codigo_filme == ";

    $_consultaComplementaresFilme = mysqli_query($conecta, $consultaComplementaresFilmes);


    if (!$_consultaComplementaresFilme) {
        die("Falha na consulta ao banco de dados");
    }


    ?>    
    <br><br><br><br>
    <main>
        <h1>Nossos Atletas</h1>
        <ul class="container">
            <?php //Exemplo de funcionamento.
            $_i = 0;
            while ($registro = mysqli_fetch_array($_consultaComplementaresFilme)) {
                $codigoFilme = $registro["codigo_Filme"];
                $consultaNomeFilme = "SELECT nome_Filme, sinopse FROM filme WHERE codigo_Filme = $codigoFilme";
                $_consultaNomeFilme = mysqli_query($conecta, $consultaNomeFilme);
                $registroNomeFilme = mysqli_fetch_array($_consultaNomeFilme);
            ?>
                <div class="conteudo">
                    <div class="hover-text">
                        <li class="item">
                            <?php echo $registro["codigo_Filme"] . " - " . $registroNomeFilme["nome_Filme"]; ?>
                            <a href="descricaoatleta.php?codigo=<?php echo $registro["codigo_Filme"] ?>" target="_blank">
                                <img class="imagem_capa" src="<?php echo $registro["imagem_Capa"] ?>">
                                <span class="tooltip-text" id="fade"><?php echo $registroNomeFilme["sinopse"]; ?></span>
                            </a>
                        </li>
                    </div>
                </div>
                <br>
            <?php
            }
            ?>
        </ul>
    </main>

    <?php
    
    mysqli_free_result($_consultaComplementaresFilme);
    mysqli_free_result($_consultaNomeFilme);
    mysqli_close($conecta);
    ?>

</body>

</html>