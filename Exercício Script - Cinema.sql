CREATE DATABASE CINEMAS;

USE CINEMAS;

CREATE TABLE DIRETOR (
	DIRETOR_ID INT PRIMARY KEY AUTO_INCREMENT,
	NOME_DIRETOR VARCHAR(30) NOT NULL
);

CREATE TABLE FILME (
	FILME_ID INT PRIMARY KEY AUTO_INCREMENT, 
	TITULO VARCHAR (30) NOT NULL,
	PAIS VARCHAR(10) NOT NULL,
	ANO INTEGER NOT NULL,
	DIRETOR_ID INT REFERENCES DIRETOR(DIRETOR_ID)
);

CREATE TABLE FILME_ATOR(
	FILME_ID INT REFERENCES FILME(FILME_ID),
	ATOR VARCHAR(30) NOT NULL,
	PRIMARY KEY (FILME_ID, ATOR)
);

CREATE TABLE CINEMA (
	CINEMA_ID INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (20) NOT NULL,
	TELEFONE INTEGER NOT NULL,
	RUA VARCHAR (35) NOT NULL
);

CREATE TABLE SALA_CINEMA (
	SALA_CINEMA INT PRIMARY KEY AUTO_INCREMENT,
	CINEMA_ID INT REFERENCES CINEMA(CINEMA_ID),
	SALA INTEGER NOT NULL,
	NUMERO_LUGARES INTEGER NOT NULL
);

CREATE TABLE PROGRAMA (
	PROGRAMA_ID INT PRIMARY KEY AUTO_INCREMENT,
	CINEMA_ID INT REFERENCES CINEMA(CINEMA_ID),
	FILME_ID INT REFERENCES FILME(FILME_ID),
	SALA INTEGER NOT NULL,
	SEMANA INTEGER NOT NULL, 
	QUANTIDADE_ENTRADAS INTEGER NOT NULL
);

