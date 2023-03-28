-- DDL  CRIACAO DA TABELA PARA EXERCICIOS


CREATE TABLE FUNCIONARIOS
(
 ID INT NOT NULL,
 NOME VARCHAR2(50) NOT NULL,
 SALARIO DECIMAL(10,2),
 SETOR VARCHAR2(30), 
 PRIMARY KEY (id)
);

CREATE SEQUENCE ID_FUNC
 START WITH     1
 INCREMENT BY   1
 NOCACHE;


-- DML SELECT
-- EXEMPLO SELECT
--- Consultando todas as tabelas
SELECT * FROM funcionarios;

--- Consultando as colunas
SELECT nome FROM funcionarios;
SELECT id, nome, salario FROM funcionarios;
SELECT nome, salario FROM funcionarios;
SELECT id, salario FROM funcionarios;
SELECT setor FROM funcionarios;

--- N�o comuta
SELECT id, nome FROM funcionarios;
SELECT nome, id FROM funcionarios;

--- Coluna inexistente
SELECT sobrenome FROM funcionarios;

-- EXEMPLO SELECT - Exibir a coluna "setor" como "depto"
SELECT id,nome,salario,setor AS depto
FROM funcionarios;

-- DML INSERT

--- Exemplo de inser��o de dados (nova linha) sem especificar as colunas
INSERT INTO funcionarios VALUES (ID_FUNC.NEXTVAL, 'Leonardo', 30000, 'IT');
INSERT INTO funcionarios VALUES (ID_FUNC.NEXTVAL, 'Takashi', 25000, 'Dev');

--- Note que, no lugar onde est� definido como n�mero, ao colocar uma string vazia � retornado um null. Claro, o null foi definido como padr�o
INSERT INTO funcionarios VALUES (ID_FUNC.NEXTVAL, 'Takashi', '', 'DEV');

--- Note que, no lugar onde est� definido como n�mero, ao colocar uma string n�o vazio n�o ser� poss�vel colocar o dado.
INSERT INTO funcionarios VALUES (ID_FUNC.NEXTVAL, 'Takashi', 'Teramatsu', 'DEV');

--- N�o ser� poss�vel colocar o dado devido a insufici�ncia de par�metro e os par�metros n�o foi definido algum padr�o
INSERT INTO funcionarios VALUES (ID_FUNC.NEXTVAL, 'Takashi', 30000);
INSERT INTO funcionarios VALUES (ID_FUNC.NEXTVAL, 'Takashi', '');

SELECT * FROM funcionarios;

INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXTVAL,'Pedro',1000);
INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXTVAL,'Cleiton',1080);
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Joao',1000,'');
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Alexandre',3000,'');
INSERT INTO funcionarios (ID,nome,salario,setor) VALUES (ID_FUNC.NEXTVAL,'Jose',2000,'');


-- simulando erro
INSERT INTO funcionarios (ID,nome,salario) VALUES (ID_FUNC.NEXT_VAL,'Pedro','asasaasas');


-- DML UPDATE
UPDATE funcionarios SET salario = 1500
WHERE id=1;


-- OU Aumento de 50% sobre Salário atual.
-- Pelo visto, essa linguagem � de tipagem fraca.
UPDATE funcionarios SET salario=salario*1.5
WHERE id='2';

SELECT * FROM funcionarios;

-- exemplo update com mais de um campo
UPDATE funcionarios SET salario=salario*1.5,setor='TI'
WHERE id<>'1';

SELECT * FROM funcionarios;

-- DML DELETE
DELETE
FROM funcionarios
WHERE id='8';

DELETE FROM funcionarios;

SELECT * FROM funcionarios;

-- DML SELECT EVIDENCIA DA EXCLUSAO
SELECT * FROM funcionarios;
-- WHERE id='1';