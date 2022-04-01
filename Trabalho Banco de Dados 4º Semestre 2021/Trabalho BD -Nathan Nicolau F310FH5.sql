CREATE DATABASE TRABALHOBD_2021;

USE TRABALHOBD_2021;

CREATE TABLE pessoa (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL
);

CREATE TABLE login (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pessoa_id INTEGER NOT NULL,
    nome_usuario VARCHAR(20) NOT NULL,
    senha VARCHAR(20)
) ;

CREATE TABLE projeto (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_status_projeto_id INTEGER NOT NULL,
    pessoa_gerente_id INTEGER,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(500),
    data_inicio DATE,
    data_fim DATE,
    orcamento DECIMAL(10,2)
) ;

CREATE TABLE pessoa_projeto (
    pessoa_id INTEGER NOT NULL,
    projeto_id INTEGER NOT NULL,
    CONSTRAINT PK_pessoa_projeto PRIMARY KEY (pessoa_id, projeto_id)
) ;


CREATE TABLE tipo_status_projeto (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
) ;

CREATE TABLE pessoal_alocada (
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL,
    data_hora DATETIME
) ;

CREATE TABLE projeto_relacionado (
    projeto_id INTEGER NOT NULL,
    projeto_filho_id INTEGER NOT NULL,
    CONSTRAINT PK_projeto_relacionado PRIMARY KEY (projeto_id, projeto_filho_id)
) ;


ALTER TABLE login ADD CONSTRAINT pessoa_login FOREIGN KEY (pessoa_id) REFERENCES pessoa (id);
ALTER TABLE projeto ADD CONSTRAINT pessoa_projeto_fk FOREIGN KEY (pessoa_gerente_id) REFERENCES pessoa (id);
ALTER TABLE projeto ADD CONSTRAINT project_status_type_project FOREIGN KEY (tipo_status_projeto_id) REFERENCES tipo_status_projeto (id);
ALTER TABLE pessoa_projeto ADD CONSTRAINT pessoa_team_member_project_assn FOREIGN KEY (pessoa_id) REFERENCES pessoa (id);
ALTER TABLE pessoa_projeto ADD CONSTRAINT project_team_member_project_assn FOREIGN KEY (projeto_id) REFERENCES projeto (id);

ALTER TABLE projeto_relacionado ADD CONSTRAINT related_project_assn_1 FOREIGN KEY (projeto_id) REFERENCES projeto (id);
ALTER TABLE projeto_relacionado ADD CONSTRAINT related_project_assn_2 FOREIGN KEY (projeto_filho_id) REFERENCES projeto (id);

INSERT INTO tipo_status_projeto (nome) VALUES ('Aberto');
INSERT INTO tipo_status_projeto (nome) VALUES ('Cancelado');
INSERT INTO tipo_status_projeto (nome) VALUES ('Completo');

INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('John', 'Doe');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Kendall', 'Public');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Ben', 'Robinson');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Mike', 'Ho');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Alex', 'Smith');    
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Wendy', 'Smith');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Karen', 'Wolfe');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Samantha', 'Jones');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Linda', 'Brady');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Jennifer', 'Smith');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Brett', 'Carlisle');
INSERT INTO pessoa(primeiro_nome, ultimo_nome) VALUES ('Jacob', 'Pratt');

INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('John', 'Doe');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Kendall', 'Public');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Ben', 'Robinson');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Mike', 'Ho');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Alfred', 'Newman');    
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Wendy', 'Johnson');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Karen', 'Wolfe');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Samantha', 'Jones');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Linda', 'Brady');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Jennifer', 'Smith');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Brett', 'Carlisle');
INSERT INTO pessoal_alocada(primeiro_nome, ultimo_nome) VALUES ('Jacob', 'Pratt');