insert into DIRETOR(NOME_DIRETOR) values ('krzysztof');
insert into DIRETOR(NOME_DIRETOR) values ('bovin');
insert into DIRETOR(NOME_DIRETOR) values ('harris');
insert into DIRETOR(NOME_DIRETOR) values ('demy');
insert into DIRETOR(NOME_DIRETOR) values ('lombardi');
insert into DIRETOR(NOME_DIRETOR) values ('eastwood');
insert into DIRETOR(NOME_DIRETOR) values ('mieville');
insert into DIRETOR(NOME_DIRETOR) values ('crichton');
insert into DIRETOR(NOME_DIRETOR) values ('truffaut');
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('annee du soleil calme','pologne', 1989, 1);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('baxter', 'france', 1989 ,2);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('cop', 'usa', 1989, 3);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('la baie des anges', 'france', 1962,4);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('la boca del lobo','espagne',1989,5);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('la derniere cible','usa', 1984 ,6);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('mon cher sujet', 'france', 1989,7);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('un poisson nomme wanda', 'usa', 1989,8);
insert into FILME(TITULO, PAIS, ANO, DIRETOR_ID) values ('veuve mais pas trop', 'usa', 1989,8);
insert into FILME_ATOR values (1,'gabin');
insert into FILME_ATOR values (1,'komorowska');
insert into FILME_ATOR values (1,'skanzanka');
insert into FILME_ATOR values (1,'wilson');
insert into FILME_ATOR values (2,'delamare');
insert into FILME_ATOR values (2,'delon');
insert into FILME_ATOR values (2,'gastaldi');
insert into FILME_ATOR values (2,'mercure');
insert into FILME_ATOR values (2,'piccoli');
insert into FILME_ATOR values (2,'spiesser');
insert into FILME_ATOR values (3,'durning');
insert into FILME_ATOR values (3,'deneuve');
insert into FILME_ATOR values (3,'eastwood');
insert into FILME_ATOR values (3,'haid');
insert into FILME_ATOR values (3,'warren');
insert into FILME_ATOR values (3,'woods');
insert into FILME_ATOR values (4,'gabin');
insert into FILME_ATOR values (4,'guers');
insert into FILME_ATOR values (4,'mann');
insert into FILME_ATOR values (4,'moreau');
insert into FILME_ATOR values (4,'nassiet');
insert into FILME_ATOR values (5,'bueno');
insert into FILME_ATOR values (5,'vega');
insert into FILME_ATOR values (6,'clarkson');
insert into FILME_ATOR values (6,'delon');
insert into FILME_ATOR values (6,'deneuve');
insert into FILME_ATOR values (6,'eastwood');
insert into FILME_ATOR values (6,'hunt');
insert into FILME_ATOR values (7,'le roi');
insert into FILME_ATOR values (7,'romand');
insert into FILME_ATOR values (7,'roussel');
insert into FILME_ATOR values (7,'truffaut');
insert into FILME_ATOR values (8,'cleese');
insert into FILME_ATOR values (8,'curtis');
insert into FILME_ATOR values (8,'kline');
insert into FILME_ATOR values (8,'palin');
insert into FILME_ATOR values (9,'modine');
insert into FILME_ATOR values (9,'pfeiffer');
insert into FILME_ATOR values (9,'piccoli');
insert into FILME_ATOR values (9,'stockwell');
insert into FILME_ATOR values (9,'truffaut');
insert into CINEMA(NOME, TELEFONE, RUA) values ('gaumont', 76461645 ,'alsace lorraine');
insert into CINEMA(NOME, TELEFONE, RUA) values ('la nef', 76465325 ,'edouard rey');
insert into CINEMA(NOME, TELEFONE, RUA) values ('le club', 76467390 ,'phalanstere');
insert into CINEMA(NOME, TELEFONE, RUA) values ('le melies', 76430362 ,'strasbourg');
insert into CINEMA(NOME, TELEFONE, RUA) values ('les 6 rex', 76517200 ,'saint jacques');
insert into CINEMA(NOME, TELEFONE, RUA) values ('les dauphins', 76460454 ,'sault');
insert into CINEMA(NOME, TELEFONE, RUA) values ('lux', 76464658 ,'thiers');
insert into CINEMA(NOME, TELEFONE, RUA) values ('pathe grenette', 76515757 ,'grenette');
insert into CINEMA(NOME, TELEFONE, RUA) values ('ugc royal', 76461142 ,'clot bey');
insert into CINEMA(NOME, TELEFONE, RUA) values ('vox', 76515757 ,'place victor hugo');
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (1,1,600);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (1,2,300);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (1,3,300);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (1,4,230);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (1,5,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (1,6,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (2,1,360);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (2,2,210);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (2,3,200);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (2,4,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (2,5,50);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (3,1,300);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (3,2,200);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (3,3,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (3,4,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (3,5,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (4,1,200);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (4,2,150);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (4,3,150);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (5,1,400);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (5,2,370);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (5,3,240);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (5,4,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (5,5,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (5,6,80);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (6,1,250);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (6,2,50);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (7,1,200);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (8,1,600);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (8,2,300);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (8,3,300);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (8,4,150);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (8,5,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (8,6,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (9,1,600);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (9,2,500);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (9,3,200);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (9,4,100);
insert into SALA_CINEMA(CINEMA_ID, SALA, NUMERO_LUGARES) values (9,5,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,1,1,3,600);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,1,2,3,520);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,1,3,3,348);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,1,4,7,390);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,2,1,1,1300);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,2,2,1,1600);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,2,3,1,1120);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,2,4,1,1076);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,3,1,8,1402);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,3,2,8,2402);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,3,3,8,1347);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,3,4,8,1007);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,4,1,9,730);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,4,2,9,930);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,4,3,9,678);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,4,4,9,610);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,5,1,6,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,5,2,6,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,5,3,6,149);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,5,4,6,234);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,6,1,5,40);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,6,2,5,80);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,6,3,5,118);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (1,6,4,5,289);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,1,1,3,1502);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,1,2,3,1012);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,1,3,3,816);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,1,4,3,816);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,2,1,2,210);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,2,2,2,110);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,2,3,2,168);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,2,4,5,345);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,3,1,9,1200);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,3,2,9,1200);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,3,3,9,1316);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,3,4,9,1009);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,4,1,1,850);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,4,2,1,850);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,4,3,1,850);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,4,4,1,750);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,5,1,8,1560);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,5,2,8,1820);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,5,3,8,1710);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (2,5,4,8,910);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,1,1,1,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,1,2,1,130);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,1,3,1,110);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,1,4,9,210);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,2,1,3,20);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,2,2,3,50);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,2,3,5,60);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,2,4,5,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,3,1,4,800);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,3,2,4,550);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,3,3,4,730);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,3,4,4,600);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,4,1,7,245);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,4,2,7,200);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,4,3,7,214);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,4,4,7,189);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,5,1,2,840);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,5,2,2,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,5,3,2,276);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (3,5,4,3,210);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 1,1,6,200);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 1,2,6,234);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 1,3,6,345);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 1,4,6,418);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 2,1,3,150);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 2,2,3,121);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 2,3,3,141);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 2,4,3,106);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 3,1,2,150);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 3,2,2,150);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 3,3,2,50);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4, 3,4,9,261);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (4,3,5,9,400);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,1,1,6,400);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,1,2,6,230);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,1,3,6,342);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,1,4,6,284);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,2,1,3,370);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,2,2,3,123);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,2,3,3,219);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,2,4,1,320);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,3,1,4,240);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,3,2,4,312);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,3,3,4,380);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,3,4,4,413);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,4,1,2,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,4,2,2,57);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,4,3,8,412);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,4,4,8,349);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,5,1,9,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,5,2,9,212);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,5,3,9,234);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,5,4,9,274);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,6,1,7,80);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,6,2,7,180);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,6,3,7,129);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (5,6,4,7,358);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,1,1,1,250);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,1,2,1,220);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,1,3,1,250);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,1,4,1,214);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,2,1,2,150);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,2,2,2,50);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,2,3,9,150);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (6,2,4,4,310);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,1,1,7,600);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,1,2,7,600);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,1,3,7,832);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,1,4,7,548);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,2,1,8,300);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,2,2,8,540);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,2,3,8,356);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,2,4,8,219);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,2,5,8,400);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,3,1,5,300);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,3,2,5,289);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,3,3,5,450);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,3,4,5,240);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,4,1,1,150);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,4,2,1,230);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,4,3,1,215);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,4,4,1,319);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,5,1,4,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,5,2,4,123);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,5,3,4,234);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,5,4,4,289);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,6,1,2,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,6,2,2,54);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,6,3,2,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (7,6,4,6,381);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,1, 1,8,600);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,1, 2,8,1200);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,1, 3,8,843);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,1, 4,8,528);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,2, 1,2,500);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,2, 2,2,241);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,2, 3,2,213);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,2, 4,2,101);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,3, 1,7,200);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,3, 2,7,242);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,3, 3,7,245);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,3, 4,7,278);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,4, 1,5,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,4, 2,5,141);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,4, 3,5,168);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,4, 4,6,389);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,5, 1,3,100);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,5, 2,3,120);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,5, 3,3,102);
insert into PROGRAMA(CINEMA_ID,FILME_ID,SALA,SEMANA,QUANTIDADE_ENTRADAS) values (8,5, 4,3,62);

