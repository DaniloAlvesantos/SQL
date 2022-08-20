CREATE DATABASE virtualdc; /* Danilo Alves dos Santos */
USE virtualdc;

CREATE TABLE cadfun(
CODFUN INT NOT NULL PRIMARY KEY,
NOME VARCHAR(40),
DEPTO VARCHAR(2),
FUNCAO VARCHAR(20),
SALARIO DECIMAL(10,2)
);

-- POPULANDO
INSERT INTO cadfun (CODFUN,NOME, DEPTO, FUNCAO, SALARIO) VALUES (12, 'CARLOS ALBERTO','03','VENDEDOR',1530.00);
INSERT INTO cadfun VALUES (2,'WILSON DE MACEDO', '03', 'PROGRAMADOR',1050.00);
INSERT INTO cadfun VALUES (15,'MARCELO HENRIQUE', '02', 'GERENTE', 1985.75);
INSERT INTO cadfun VALUES (7, 'APARECIDA SILVA', '03', 'SECRETARIA',1200.50);
INSERT INTO cadfun VALUES (9,'SOLANGE PACHECO', '05', 'SUPERVISORA',1599.51);
INSERT INTO cadfun (CODFUN,NOME,DEPTO,FUNCAO,SALARIO) VALUES (6,'MARCELO SOUZA', '03', 'ANALISTA',2250.11);
INSERT INTO cadfun VALUES (1, 'CELIA NASCIMENTO', '02', 'SECRETARIA', 1200.50);
INSERT INTO cadfun VALUES (5,'AUGUSTO SOUZA','03','PROGRAMADOR',1050.00);
INSERT INTO cadfun VALUES (4,'CARLOS BASTOS','05','VENDEDOR',1530.00);
INSERT INTO cadfun VALUES (25,'PEDRO SILVA','03','SUPERVISOR',1599.51);
INSERT INTO cadfun VALUES (3,'ANA BASTOS','05','VENDEDORA',1530.00);
INSERT INTO cadfun VALUES (10,'PAULO DA SILVA','02','VENDEDOR',1530.00);

-- MOSTRANDO VALORES
SELECT * FROM cadfun;
SELECT NOME FROM cadfun;
SELECT NOME,FUNCAO FROM cadfun;
SELECT NOME FROM cadfun WHERE DEPTO = '03';
SELECT NOME,SALARIO FROM cadfun ORDER BY NOME;
SELECT NOME,SALARIO FROM cadfun ORDER BY NOME DESC;
SELECT NOME,DEPTO FROM cadfun ORDER BY DEPTO,NOME DESC; /* ELE MOSTRA O DEPARTAMENTO POR ORDEM CRESCENTE E NOME POR NOME DECRESENTE */
SELECT NOME FROM cadfun WHERE DEPTO ='03' ORDER BY NOME;

-- ATUALIZANDO O SALARIO DO FUNCIONARIO
SELECT * FROM cadfun WHERE CODFUN = 7;
UPDATE cadfun SET SALARIO = 2300.56 WHERE CODFUN = 7;
SELECT * FROM cadfun WHERE CODFUN = 7;

-- ATUALIZANDO DEPARTAMENTO DO FUNCIONARIO
SELECT * FROM cadfun WHERE NOME = 'ANA BASTO';
UPDATE cadfun SET DEPTO = '03' WHERE NOME = 'ANA BASTO';
SELECT NOME FROM cadfun WHERE NOME = 'ANA BASTO';

-- 10% DE AUMENTO PARA TODOS OS FUNCIONARIOS
SELECT * FROM cadfun;
UPDATE cadfun SET SALARIO = SALARIO * 1.10; /*TODOS FUNCIONARIOS RECEBEM 10% DE AUMENTO*/
SELECT * FROM cadfun;

-- DELETANDO FUNCIONARIO
SELECT * FROM cadfun;
DELETE FROM cadfun WHERE NOME = 'MARCELO SOUZA';
SELECT * FROM cadfun;

-- ADICIONANDO ATRIBUTO DATA DE DEMISS�O NA TABELA *cadfun*
SELECT * FROM cadfun;
ALTER TABLE cadfun ADD ADMISSAO DATE;
SELECT * FROM cadfun;

