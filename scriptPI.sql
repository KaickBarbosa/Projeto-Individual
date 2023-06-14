create database Porkeiras;
drop database Porkeiras;
use Porkeiras;

create table usuario (
	idUsuario int primary key auto_increment,
    nome varchar(30),
    email varchar(45),
    senha varchar(20)
);

create table jogos (
	idJogos int primary key auto_increment,
    nome varchar(30),
    descricao varchar(100)
);

insert into jogos values
	(null, 'Jogo Adivinhação', 'Adivinhe o máximo de jogadores do Palmeiras que conseguir.'),
    (null, 'Jogo Cartola da Sorte', 'Sorteie seu time para tentar marcar mais que o adversário.')
;

create table resultados (
	idResultado int auto_increment,
    fkUsuario int,
    fkJogos int,
    vitorias int,
    empates int,
    derrotas int,
    acertosPorcent decimal(5,2),
    errosPorcent decimal(5,2),
    golsMarcados int,
    golsSofridos int,
    dataHora datetime,
		constraint fkUsuario foreign key (fkUsuario)
			references usuario(idUsuario),
		constraint fkJogos foreign key (fkJogos)
			references jogos(idJogos),
	primary key(idResultado, fkUsuario, fkJogos)
);

select * from usuario;
select * from jogos;
select * from resultados;

-- Porcentagem de acerto e de erro que o usuario possui.
SELECT acertosPorcent FROM resultados WHERE fkUsuario = 2;
SELECT errosPorcent FROM resultados WHERE fkUsuario = 2;

-- Quantidade de vitorias, empates e derrotas no total do usuario.
SELECT SUM(vitorias) FROM resultados WHERE fkUsuario = 2;
SELECT SUM(empates) FROM resultados WHERE fkUsuario = 2;
SELECT SUM(derrotas) FROM resultados WHERE fkUsuario = 2;

-- Quantidade total de gols marcados e gols sofridos pelo usuario.
SELECT SUM(golsMarcados) FROM resultados WHERE fkUsuario = 2;
SELECT SUM(golsSofridos) FROM resultados WHERE fkUsuario = 2;