/*
1) Apresente a quantidade de filmes em que o ator 'eastwood' participou.
2) Apresente o nome do ator que mais participou de filmes do diretor 'truffaut'.
3) Apresente o nome dos cinemas e a quantidade total de expectadores.
4) Apresente o nome do cinema que possui a maior quantidade de lugares, considerando
todas suas salas.
5) Apresente o nome dos cinemas que possuam salas com mais de 150 lugares no total e que
   apresentaram o filme 'baxter'.*/
   
 /*1*/  
SELECT COUNT(*) QTD_FILMES FROM FILME JOIN FILME_ATOR FA ON FILME.FILME_ID = FA.FILME_ID
				WHERE FA.ATOR = "eastwood";
			
/*1.1*/
SELECT *FROM FILME JOIN FILME_ATOR FA ON FILME.FILME_ID = FA.FILME_ID
				WHERE FA.ATOR = "eastwood";

/*2) Apresente o nome do ator que mais participou de filmes do diretor 'truffaut'.*/ 
SELECT COUNT(FA.ATOR) AS NUMERO_TOTAL, FA.ATOR FROM DIRETOR D JOIN FILME F ON  D.DIRETOR_ID = F.DIRETOR_ID
			JOIN FILME_ATOR FA ON FA.FILME_ID = F.FILME_ID
            WHERE D.NOME_DIRETOR = "truffaut"
            group by FA.ATOR
            ORDER BY NUMERO_TOTAL DESC LIMIT 1;
            
			
/*3*/
SELECT C.CINEMA_ID, C.NOME,SUM(P.QUANTIDADE_ENTRADAS) AS ENTRADAS_TOTAIS FROM CINEMA C JOIN PROGRAMA P ON P.CINEMA_ID = C.CINEMA_ID
				GROUP BY C.CINEMA_ID,C.NOME
                ORDER BY SUM(P.QUANTIDADE_ENTRADAS) DESC;

/*4*/
SELECT C.CINEMA_ID,C.NOME, SUM(SC.NUMERO_LUGARES) TOTAL_LUGARES FROM CINEMA C JOIN SALA_CINEMA SC ON SC.CINEMA_ID =  C.CINEMA_ID
				GROUP BY C.CINEMA_ID , C.NOME
                ORDER BY SUM(SC.NUMERO_LUGARES) DESC
                LIMIT 1;
                
 /*5*/               
SELECT  DISTINCT C.NOME,SC.SALA,SC.NUMERO_LUGARES FROM CINEMA C JOIN PROGRAMA P ON P.CINEMA_ID = C.CINEMA_ID
			JOIN FILME F ON F.FILME_ID = P.FILME_ID
            JOIN SALA_CINEMA SC ON SC.CINEMA_ID = C.CINEMA_ID
            WHERE F.TITULO = "baxter"
            AND SC.NUMERO_LUGARES > 150;

            
            
            

                
                