-- ATUALIZANDO DATA DE DEMISS�O DOS EX-FUNCIONARIOS
UPDATE cadfun SET ADMISSAO = '2006-01-15' WHERE CODFUN = 2;
UPDATE cadfun SET ADMISSAO = '1999-10-21' WHERE CODFUN = 3;
UPDATE cadfun SET ADMISSAO = '2004-10-21' WHERE CODFUN = 4;
UPDATE cadfun SET ADMISSAO = '2006-04-26' WHERE CODFUN = 5;
UPDATE cadfun SET ADMISSAO = '1980-05-10' WHERE CODFUN = 7;
UPDATE cadfun SET ADMISSAO = '1999-12-15' WHERE CODFUN = 9;
UPDATE cadfun SET ADMISSAO = '2000-12-21' WHERE CODFUN = 12;
UPDATE cadfun SET ADMISSAO = '2000-12-21' WHERE CODFUN = 25;
SELECT * FROM cadfun;

UPDATE cadfun SET ADMISSAO = '2006-05-25' WHERE CODFUN = 15;
INSERT INTO cadfun VALUES (20,'AUDREY TOLEDO','02','SUPERVISORA','1700.00','2006-05-07');
INSERT INTO cadfun VALUES (22,'MARCOS HENRIQUE','02','GERENTE','2184.33','2006-01-07');
INSERT INTO cadfun VALUES (24,'MARCOS HENRIQUE','02','GERENTE','2184.33','2006-10-07');
SELECT * FROM cadfun;

-- MOSTRANDO TUDO ONDE O M�S DE DEMISS�O FOR 12 ( DEZEMBRO )
SELECT * FROM cadfun WHERE MONTH(ADMISSAO) = 12;

-- CRIANDO NOVA TABELA
CREATE TABLE ARQUIVOMORTO (
CODFUN INT NOT NULL,
NOME VARCHAR(40),
DEPTO CHAR(2),
FUNCAO VARCHAR(20),
SALARIO DECIMAL(10,2),
ADMISSAO DATE
);

-- INSERINDO DADOS DA TABELA cadfun ONDE CODFUN = 12,NA TABELA ARQUIVOMORTO, 
INSERT INTO ARQUIVOMORTO
SELECT CODFUN, NOME, DEPTO, FUNCAO, SALARIO, ADMISSAO
FROM cadfun
WHERE CODFUN = 12;

-- APAGANDO REGISTRO
SELECT * FROM cadfun;
DELETE FROM cadfun WHERE CODFUN = 12;
SELECT * FROM cadfun;

-- MOSTRA OS FUNCIONARIOS DA TABELA CADFUN QUE TEM O SALARIO IGUAL AO QUE EST� NA TABELA ARQUIVOMORTO QUE TEM O CODFUN = 12
SELECT * FROM cadfun WHERE SALARIO = (SELECT SALARIO FROM ARQUIVOMORTO WHERE CODFUN = 12);

-- MOSTRA OS FUNCIONARIOS DA TABELA CADFUN QUE TEM O MESMO DEPARTAMENTO DO FUNCIONARIO QUE EST� NA TABELA ARQUIVOMORTO QUE TEM O CODFUN = 12
SELECT * FROM cadfun WHERE DEPTO = (SELECT DEPTO FROM ARQUIVOMORTO WHERE CODFUN = 12);

-- EXERC�CIOS

/* A */ SELECT NOME, FUNCAO FROM cadfun;
/* B */ SELECT CODFUN, NOME, FUNCAO FROM cadfun;
/* C */ SELECT CODFUN, NOME, FUNCAO, DEPTO FROM cadfun;
/* D */ SELECT NOME FROM cadfun WHERE DEPTO = '05';
/* E */ SELECT NOME, DEPTO FROM cadfun WHERE FUNCAO = 'VENDEDOR';
/* F */ SELECT NOME,SALARIO FROM cadfun WHERE DEPTO = '03';
/* G */ SELECT NOME, FUNCAO FROM cadfun ORDER BY FUNCAO DESC;
/* H */ SELECT NOME, FUNCAO FROM cadfun ORDER BY FUNCAO, NOME DESC; 
/* I */ SELECT * FROM cadfun WHERE MONTH(ADMISSAO) = 10;