INSERT INTO login(pessoa_id, nome_usuario, senha) VALUES (1, 'jdoe', 'p@$$.w0rd');
INSERT INTO login(pessoa_id, nome_usuario, senha) VALUES (3, 'brobinson', 'p@$$.w0rd');
INSERT INTO login(pessoa_id, nome_usuario, senha) VALUES (4, 'mho', 'p@$$.w0rd');
INSERT INTO login(pessoa_id, nome_usuario, senha) VALUES (7, 'kwolfe', 'p@$$.w0rd');

INSERT INTO projeto(tipo_status_projeto_id, pessoa_gerente_id, nome, descricao, data_inicio, data_fim, orcamento) VALUES
    (3, 7, 'ACME Website Redesign', 'The redesign of the main website for ACME Incorporated', '2004-03-01', '2004-07-01', '9560.25');
INSERT INTO projeto(tipo_status_projeto_id, pessoa_gerente_id, nome, descricao, data_inicio, data_fim, orcamento) VALUES
    (1, 4, 'State College HR System', 'Implementation of a back-office Human Resources system for State College', '2006-02-15', NULL, '80500.00');
INSERT INTO projeto(tipo_status_projeto_id, pessoa_gerente_id, nome, descricao, data_inicio, data_fim, orcamento) VALUES
    (1, 1, 'Blueman Industrial Site Architecture', 'Main website architecture for the Blueman Industrial Group', '2006-03-01', '2006-04-15', '2500.00');
INSERT INTO projeto(tipo_status_projeto_id, pessoa_gerente_id, nome, descricao, data_inicio, data_fim, orcamento) VALUES
    (2, 7, 'ACME Payment System', 'Accounts Payable payment system for ACME Incorporated', '2005-08-15', '2005-10-20', '5124.67');

INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (2, 1);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (5, 1);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (6, 1);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (7, 1);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (8, 1);

INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (2, 2);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (4, 2);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (5, 2);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (7, 2);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (9, 2);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (10, 2);

INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (1, 3);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (4, 3);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (6, 3);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (8, 3);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (10, 3);

INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (1, 4);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (2, 4);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (3, 4);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (5, 4);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (8, 4);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (11, 4);
INSERT INTO pessoa_projeto (pessoa_id, projeto_id) VALUES (12, 4);

INSERT INTO projeto_relacionado (projeto_id, projeto_filho_id) VALUES(1, 3);
INSERT INTO projeto_relacionado (projeto_id, projeto_filho_id) VALUES(1, 4);
INSERT INTO projeto_relacionado (projeto_id, projeto_filho_id) VALUES(4, 1);

/*Nathan Lucas Santos Nicolau*/

/*1 - Apresentar o nome das pessoas alocadas em projeto com orçamento acima de 80.000 e que o projeto esteja com o status 'Aberto' */

select distinct pess.id,pess.primeiro_nome,proj.nome,proj.id,proj.orcamento,tsp.nome from pessoa pess
join pessoa_projeto pess_p on pess.id = pess_p.pessoa_id
join projeto proj on proj.id = pess_p.projeto_id
join tipo_status_projeto  tsp on tsp.id = proj.tipo_status_projeto_id
where proj.orcamento > 80000.00
and tsp.nome = "Aberto";

/*2 - Apresentar o nome das pessoas que não trabalharam no projeto 'ACME Website Redesign*/

select distinct pess.primeiro_nome,proj.nome from pessoa pess
		join pessoa_projeto pess_p on pess.id = pess_p.pessoa_id
		join projeto proj on proj.id = pess_p.projeto_id
        and pess.primeiro_nome
		NOT IN (
				select distinct pess.primeiro_nome from pessoa pess
				join pessoa_projeto pess_p on pess.id = pess_p.pessoa_id
				join projeto proj on proj.id = pess_p.projeto_id
				where proj.nome = "ACME Website Redesign"
                );
/*3 - Apresentar o nome dos projetos em que 'Mike Ho' trabalhou, porém 'Jacob Pratt' não trabalhou*/

