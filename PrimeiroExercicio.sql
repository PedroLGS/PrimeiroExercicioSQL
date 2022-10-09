CREATE DATABASE Clinica

USE Clinica

CREATE TABLE paciente (
num_beneficiario	INT				NOT NULL,
nome				VARCHAR(100)	NOT NULL,
logradouro			VARCHAR(200)	NOT NULL,
numero				INT				NOT NULL,
CEP					CHAR(8)			NULL,
complemento			VARCHAR(255)	NULL,
telefone			VARCHAR(11)		NOT NULL
PRIMARY KEY (num_beneficiario)
)

CREATE TABLE especialidade (
id					INT				NOT NULL,
especialidade		VARCHAR(200)	NOT NULL
PRIMARY KEY (id)
)

CREATE TABLE medico (
codigo				INT				NOT NULL,
nome				VARCHAR(100)	NOT NULL,
logradouro			VARCHAR(200)	NOT NULL,
numero				INT				NOT NULL,
CEP					CHAR(8)			NOT NULL,
complemento			VARCHAR(255)	NULL,
contato				VARCHAR(11)		NOT NULL,
especialidade_id	INT				NOT NULL
PRIMARY KEY (codigo)
FOREIGN KEY (especialidade_id) 
	REFERENCES especialidade (id)
)

CREATE TABLE consulta (
paciente_num_beneficiario	INT				NOT NULL,
medico_codigo				INT				NOT NULL,
data_hora					DATETIME		NOT NULL,
observacao					VARCHAR(255)	NOT NULL
PRIMARY KEY (paciente_num_beneficiario, medico_codigo,
	data_hora)
FOREIGN KEY (paciente_num_beneficiario)
	REFERENCES paciente(num_beneficiario),
FOREIGN KEY (medico_codigo)
	REFERENCES medico(codigo)
)

SELECT * FROM especialidade
SELECT * FROM medico
SELECT * FROM paciente
SELECT * FROM consulta

INSERT INTO especialidade VALUES
(1, 'Otorrinolaringolista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')

INSERT INTO medico VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 
	'Casa', '915689456', 1)

INSERT INTO medico VALUES
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 
	'Casa', '923235454', 1)

INSERT INTO medico VALUES
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 
	'Apto 205', '963698585', 2)

INSERT INTO medico VALUES
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 
	'Apto 602', '932458745', 3)

INSERT INTO paciente VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 
	'Casa', '922229999')

INSERT INTO paciente VALUES
(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, '03254010', 
	'Bloco B. Apto 25', '923450987')

INSERT INTO paciente VALUES
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 
	'Apto 1208', '912458765')

INSERT INTO paciente VALUES
(99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 
	'Casa', '945674312')

INSERT INTO paciente VALUES
(99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 
	'Conjunto 3 - Apto 801', '912095674')

INSERT INTO consulta VALUES 
(99901, 100002, '2021-09-04 13:20', 'Infecção Urina'),
(99902, 100003, '2021-09-04 13:15', 'Gripe'),
(99901, 100001, '2021-09-04 12:30', 'Infecção Garganta')

ALTER TABLE medico
ADD dia_atendimento VARCHAR(10)    NULL

UPDATE medico
SET dia_atendimento = '2° feira'
WHERE codigo = 100001

UPDATE medico
SET dia_atendimento = '4° feira'
WHERE codigo = 100002

UPDATE medico
SET dia_atendimento = '2° feira'
WHERE codigo = 100003

UPDATE medico
SET dia_atendimento = '5° feira'
WHERE codigo = 100004

DELETE especialidade
WHERE especialidade = 'Pediatra'

EXEC sp_rename 'dbo.medico.dia_atendimento', 'dia_semana_atendimento', 'column'

UPDATE medico
SET logradouro = 'Av. Bras Leme'
WHERE logradouro = 'Av. do Estado'

UPDATE medico
SET CEP = '02122000' 
WHERE CEP = '05241000'

UPDATE medico
SET complemento = 'Apto 504' 
WHERE complemento = 'Apto 205'

ALTER TABLE consulta
ALTER COLUMN observacao VARCHAR(200) NOT NULL