/* 11/08//2022*/

/* Consulta com operadores aritm�ticos */
SELECT NOME,SALARIO + 100 FROM cadfun;
/* Mostrar nome e salario com 20% no valor do salario do funcionario */
SELECT NOME,SALARIO * 1.20 FROM cadfun;

/* Consulta com operadores relacionais */
SELECT * FROM cadfun WHERE DEPTO = '05';
SELECT * FROM cadfun WHERE FUNCAO = 'VENDEDOR';
SELECT * FROM cadfun WHERE SALARIO <= 1700;

/* Consulta com operadores l�gicos */
SELECT * FROM cadfun WHERE NOT(FUNCAO = 'VENDEDOR');

/* Consuta com operadores auxiliares */
ALTER TABLE cadfun ADD FILHOS SMALLINT;
ALTER TABLE ARQUIVOMORTO ADD FILHOS SMALLINT;
SELECT NOME,FILHOS FROM cadfun;
SELECT NOME,FILHOS FROM ARQUIVOMORTO;

/* Incluindo informa��es de filhos na tabela cadfun */
UPDATE cadfun SET FILHOS = 1 WHERE CODFUN = 2;
UPDATE cadfun SET FILHOS = 3 WHERE CODFUN = 3;
UPDATE cadfun SET FILHOS = 2 WHERE CODFUN = 5;
UPDATE cadfun SET FILHOS = 1 WHERE CODFUN = 9;
UPDATE cadfun SET FILHOS = 4 WHERE CODFUN = 20;
UPDATE cadfun SET FILHOS = 3 WHERE CODFUN = 25;

/* Operador IS NULL */
SELECT CODFUN, NOME, FILHOS FROM cadfun WHERE FILHOS IS NULL;
SELECT CODFUN, NOME, FILHOS FROM cadfun WHERE NOT FILHOS IS NULL;

/* Operador BETWEEN */
SELECT NOME,SALARIO, FILHOS FROM cadfun WHERE SALARIO BETWEEN 1700 AND 2000;

/* Operador IN */
SELECT NOME,DEPTO FROM cadfun WHERE DEPTO IN ('02','03') ORDER BY DEPTO;

/* Operador LIKE */
SELECT * FROM cadfun WHERE SALARIO LIKE '11%'; -- Mostrar tudo onde salario que comece com 11
SELECT * FROM cadfun WHERE SALARIO LIKE '%8%'; -- Mostrar tudo onde salario que tenha 8 no meio
SELECT * FROM cadfun WHERE SALARIO LIKE '_1%'; -- Mostrar tudo onde salario que segundo lugar seja 1
SELECT * FROM cadfun WHERE SALARIO LIKE '%6';  -- Mostrar tudo onde salario termine com 6
SELECT * FROM cadfun WHERE SALARIO LIKE '_6%0';-- Mostrar tudo onde salario tenha 6 no segundo lugar e termine com 0
SELECT * FROM cadfun WHERE NOME LIKE 'A%';     -- Mostrar tudo onde nome comece com A
SELECT * FROM cadfun WHERE NOME LIKE '_A%';    -- Mostrar tudo onde nome tenha segundo lugar seja A
SELECT * FROM cadfun WHERE NOME LIKE '%AN%';   -- Mostrar tudo onde nome tenha 'AN' no meio
SELECT * FROM cadfun WHERE NOME NOT LIKE '%AN%';-- Mostrar tudo onde nome n�o tenha 'AN' no meio