select distinct pess.primeiro_nome,pess.ultimo_nome,pess.id, pess_p.projeto_id from pessoa pess
	join pessoa_projeto pess_p on pess.id = pess_p.pessoa_id
	where pess.primeiro_nome  = "Mike"
	and pess.ultimo_nome = "Ho"
    and pess.primeiro_nome 
    NOT IN(
			select distinct  pess_p.projeto_id from pessoa pess
			join pessoa_projeto pess_p on pess.id = pess_p.pessoa_id
			where pess.primeiro_nome  = "Jacob"
			and pess.ultimo_nome = "Pratt"
		  );

/* 4 - Apresentar o nome dos gerentes que nunca trabalharam em projetos, além de gerenciá-los*/
/*Nesse exercício professor, coloquei duas resoluções possíveis , claro que na minha opinião e interpretação*/

select distinct pess.primeiro_nome,pj.pessoa_gerente_id,pj.nome,tsp.nome from pessoa pess
join pessoa_projeto ppj on pess.id = ppj.pessoa_id
join projeto pj on pj.pessoa_gerente_id  = ppj.pessoa_id
join tipo_status_projeto tsp on tsp.id = pj.tipo_status_projeto_id
where tsp.nome = "Cancelado";

select  distinct pj.pessoa_gerente_id from projeto pj
where pj.pessoa_gerente_id not in (
				select distinct pessoa_projeto.pessoa_id from pessoa_projeto
                );
                
/*5 - Apresentar o nome dos funcionários que tanto trabalharam no projeto 'ACME Website Redesign' quanto no projeto 'State College HR System*/

select distinct pess.primeiro_nome,proj.nome,proj.orcamento from pessoa pess
	join pessoa_projeto pess_p on pess.id = pess_p.pessoa_id
	join projeto proj on proj.id = pess_p.projeto_id
    where proj.nome  = "ACME Website Redesign"
    and pess.primeiro_nome in(
			select distinct pess.primeiro_nome from pessoa pess
			join pessoa_projeto pess_p on pess.id = pess_p.pessoa_id
			join projeto proj on proj.id = pess_p.projeto_id
			where proj.nome  = "State College HR System"
    );
    
    
/*6 - Apresentar o nome dos projetos e a quantidade de pessoas que trabalham nestes*/
/*Essa foi fácil...*/

	/*Nesse SELECT pode-se ver individualmente quais pessoas estão relacionadas a quais projetos*/
    select ppj.pessoa_id,pj.nome  from projeto pj join pessoa_projeto ppj 
	on ppj.projeto_id = pj.id join pessoa pess
	on pess.id = ppj.pessoa_id;

	/*Já nesse SELECT, existem as somas*/
	select count( distinct ppj.pessoa_id)as TOTAL_DE_PESSOAS,pj.nome AS NOME_PROJETO,pj.id AS ID_DO_PROJETO  from projeto pj join pessoa_projeto ppj 
	on ppj.projeto_id = pj.id join pessoa pess
	on pess.id = ppj.pessoa_id
	group by pj.id;
    

/* 7 - Apresentar o total de orcamento por status de projeto.*/
/*Três separados*/
select sum( distinct pj.orcamento)as SOMA_DOS_ORÇAMENTOS,tsp.nome from tipo_status_projeto tsp join projeto pj 
	on pj.tipo_status_projeto_id = tsp.id
	where tsp.nome = "Aberto";
    
select sum( distinct pj.orcamento)as SOMA_DOS_ORÇAMENTOS,tsp.nome from tipo_status_projeto tsp join projeto pj 
	on pj.tipo_status_projeto_id = tsp.id
	where tsp.nome = "Cancelado";
    
select sum( distinct pj.orcamento)as SOMA_DOS_ORÇAMENTOS,tsp.nome from tipo_status_projeto tsp join projeto pj 
	on pj.tipo_status_projeto_id = tsp.id
	where tsp.nome = "Completo";

/*Todos juntos*/
select sum( distinct pj.orcamento)as SOMA_DOS_ORÇAMENTOS,tsp.nome from tipo_status_projeto tsp join projeto pj 
	on pj.tipo_status_projeto_id = tsp.id
	where tsp.id = pj.tipo_status_projeto_id
    group by tsp.nome;
    
    



    
    

