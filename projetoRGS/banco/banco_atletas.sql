drop database projetoAtletas;
create database projetoAtletas;
use projetoAtletas;


CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE
);


create table filme(
codigo_Filme int NOT NULL AUTO_INCREMENT,
nome_Filme varchar(100) CHARACTER SET utf8mb4,
sinopse varchar(2000) CHARACTER SET utf8mb4,
produtora varchar(50),
data_Lancamento date,
genero varchar(50),
idioma varchar(15),
receita double(12,2),
PRIMARY KEY (codigo_Filme)
);

create table complementaresFilmes(
codigo_Complementares int NOT NULL AUTO_INCREMENT,
codigo_Filme int NOT NULL,
imagem_Capa varchar(100),
link_Trailer1 varchar(400),
link_Trailer2 varchar(400),
PRIMARY KEY (codigo_Complementares),
foreign key (codigo_Filme) REFERENCES filme(codigo_Filme)
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero, idioma, receita) values (
'Isaac Wenderson',
'Isaac, Idealizador do projeto, Morador da Vila Conde; é um ótimo central, mas nesta Temporada entra como Ponteiro ',
'Morador da Vila Conde Rio Grande da Serra',
 '2000-07-22',
'Ponteiro',
'ingles',
3000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero, idioma, receita) values (
'Luan Rodrigues',
'Luan Rodrigues,levantador é morador de Mauá, é um excelente levantador.', 
'Mauá', 
'2000-07-22', 
'Levantador', 
'ingles', 
225000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero, idioma, receita) values (
'Felipe Isaque',
'Um dos nosso Centrais, Felipe Isaque, morador da Pedreira é um centrak com um saque impecável e tem um otimo ataque.',
'Pedreira',
 '2006-05-04',
'central', 
'ingles', 
215000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero, idioma, receita) values (
'Kauã dos Santos',
'Kauã é um dos nossos líberos,morador da Pedreira',
'Pedreira', 
'2007-01-09', 
'Líbero', 
'ingles',  
796688549
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero, idioma, receita) values (
'Cesar Henrique', 
'Cesar, um ponteiro com ataque e saque afiados, vem com tudo nessa temporada, Morador da Vila Lopes',
'Vila Lopes ', 
'2002-05-04',
'Ponteiro',
'ingles', 
701800000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero, idioma, receita) values (
'Julio Gomes',
'Um dos nossos reforços como Oposto, Morador da Vila Niwa', 
'Vila Niwa', 
'2004-05-09', 
'Oposto', 
'Português',
138000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero,  idioma, receita) values (
'Jonh Alisson',
'Jonh um dos nossos centrais que vem com tudo nessa temporada é um dos responsáveis pelo projeto, morador da Vila Conde ',
'Vila Conde', 
'2000-06-04', 
'Central', 
'ingles',
250000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero,  idioma, receita) values (
'Alex Lopes', 
'Alex, chega para somar no projeto, Morador do Recanto das Flores',
'Recanto das Flores',
 '2000-02-07', 
'Ponteiro', 
'Ingles', 
90000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero,  idioma, receita) values (
'Murilo Rosa', 
'Murilo Rosa,baixinho,mas defende bem, um dos nossos líbeors, mmorador do Recando Alpino.',
'Recanto Alpino',
 '2000-12-04', 
'Líbero', 
'Ingles', 
90000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero,  idioma, receita) values (
'Luiz Daniel', 
'Luiz Daniel, um dos nossos Ponteiros e morador da Vila Niwa',
'Vila Niwa', 
'2006-06-09',
'Ponteiro',
'ingles', 
15000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero,  idioma, receita) values (
'Higor Oliveira', 
'Higor Oliveira, um dos nossos reforços adulto e morador da Vila Lopes',
'Vila Lopes', 
'2006-06-09',
'Oposto',
'ingles', 
15000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero,  idioma, receita) values (
'Nicolas Soares', 
'Nicolas, é um dos nossos talentosos levantadores e morador da Pedreira',
'Pedreira', 
'2006-06-09',
'Levantador',
'ingles', 
15000000000
);