/*A*/ SELECT CODFUN,NOME,SALARIO + 250 AS RESULTADO FROM cadfun;
/*B*/ SELECT CODFUN,NOME,SALARIO AS RESULTADO FROM cadfun;
/*C*/ SELECT * FROM cadfun WHERE FUNCAO = 'ANALISTA';
/*D*/ SELECT * FROM cadfun WHERE SALARIO >= 1700;
/*E*/ SELECT * FROM cadfun WHERE SALARIO > 1700;
/*F*/ SELECT * FROM cadfun WHERE SALARIO < 1700;
/*G*/ SELECT * FROM cadfun WHERE SALARIO = 1700;
/*H*/ SELECT * FROM cadfun WHERE FUNCAO IN ('PROGRAMADOR','ANALISTA');
/*I*/ SELECT * FROM cadfun WHERE FUNCAO IN ('PROGRAMADOR','ANALISTA') AND SALARIO > 1200 ;
/*J*/ SELECT * FROM cadfun WHERE FUNCAO NOT IN ('PROGRAMADOR','ANALISTA');
/*K*/ SELECT * FROM cadfun WHERE FILHOS BETWEEN 2 AND 4 ORDER BY FILHOS;
/*L*/ SELECT * FROM cadfun WHERE FILHOS BETWEEN 2 AND 4 AND SALARIO < 2000 ORDER BY FILHOS;
/*M*/ SELECT * FROM cadfun WHERE ( FILHOS < 2) OR (FILHOS > 3) OR FILHOS IS NULL;
/*N*/ SELECT * FROM cadfun WHERE (FILHOS < 2) OR (FILHOS > 3);
/*O*/ SELECT * FROM cadfun WHERE FILHOS IN ('2','3');
/*P*/ SELECT * FROM cadfun WHERE NOME LIKE '%SILVA%';
/*Q*/ SELECT * FROM cadfun WHERE NOME LIKE 'SILV%';
/*R*/ SELECT NOME FROM cadfun WHERE NOME LIKE '%SILVA%';
	  SELECT SUBSTRING(NOME,1,CHARINDEX(' ',NOME,1)-1) FROM cadfun WHERE NOME LIKE '%SILVA%'; -- PAE � ZIKA :P
/*S*/ SELECT NOME,DEPTO FROM cadfun WHERE FUNCAO IN ('GERENTE','ANALISTA');
/*T*/ SELECT CODFUN,NOME,DEPTO FROM cadfun WHERE CODFUN IN('2','5','9') ORDER BY CODFUN DESC;
/*U*/ SELECT NOME, DEPTO FROM cadfun WHERE DEPTO = '05';
/*V*/ SELECT * FROM cadfun WHERE NOME LIKE '%SILVA%' ORDER BY NOME;
/*W*/ SELECT * FROM cadfun WHERE SALARIO != 2000;
                                                                  -- ATIVIDADE 03 --


