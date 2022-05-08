create database classificacao_filmes;

use classificacao_filmes;

create table Diretor
(
	diretorID INT PRIMARY KEY,
	nome VARCHAR(50)
);

create table Genero
(
	generoID INT PRIMARY KEY,
	nome VARCHAR(50)
);

create table Filme
(
	filmeID INT PRIMARY KEY,
	titulo VARCHAR(50),
	ano INT,
	diretorID INT,
	generoID INT,
    FOREIGN KEY (diretorId) REFERENCES Diretor(diretorID),
    FOREIGN KEY (generoID) REFERENCES Genero(generoID)
);

create table Revisor
(
	revisorID INT PRIMARY KEY,
	nome VARCHAR(50)
);

create table Classificacao
(
	revisorID INT,
	filmeID INT,
	estrelas INT,
	diaClassificacao DATE,
	FOREIGN KEY (revisorID) REFERENCES Revisor(revisorID),
    FOREIGN KEY (filmeID) REFERENCES Filme(filmeID)
);

insert into Diretor values(1, 'Victor Fleming');
insert into Diretor values(2, 'George Lucas');
insert into Diretor values(3, 'Robert Wise');
insert into Diretor values(4, 'Steven Spielberg');
insert into Diretor values(5, 'James Cameron');

insert into Genero values(1, 'Aventura');
insert into Genero values(2, 'Drama');
insert into Genero values(3, 'Com�dia');

insert into Filme values(101, 'Gone with the Wind', 1939, 1, 2);
insert into Filme values(102, 'Star Wars', 1977, 2, 1);
insert into Filme values(103, 'The Sound of Music', 1965, 3, null);
insert into Filme values(104, 'E.T.', 1982, 4, 1);
insert into Filme values(105, 'Titanic', 1997, 5, 2);
insert into Filme values(106, 'Snow White', 1937, null, null);
insert into Filme values(107, 'Avatar', 2009, 5, null);
insert into Filme values(108, 'Raiders of the Lost Ark', 1981, 4, 1);

insert into Revisor values(201, 'Sarah Martinez');
insert into Revisor values(202, 'Daniel Lewis');
insert into Revisor values(203, 'Brittany Harris');
insert into Revisor values(204, 'Mike Anderson');
insert into Revisor values(205, 'Chris Jackson');
insert into Revisor values(206, 'Elizabeth Thomas');
insert into Revisor values(207, 'James Cameron');
insert into Revisor values(208, 'Ashley White');
insert into Revisor values(209, 'Bob Ohara');
insert into Revisor values(210, 'John Silverston');

insert into Classificacao values(201, 101, 2, '2011-01-22');
insert into Classificacao values(201, 101, 4, '2011-01-27');
insert into Classificacao values(202, 106, 4, null);
insert into Classificacao values(203, 103, 2, '2011-01-20');
insert into Classificacao values(203, 108, 4, '2011-01-12');
insert into Classificacao values(203, 108, 2, '2011-01-30');
insert into Classificacao values(204, 101, 3, '2011-01-09');
insert into Classificacao values(205, 103, 3, '2011-01-27');
insert into Classificacao values(205, 104, 2, '2011-01-22');
insert into Classificacao values(205, 108, 4, null);
insert into Classificacao values(206, 107, 3, '2011-01-15');
insert into Classificacao values(206, 106, 5, '2011-01-19');
insert into Classificacao values(207, 107, 5, '2011-01-20');
insert into Classificacao values(208, 104, 3, '2011-01-02');

/**1) Apresente os filmes que apenas tiveram classificações acima de 4 estrelas.
2) Apresente o nomes dos filmes e suas classificações ordenado pelo nome do filme e pela quantidade de estrelas.
3) Quais revisores não classificaram filme algum.
4) Quais filmes foram revisados por 'Brittany Harris' mas não foram revisados por 'Sarah Martinez'
**/

/*1*/
	select*from filme F join classificacao C on  C.filmeId = F.filmeId
	where estrelas > 4;

/*2*/
SELECT F.TITULO,F.ANO,C.ESTRELAS FROM FILME F JOIN CLASSIFICACAO C
ON C.FILMEID = F.FILMEID
GROUP BY F.FILMEID,C.ESTRELAS
ORDER BY F.TITULO,C.ESTRELAS;

/*3 - Quais revisores não classificaram filme algum.*/
/*Revisores e suas classificações*/
SELECT R.NOME, F.TITULO, C.ESTRELAS FROM FILME F JOIN CLASSIFICACAO C 
	ON F.FILMEID = C.FILMEID JOIN REVISOR R
	ON R.REVISORID = C.REVISORID;
    
/*Revisores que nõa classificaram nenhum filme*/   
SELECT REVISOR.NOME FROM REVISOR
WHERE REVISOR.NOME NOT IN
	(SELECT R.NOME FROM FILME F JOIN CLASSIFICACAO C 
	ON F.FILMEID = C.FILMEID JOIN REVISOR R
	ON R.REVISORID = C.REVISORID);

/**Quais filmes foram revisados por 'Brittany Harris' mas não foram revisados por 'Sarah Martinez'**/

SELECT *FROM FILME F  JOIN CLASSIFICACAO C
ON C.FILMEID = F.FILMEID JOIN REVISOR R 
ON R.REVISORID = C.REVISORID
WHERE R.NOME = "Brittany Harris";

SELECT *FROM FILME F  JOIN CLASSIFICACAO C
ON C.FILMEID = F.FILMEID JOIN REVISOR R 
ON R.REVISORID = C.REVISORID
WHERE R.NOME = "Sarah Martinez";









