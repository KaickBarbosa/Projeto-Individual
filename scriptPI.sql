create database Porkeiras;
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
    derrotas int,
    acertosPorcent decimal(5,2),
    errosPorcent decimal(5,2),
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