/*A*/ SELECT AVG(FILHOS) AS filhosMedia FROM cadfun;
/*B*/ SELECT AVG(FILHOS) AS filhosMedia FROM cadfun WHERE DEPTO = '05';
/*C*/ SELECT AVG(DISTINCT SALARIO) AS salarioMedia FROM cadfun WHERE DEPTO = '05';
/*D*/ SELECT COUNT(CODFUN) AS TOTALFUN FROM cadfun WHERE DEPTO = '05';
/*E*/ SELECT MAX(SALARIO) AS MAXSAL FROM cadfun WHERE DEPTO = '05';
/*F*/ SELECT NOME FROM cadfun WHERE SALARIO = (SELECT MAX(SALARIO) FROM cadfun WHERE DEPTO = '05'); 
/*G*/ SELECT SUM(SALARIO) AS TOTSALANALIST FROM cadfun WHERE FUNCAO = 'ANALISTA';
/*H*/ SELECT SUM(SALARIO) AS TOTSALANALIST02 FROM cadfun WHERE FUNCAO = 'ANALISTA' AND DEPTO = '02';
/*I*/ SELECT NOME,ADMISSAO AS DEMITIDOS FROM cadfun WHERE DATEPART(DAY,ADMISSAO) = 10;
/*J*/ SELECT NOME,ADMISSAO AS DEMITIDOS FROM cadfun WHERE DATEPART(DAY,ADMISSAO) = 5 OR DATEPART(DAY,ADMISSAO) = 10 ORDER BY DAY(ADMISSAO);
/*K*/ SELECT NOME,ADMISSAO AS DEMITIDOS FROM cadfun WHERE DATEPART(DAY,ADMISSAO) = 5 OR DATEPART(DAY,ADMISSAO) = 10 ORDER BY DAY(ADMISSAO) DESC;
/*L*/ SELECT NOME,ADMISSAO AS DEMISSAO FROM cadfun WHERE ADMISSAO < '2006-09-20';
/*M*/ SELECT NOME,ADMISSAO,DATENAME(MONTH,ADMISSAO) AS MES FROM cadfun WHERE DEPTO = '05' ORDER BY MONTH(ADMISSAO);
/*N*/ SELECT LOWER(NOME),DEPTO FROM cadfun WHERE DEPTO IN ('03','05');
/*O*/ SELECT NOME,DEPTO,ADMISSAO FROM cadfun WHERE DATEPART(DAY,ADMISSAO) IN (05,10) AND DEPTO IN ('03','05');
/*P*/ SELECT NOME,DEPTO,ADMISSAO,FUNCAO FROM cadfun WHERE DATEPART(MONTH,ADMISSAO) IN (05,08) AND FUNCAO = 'ANALISTA';
/*Q*/ SELECT NOME,DEPTO,ADMISSAO,FUNCAO FROM cadfun WHERE DATEPART(MONTH,ADMISSAO) IN (05,08) AND NOT(FUNCAO = 'ANALISTA');
/*R*/ SELECT COUNT(ADMISSAO) AS TOTALADMIS FROM cadfun WHERE DATEPART(MONTH,ADMISSAO) = 07;

                                                                  -- ATIVIDADE 04 --
-- INSERINDO VALORES
INSERT INTO cadfun VALUES (26, 'SILVIO DE MENESES', '02','ANALISTA', 2000.00, '2006-08-10',1);
INSERT INTO cadfun VALUES (27, 'SILVIA DA SILVA', '05','ANALISTA', 2000.00, '2006-08-10',3);
INSERT INTO cadfun VALUES (28, 'ANTONIO DA SILVA', '05','GERENTE', 2184.33, '2006-09-05',2);
INSERT INTO cadfun VALUES (29, 'ANTONIA DE CARVALHO', '05','SECRETARIA', 2530.62, '2006-09-07',4);
INSERT INTO cadfun VALUES (30, 'SILVANA DOS SANTOS', '04','VENDEDOR', 1683.00, '2006-09-07',0);
INSERT INTO cadfun VALUES (31, 'ANTONIO DOS SANTOS', '04','PROGRAMADOR', 1155.00, '2006-10-10',1);
INSERT INTO cadfun VALUES (32, 'EPAMINONDASDA SILVA', '04','PROGRAMADOR', 1155.00, '2006-10-10',2);
-- ATUALIZANDO REGISTROS
UPDATE cadfun SET FILHOS = 0 WHERE CODFUN = 4;
UPDATE cadfun SET FILHOS = 0 WHERE CODFUN = 7;
UPDATE cadfun SET FILHOS = 0 WHERE CODFUN = 15;
UPDATE cadfun SET FILHOS = 0 WHERE CODFUN = 22;
UPDATE cadfun SET FILHOS = 0 WHERE CODFUN = 24;
-- AGRUPAMENTO DE DADOS
SELECT DEPTO,COUNT(*) AS REGISTROS FROM cadfun GROUP BY DEPTO;
SELECT FUNCAO,COUNT(*) AS REGISTROS FROM cadfun GROUP BY FUNCAO;
SELECT DEPTO,SUM(SALARIO) FROM cadfun GROUP BY DEPTO;
SELECT DEPTO,SUM(SALARIO) FROM cadfun WHERE DEPTO IN('02','04') GROUP BY DEPTO;
SELECT DEPTO,SUM(SALARIO) FROM cadfun GROUP BY DEPTO HAVING SUM(SALARIO) > 8000;
-- INSERINDO DADOS ARQUIVOMORTO
INSERT INTO ARQUIVOMORTO
SELECT *
FROM cadfun
-- DELETANDO REGISTROS...
DELETE FROM cadfun WHERE CODFUN IN (7,3,9,25,4,2,5,15);
-- UNI�O
SELECT CODFUN,NOME FROM cadfun UNION SELECT CODFUN, NOME FROM ARQUIVOMORTO ORDER BY CODFUN; -- ELE JUNTA OS REGISTRO DE 2 TABELAS

