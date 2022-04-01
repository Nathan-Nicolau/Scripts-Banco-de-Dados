create database Videogame;

use Videogame;

create table Jogador(
CODIGOJOGADOR INT  PRIMARY KEY NOT NULL ,
NOME VARCHAR(100) NOT NULL,
APELIDO VARCHAR(30),
NIVEL INT
);

create table Jogo(
CODIGOJOGO INT PRIMARY KEY NOT NULL,
NOME VARCHAR(100) NOT NULL,
PRECO INT NOT NULL,
DESCRICAO TEXT
);

create table Conquista (
CODIGOCONQUISTA INT PRIMARY KEY NOT NULL,
NOME VARCHAR(200) NOT NULL,
CODIGOJOGO INT NOT NULL ,   /*Referencia feita: 1 x N*/
FOREIGN KEY (CODIGOJOGO) REFERENCES Jogo(codigojogo)
);

create table JogadorPremium (
CODIGO INT PRIMARY KEY NOT NULL,
NOME VARCHAR(100) NOT NULL,
APELIDO VARCHAR(30),
NIVEL INT NOT NULL,
DESCONTO INT,
FOREIGN KEY(CODIGO) REFERENCES Jogador(CODIGOJOGADOR)
);

create table JogadorJoga (
data_compra VARCHAR(10),
horas_registradas INT,
codigo_do_jogo INT NOT NULL,
codigo_do_jogador INT NOT NULL,
FOREIGN KEY (codigo_do_jogo) REFERENCES Jogo(CODIGOJOGO),
FOREIGN KEY (Codigo_do_jogador) REFERENCES Jogador(CODIGOJOGADOR)
);

create table JogadorDesbloqueia(
data_desbloqueio VARCHAR(10) NOT NULL,
codigo_da_conquista INT NOT NULL,
codigo_do_jogador INT NOT NULL,
FOREIGN KEY (codigo_da_conquista) REFERENCES Conquista(CODIGOCONQUISTA),
FOREIGN KEY (codigo_do_jogador) REFERENCES Jogador(CODIGOJOGADOR)
);

INSERT INTO Jogador VALUES ('1','Joãozinho ','JãoMatador','50');
INSERT INTO Jogador VALUES ('2','Paulo','SuperPaulo','115');
INSERT INTO Jogador VALUES('3','Alexandre','SuperXandão','300');
INSERT INTO Jogador VALUES('4','Thiago','ThiagoProPlayer','666');
INSERT INTO Jogador VALUES('5','Pedrinho','NoobMaster69','1');
INSERT INTO Jogador VALUES('6','Enzo','MatadorNoob15','0');


INSERT INTO Jogo VALUES('5','FarCry','100','Jogo de sobrevivência em mundo aberto');
INSERT INTO Jogo VALUES ('6','DarkSouls','150','Jogo mais difícil do mundo');
INSERT INTO Jogo VALUES('7','GTA 5','70','Jogo de tocar o terror');
INSERT INTO Jogo VALUES('8','Call of Duty','200','Melhor expêriencia de FPS');


INSERT INTO Conquista VALUES('10','não bateu, não matou e morreu','6');
INSERT INTO Conquista VALUES('11','morreu denovo ','6');
INSERT INTO Conquista VALUES('31','Morreu tanto que morreu de tanto morrer','6');
INSERT INTO Conquista VALUES('12','Caçador Furtivo','5');
INSERT INTO Conquista VALUES('13','Negociador','5');
INSERT INTO Conquista VALUES('14','Duro de Matar','5');
INSERT INTO Conquista VALUES('15','Fã de explosões','5');
INSERT INTO Conquista VALUES('20','Espião nato','5');
INSERT INTO Conquista values('32','Historiador','5');


INSERT INTO JogadorDesbloqueia VALUES('25/04/2018','12','6');
INSERT INTO JogadorDesbloqueia VALUES('27/04/2018','13','6');
INSERT INTO JogadorDesbloqueia VALUES('30/04/2018','14','6');
INSERT INTO JogadorDesbloqueia VALUES('02/10/2019','32','1');
INSERT INTO JogadorDesbloqueia VALUES('10/08/2019','10','3');
INSERT INTO JogadorDesbloqueia VALUES('11/05/2021','31','4');
INSERT INTO JogadorDesbloqueia VALUES('12/05/2021','10','4');
INSERT INTO JogadorDesbloqueia VALUES('15/08/2019','31','3');


INSERT INTO JogadorPremium VALUES('3','Alexandre','SuperXandão','300','15');
INSERT INTO JogadorPremium VALUES('4','Thiago','TiagoProPlayer','666','66');
INSERT INTO JogadorPremium VALUES('5','Pedrinho','NoobMaster69','0','90');


/*Conquistas do FarCry5*/
SELECT Jogo.nome,C.NOME,C.CODIGOCONQUISTA FROM CONQUISTA C JOIN Jogo on C.CODIGOJOGO = Jogo.CODIGOJOGO
	where C.codigojogo = '5';
    

/*Conquistas que o MatadorNoob15 tem no FarCry5*/
SELECT J.APELIDO ,C.NOME,C.codigoconquista,Jogo.nome FROM Conquista C join JogadorDesbloqueia JD on C.codigoconquista = JD.codigo_da_conquista
		JOIN Jogador J on JD.codigo_do_jogador = J.CODIGOJOGADOR
        JOIN Jogo on Jogo.codigojogo = C.codigojogo
		WHERE J.APELIDO = 'MatadorNoob15';
        
        
/*Exercício 3*/
/*
A)
*/
SELECT Jogo.nome,C.NOME,C.CODIGOCONQUISTA FROM CONQUISTA C JOIN Jogo on C.CODIGOJOGO = Jogo.CODIGOJOGO
	where C.codigojogo = '5'
    AND C.nome not in (	
		SELECT c.NOME FROM Conquista C join JogadorDesbloqueia JD on C.codigoconquista = JD.codigo_da_conquista
		JOIN Jogador J on JD.codigo_do_jogador = J.CODIGOJOGADOR
		WHERE J.APELIDO = 'MatadorNoob15'
    );
    

/*
B)
*/
SELECT J.nome,J.apelido,C.NOME,Jogo.nome FROM JogadorPremium JP join Jogador J on JP.codigo  = J.codigojogador
join JogadorDesbloqueia JD on J.codigoJogador = JD.codigo_do_jogador
join Conquista C on JD.codigo_da_conquista = C.Codigoconquista
join Jogo on C.codigojogo = C.codigojogo
where Jogo.nome = 'DarkSouls';


