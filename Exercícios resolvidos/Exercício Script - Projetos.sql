CREATE DATABASE BANCO_PROJETOS;

USE BANCO_PROJETOS;

CREATE TABLE pessoa (
    id INT NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL,
    CONSTRAINT PK_pessoa PRIMARY KEY (id)
) ;

CREATE TABLE login (
    id INTEGER NOT NULL AUTO_INCREMENT,
    pessoa_id INTEGER CHECK (pessoa_id > 0) NOT NULL,
    nome_usuario VARCHAR(20) NOT NULL,
    senha VARCHAR(20),
    CONSTRAINT PK_login PRIMARY KEY (id)
) ;

CREATE TABLE projeto (
    id INTEGER NOT NULL AUTO_INCREMENT,
    tipo_status_projeto_id INTEGER NOT NULL,
    pessoa_gerente_id INTEGER,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    data_inicio DATE,
    data_fim DATE,
    orcamento DECIMAL(10,2),
    CONSTRAINT PK_projeto PRIMARY KEY (id)
) ;

CREATE TABLE pessoa_projeto (
    pessoa_id INTEGER NOT NULL,
    projeto_id INTEGER NOT NULL,
    CONSTRAINT PK_pessoa_projeto PRIMARY KEY (pessoa_id, projeto_id)
) ;


CREATE TABLE tipo_status_projeto (
    id INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT PK_tipo_status_projeto PRIMARY KEY (id)
) ;

CREATE TABLE pessoal_alocada (
    id INTEGER NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL,
    data_hora DATETIME,
    CONSTRAINT PK_pessoal_alocada PRIMARY KEY (id)
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

/*1) Apresentar o nome das pessoas alocadas em projeto com orçamento acima de 80.000 e que o projeto esteja com o status 'Aberto'.*/

select pess.primeiro_nome, pj.descricao,tsp. from pessoa pess join pessoa_projeto ppj on ppj.pessoa_id = pess.id
join login lg on lg.id = pess.id
join projeto pj on pj.id = lg.id
join tipo_status_projeto tsp on tsp.id = pj.tipo_status_projeto_id
where pj.orcamento > 80.000
and pj.tipo_status_projeto_id  = "Aberto";