insert into filme(nome_Filme,sinopse, produtora, data_Lancamento, genero,  idioma, receita) values (
'Igor Henrique', 
'Igor Henrique, nosso incrível ponteiro, morador da Vila Conde',
'Vila Conde', 
'2006-06-09',
'Ponteiro',
'ingles', 
15000000000
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
1,
'../img/isaac.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/AaUdMfh5j3U" title="Amor e Monstros com Dylan O&#39;Brien | Trailer oficial | Netflix" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/gTJ90qYZpbs" title="Amor e Monstros - Trailer Dublado" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
2,
'../img/luan.jpeg',
'<iframe width="1110" height="480" src="https://www.youtube.com/embed/hLC3l4gnq0c" title="As Crônicas de Nárnia O Leão, A Feiticeira e o Guarda Roupa Trailer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/8AUQqspFRK8" title="As Crônicas de Nárnia Príncipe Caspian  Trailer Dublado" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
3,
'../img/felipe.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/QmL1mdzS544" title="Esposa de Mentirinha | Trailer Legendado" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/QmL1mdzS544" title="Esposa de Mentirinha | Trailer Legendado" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
4,
'../img/kauã.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/e02fwhC6DiQ" title="Harry Potter e o Prisioneiro de Azkaban (2004) | Trailer [Legendado]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/wCPMK0UVXB8" title="HARRY POTTER e o Prisioneiro de Azkaban - Todos os Trailers (Dublado/Legendado)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
5,
'../img/cesar.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/dD264ZjfKlk" title="IT: A Coisa - Trailer Teaser Oficial (leg) [HD]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/22QjxPHkE1g" title="IT - A Coisa | Teaser Trailer | Dublado (PT-BR) 2017" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
6,
'../img/julio.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/vQs31hCrUU8" title="Minha Mãe é Uma Peça 3 - O Filme | Trailer Oficial" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/xu-L43LVFvA" title="E se &quot;Minha Mãe é uma Peça 3&quot; Fosse em Inglês? (Paródia)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
7,
'../img/jonh.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/ZewCCWbPlsY" title="Mistério no Mediterrâneo | Trailer | Netflix" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/M5AWLJgMZh0" title="Trailer – Mistério no Mediterrâneo [DUBLADO] | TeleFilms Plus" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
8,
'../img/alex.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/eRVknc7kQGQ" title="Oito mulheres e um segredo - Trailer Oficial (leg) [HD]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/vw7T1TKt87o" title="Oito Mulheres e um Segredo 2018 TVRip globo Dublado" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
9,
'../img/murilo_rosa.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/uL-ZfWOpVh0" title="Percy Jackson e o Mar de Monstros - Trailer Legendado (HD)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/RTI76Cpbdy0" title="Percy Jackson e o Mar de Monstros - Trailer Dublado Oficial [HD]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
10,
'../img/Luiz_daniel.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/Y8lGJmmO0kM" title="FILME INFANTIL!! TÔ DE FÉRIAS dublado em português" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="764" height="573" src="https://www.youtube.com/embed/EsRLjE8Dufg" title="TRAILER DO FILME Tô de Férias (DUBLADO)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
11,
'../img/Higor.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/Y8lGJmmO0kM" title="FILME INFANTIL!! TÔ DE FÉRIAS dublado em português" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="764" height="573" src="https://www.youtube.com/embed/EsRLjE8Dufg" title="TRAILER DO FILME Tô de Férias (DUBLADO)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
12,
'../img/nicolas.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/Y8lGJmmO0kM" title="FILME INFANTIL!! TÔ DE FÉRIAS dublado em português" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="764" height="573" src="https://www.youtube.com/embed/EsRLjE8Dufg" title="TRAILER DO FILME Tô de Férias (DUBLADO)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

insert into complementaresFilmes(codigo_Filme, imagem_Capa, link_Trailer1,link_Trailer2) values (
13,
'../img/igor.jpeg',
'<iframe width="1019" height="573" src="https://www.youtube.com/embed/Y8lGJmmO0kM" title="FILME INFANTIL!! TÔ DE FÉRIAS dublado em português" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
'<iframe width="764" height="573" src="https://www.youtube.com/embed/EsRLjE8Dufg" title="TRAILER DO FILME Tô de Férias (DUBLADO)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
);

CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL
);

-- Exemplo de dados iniciais
INSERT INTO attendance (name, status) VALUES
('Aluno 1', 'Presente'),
('Aluno 2', 'Falta');







select * from filme;
select * from complementaresFilmes;
SELECT default_character_set_name FROM information_schema.SCHEMATA WHERE schema_name = 'projetoAtletas';