-- EXERC�CIOS
/*A*/ SELECT FUNCAO,COUNT(FUNCAO) FROM cadfun GROUP BY FUNCAO;
/*B*/ SELECT NOME, COUNT(FILHOS) AS FILHOS FROM cadfun WHERE NOT FILHOS IS NULL GROUP BY NOME ORDER BY FILHOS;
/*C*/ SELECT NOME, DEPTO FROM cadfun WHERE DEPTO = '05' UNION SELECT NOME,DEPTO FROM ARQUIVOMORTO WHERE DEPTO = '05' ORDER BY NOME;
/*D*/ SELECT NOME, DEPTO FROM cadfun WHERE FUNCAO = 'VENDEDOR' UNION SELECT NOME,DEPTO FROM ARQUIVOMORTO WHERE FUNCAO = 'VENDEDOR' ORDER BY NOME;
/*E*/ SELECT DEPTO,COUNT(CODFUN) AS QUANTFUN FROM cadfun WHERE NOME LIKE '%SILVA%' GROUP BY DEPTO;

sp_help arquivomorto;
sp_help cadfun;

-- 19/08/22
                                                                  -- ATIVIDADE 06 --

USE virtualdc;

CREATE INDEX index1 ON cadfun (NOME);

ALTER TABLE cadfun ADD CPF CHAR(11);

UPDATE cadfun SET CPF = '10020011199' WHERE CODFUN = 1;
UPDATE cadfun SET CPF = '10020022299' WHERE CODFUN = 6;
UPDATE cadfun SET CPF = '10020033399' WHERE CODFUN = 8;
UPDATE cadfun SET CPF = '10020044499' WHERE CODFUN = 10;
UPDATE cadfun SET CPF = '10020055599' WHERE CODFUN = 11;
UPDATE cadfun SET CPF = '10020066699' WHERE CODFUN = 12;
UPDATE cadfun SET CPF = '10020077799' WHERE CODFUN = 20;
UPDATE cadfun SET CPF = '10020088899' WHERE CODFUN = 21;
UPDATE cadfun SET CPF = '10022211199' WHERE CODFUN = 22;
UPDATE cadfun SET CPF = '10022233399' WHERE CODFUN = 24;

SELECT NOME ,CPF FROM cadfun WHERE CPF IS NOT NULL;

CREATE INDEX index2 ON cadfun (CPF);

INSERT INTO cadfun VALUES (24, 'MARCOS INACIO', '2', 'GERENTE', 2184.33, '2006-09-25',2, '11122233344');
INSERT INTO cadfun VALUES (50, 'MARCOS INACIO', '2', 'GERENTE', 2184.33, '2006-09-25',2, '11122233344');
INSERT INTO cadfun VALUES (55, 'MARIA JOSE', '3', 'GERENTE', 2184.33, '2006-09-25',2, '11122233344');

CREATE INDEX index3 ON cadfun (DEPTO,FUNCAO);

-- DROP INDEX index3 ON cadfun;

ALTER TABLE arquivomorto ADD CPF CHAR(11);

SELECT NOME,CPF FROM cadfun WHERE NOME LIKE 'M%';
SELECT A.NOME,B.NOME FROM cadfun AS A INNER JOIN ARQUIVOMORTO AS B ON A.NOME = B.NOME;
SELECT A.NOME,B.NOME FROM cadfun AS A FULL OUTER JOIN ARQUIVOMORTO AS B ON A.NOME = B.NOME;
SELECT NOME FROM cadfun WHERE NOME LIKE 'A%' GROUP BY NOME;

-- PROCEDURE

CREATE PROCEDURE aumento
@valor FLOAT
AS 
SELECT NOME,SALARIO * @valor FROM cadfun;

EXECUTE aumento 1.10;

