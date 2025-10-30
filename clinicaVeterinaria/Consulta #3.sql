CREATE DATABASE modelPraia
USE modelPraia

CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR (50) NOT NULL,
cpf CHAR (11) UNIQUE NOT NULL
)

CREATE TABLE funcionario(
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nomeFuncionario VARCHAR(50),
cpf CHAR(11) NOT NULL UNIQUE,
celular CHAR(11) NOT NULL
);

ALTER TABLE aluguel
ADD idEquipamento INT,
ADD CONSTRAINT fk_aluguel_Equipamento FOREIGN KEY (idEquipamento) REFERENCES equipamento (idEquipamento)


CREATE TABLE aluguel(
idAluguel INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT,
idEquipamento INT,
idFuncionario INT,
dataHoraRetirada DATETIME NOT NULL,
dataHoraDevolucao DATETIME,
valorAPagar DECIMAL (10,2),
valorPago DECIMAL (10,2),
pago BIT,
formaPagamento VARCHAR(50),
qtdVezes INT,
CONSTRAINT fk_aluguel_cliente FOREIGN KEY (idCliente) REFERENCES cliente (idCliente),
CONSTRAINT fk_aluguel_Equipamento FOREIGN KEY (idEquipamento) REFERENCES equipamento (idEquipamento),
CONSTRAINT fk_aluguel_Funcionario FOREIGN KEY (idFuncionario) REFERENCES funcionario (idFuncionario)
);

CREATE TABLE equipamento(
idEquipamento INT PRIMARY KEY AUTO_INCREMENT,
nomeEquipamento VARCHAR(50) UNIQUE,
qtd INT NOT NULL,
valorHora DECIMAL(5,2) NOT NULL
);

ALTER TABLE cliente 
ADD email VARCHAR (100) NULL,
ADD cidade VARCHAR (100) NOT NULL,
ADD estado CHAR(2) NOT NULL,
ADD endereco VARCHAR (200) NOT NULL
;

email, cidade, estado, endereço

ALTER TABLE cliente 
ADD tipoLogradouro VARCHAR(20) Not NULL UNIQUE,
ADD nomeLogradouro VARCHAR (50) NOT NULL,
ADD numero VARCHAR(8) NOT NULL,
ADD complemento VARCHAR (20) NULL,
ADD cep CHAR(8) NULL

DROP COLUMN endereco

ALTER TABLE cliente
DROP COLUMN tipologradouro 

ALTER TABLE CLIENTE
ADD tipoLogradouro VARCHAR (30);

SELECT *FROM CLIENTE

SHOW TABLE cliente
SHOW CREATE TABLE cliente
2) Apagar da Tabela Aluguel o atributo idEquipamento, pois criaremos uma outra tabela para conter tal atributo. Use o comando para dropar colunas para fazer isso.
 
DROP TABLE 
DELETE FROM aluguel WHERE idEquipamento;

ALTER TABLE equipamento
ADD nomeequipamento VARCHAR (50);
 
ALTER TABLE aluguel
DROP FOREIGN KEY fk_aluguel_Equipamento

ALTER TABLE aluguel
DROP COLUMN idEquipamento

SELECT * FROM CLIENTE

2) Criar a tabela associativa AluguelEquipamento com os seguintes atributos:
 
idAluguemEquipamento PK
idAluguel FKclinicavetclinicaveterinaria
idEquipamento FK
valorUnitario 
valorItem
quantidade

CREATE TABLE aluguelEquipamento (
idAluguemEquipamento INT PRIMARY KEY AUTO_INCREMENT,
idAluguel INT,
idEquipamento INT,
valorUnitario DECIMAL (5,2) NOT NULL,
valorItem DECIMAL (5,2) NOT NULL,
quantidade TINYINT
);

ALTER TABLE cliente
change COLUMN comnpleto complemento VARCHAR(100) NULL;

ALTER TABLE aluguelEquipamento
ADD CONSTRAINT fk_aluguel_aluguelEquipamento FOREIGN KEY (idAluguel) REFERENCES aluguel (idAluguel)

ALTER TABLE aluguelEquipamento
ADD CONSTRAINT fk_equipamento_aluguelEquipamento FOREIGN KEY (idEquipamento) REFERENCES equipamento (idEquipamento)

ALTER TABLE cliente
DROP CONSTRAINT 

ALTER TABLE cliente
DROP INDEX UQ_Clientes_Logradouro;
 
Use o novo modelo para inspecionar as propriedades!!!
 
3) Inserir 20 clientes segundo o seguinte critério:
 
INSERT TO cliente (
nomeCliente,
cpf,
tipoLogradouro,
nomeLogradouro,
numero,
complemento,
cep,
email,
cidade,
estado)
 
 
 
Donald, email uol, Santos SP, mora em casa 
Margarida, email uol, São Vicente SP,
Patinhas, email uol, Florianópolis SC, mora em casa 
Huguinho, email gmail, Santos SP,
Luizinho, email gmail, Praia Grande SP,
Zezinho, email gmail, São Vicente SP, mora em casa 
Pardal, email uol, Santos SP, mora em casa 
Zé Carioca, Rio de Janeiro RJ, mora em casa 
Mickey, email hotmail, Recife PE,
Minie,  email gmail, Recife PE,
Pateta,  email gmail, 
Branca de Neve, email hotmail, São Joaquim SC, 
Aladin, email gmail, Belém PA,
Cinderela, email hotmail, Goiania GO, mora em casa 
Mulan , email gmail, Rio das Ostras RJ,
Moana , email gmail, Parati RJ,
Asnésio, email uol, Belo Horizonte MG, 
Maga Patalógica, email gmail, Cubatão SP,
Capitão Boeing, email uol, Manaus AM, mora em casa
Pão Duro Mac Money, email ig, Osasco SP
 
 /* Script para inserir os 20 registros na tabela 'cliente'.
   Corrigi 'INSERT TO' para 'INSERT INTO'.
   Assumi que 'comnpleto' é 'complemento'.
*/

INSERT INTO cliente (
    nomeCliente,
    cpf,
    email,
    tipoLogradouro,
    nomeLogradouro,
    numero,
    complemento,
    cep,
    cidade,
    estado
)
VALUES
-- 1
('Donald', '111.111.111-11', 'donald@uol.com.br', 'Rua', 'da Sorte', '13', 'Casa', '11010-001', 'Santos', 'SP'),
-- 2
('Margarida', '222.222.222-22', 'margarida@uol.com.br', 'Avenida', 'da Praia', '123', 'Apto 44', '11310-002', 'São Vicente', 'SP'),
-- 3
('Patinhas', '333.333.333-33', 'patinhas@uol.com.br', 'Rua', 'do Cofre', '1', 'Casa (Caixa Forte)', '88010-003', 'Florianópolis', 'SC'),
-- 4
('Huguinho', '444.444.444-44', 'huguinho@gmail.com.br', 'Rua', 'dos Escoteiros', '10', NULL, '11020-004', 'Santos', 'SP'),
-- 5
('Luizinho', '555.555.555-55', 'luizinho@gmail.com.br', 'Avenida', 'Pres. Wilson', '20', NULL, '11700-005', 'Praia Grande', 'SP'),
-- 6
('Zezinho', '666.666.666-66', 'zezinho@gmail.com.br', 'Rua', 'Quinze de Novembro', '30', 'Casa', '11320-006', 'São Vicente', 'SP'),
-- 7
('Pardal', '777.777.777-77', 'pardal@uol.com.br', 'Avenida', 'Ana Costa', '42', 'Casa (Oficina)', '11030-007', 'Santos', 'SP'),
-- 8
('Zé Carioca', '888.888.888-88', 'zecarioca@gmail.com.br', 'Avenida', 'Copacabana', '500', 'Casa', '22010-008', 'Rio de Janeiro', 'RJ'),
-- 9
('Mickey', '999.999.999-99', 'mickey@hotmail.com.br', 'Rua', 'do Rato', '1928', 'Clube', '50010-009', 'Recife', 'PE'),
-- 10
('Minie', '010.101.010-10', 'minie@gmail.com.br', 'Rua', 'do Laço', '1930', 'Apto 101', '50020-010', 'Recife', 'PE'),
-- 11
('Pateta', '020.202.020-20', 'pateta@gmail.com.br', 'Avenida', 'dos Distraídos', 'S/N', NULL, '11410-011', 'Guarujá', 'SP'),
-- 12
('Branca de Neve', '030.303.030-30', 'brancadeneve@hotmail.com.br', 'Rua', 'das Maçãs', '7', 'Casa dos Anões', '88600-012', 'São Joaquim', 'SC'),
-- 13
('Aladin', '040.404.040-40', 'aladin@gmail.com.br', 'Travessa', 'do Tapete Mágico', '1001', 'Apto 5', '66010-013', 'Belém', 'PA'),
-- 14
('Cinderela', '050.505.050-50', 'cinderela@hotmail.com.br', 'Rua', 'do Sapatinho', '12', 'Casa (Meia-noite)', '74000-014', 'Goiânia', 'GO'),
-- 15
('Mulan', '060.606.060-60', 'mulan@gmail.com.br', 'Rua', 'do Dragão', '88', 'Academia', '28890-015', 'Rio das Ostras', 'RJ'),
-- 16
('Moana', '070.707.070-70', 'moana@gmail.com.br', 'Praça', 'do Oceano', '15', 'Beira Mar', '23970-016', 'Parati', 'RJ'),
-- 17
('Asnésio', '080.808.080-80', 'asnesio@uol.com.br', 'Rua', 'Pão de Queijo', '30', NULL, '30110-017', 'Belo Horizonte', 'MG'),
-- 18
('Maga Patalógica', '090.909.090-90', 'magapatalogica@gmail.com.br', 'Avenida', 'Nove de Abril', '666', 'Apto 13', '11510-018', 'Cubatão', 'SP'),
-- 19
('Capitão Boeing', '121.212.121-21', 'capitaoboeing@uol.com.br', 'Rua', 'das Nuvens', '747', 'Casa (Hangar)', '69000-019', 'Manaus', 'AM'),
-- 20
('Pão Duro Mac Money', '131.313.131-31', 'paoduromacmoney@ig.com.br', 'Rua', 'da Economia', '1', 'Apto 10', '06010-020', 'Osasco', 'SP');


4)Inserir 03 funcionários com dados aleatórios, mas com os seguintes nomes:
Cebolinha,
Cascão, 
Chico Bento

INSERT INTO funcionario(
nomeFuncionario,
cpf,
celular
)
VALUES
('Cebolinha', 12345667809, 1234567890),
('Cascão', 09876543289, 5643256789),
('Chico Bento', 23454367889, 2345672345);
 
-- Inserindo o Cebolinha
INSERT INTO FUNCIONARIO (
    nomeCliente,
    cpf,
    email,
    tipoLogradouro,
    nomeLogradouro,
    numero,
    complemento,
    cep,
    cidade,
    estado
)
VALUES (
    'Cebolinha Menezes',
    '11119111111',
    'cebolinha@limoeiro.com',
    'Rua',
    'do Estúdio',
    '123',
    'Apto 5',
    '01000000',
    'São Paulo',
    'SP'
);

-- Inserindo o Cascão
INSERT INTO cliente (
    nomeCliente,
    cpf,
    email,
    tipoLogradouro,
    nomeLogradouro,
    numero,
    complemento,
    cep,
    cidade,
    estado
)
VALUES (
    'Cascão Silva',
    '23222222222',
    'cascao@limoeiro.com',
    'Rua',
    'da Lama',
    '10',
    'Fundos',
    '01000001',
    'São Paulo',
    'SP'
);

-- Inserindo o Chico Bento
INSERT INTO cliente (
    nomeCliente,
    cpf,
    email,
    tipoLogradouro,
    nomeLogradouro,
    numero,
    complemento,
    cep,
    cidade,
    estado
)
VALUES (
    'Chico Bento da Roça',
    '33333383333',
    'chico@roca.com',
    'Sítio',
    'Pé de Goiaba',
    's/n',
    'Casa de Pau',
    '13300000',
    'Vila Abobrinha',
    'SP'
);
 
5)Inserir os seguintes equipamentos:
 
Cadeira 02 posições - 50 unidades - R$2,00
Cadeira 04 posições - 100 unidades - R$3,50
Guarda Sol P - 40 unidades - R$2,00
Guarda Sol G - 60 unidades - R$3,00
Mesinha - 30 unidades - R$1,50

INSERT INTO equipamento (
nomeEquipamento,
qtd,
valorHora
)
VALUES
('Cadeira 02 posições', 50, 2.00),
('Cadeira 04 posições', 100, 3.50),
('Guarda Sol P', 40, 2.00),
('Guarda Sol G', 60, 3.00),
('Mesinha',30,1.50);

SELECT * FROM ALUGUEL

6)Inserir o aluguel de 1 cadeiras 2 posições para o Pateta feita pelo Cebolinha, em 08/12/24. 
Fazer o update da quantidade retirando uma do estoque. 

SELECT nomecliente, idCliente  FROM cliente 
WHERE nomeCliente LIKE 'pateta' ; 

SELECT nomefuncionario, idfuncionario  FROM funcionario 
WHERE nomefuncionario LIKE 'ce%' ;

SELECT idequipamento, NOMEEQUIPAMENTO  FROM EQUIPAMENTO
WHERE nomeEquipamento LIKE 'cadeira %' ;

SELECT * FROM cliente
SELECT * FROM equipamento
SELECT * FROM aluguel
SELECT nomefuncionario, idfuncionario FROM funcionario
WHERE nomefuncionario LIKE 'Chico Bento'

idCliente  11 pateta
idfuncionairo 1 cebolinha
IDEQUIPAMENTO 1 CADEIRA 2 POSIÇOES,

CREATE TABLE aluguelEquipamento (
idAluguemEquipamento INT PRIMARY KEY AUTO_INCREMENT,
idAluguel INT,
idEquipamento INT,
valorUnitario DECIMAL (5,2) NOT NULL,
valorItem DECIMAL (5,2) NOT NULL,
quantidade TINYINT
);

 INSERT INTO aluguelequipamento 
 (idAluguel, idEquipamento, valorUnitario, ValorItem, quantidade)
 VALUES 
 ('1','1',35.89, 35.98,1)

ALTER TABLE aluguel
DROP column idEquipamento

ALTER TABLE aluguel
DROP FOREIGN KEY ;

insert into aluguel(
idCliente,
idEquipamento,
idFuncionario ,
dataHoraRetirada ,
dataHoraDevolucao ,
valorAPagar ,
valorPago,
pago,
formaPagamento,
qtdVezes)
VALUE 
('11','1','1','2024-12-24 14:59:15', NULL, 35.89, 0 ,NULL, NULL, NULL)

SELECT *FROM equipamento

UPDATE equipamento
SET
    qtd = 49
WHERE
    idEquipamento = 1;

7)Inserir o aluguel de 2 cadeiras 4 posições e um guarda sol G para o Mickey feita pelo Chico Bento, em dez 10/12/24.
Fazer o update da quantidade retirando do estoque. 

SELECT idCliente, nomeCliente FROM cliente
WHERE nomeCliente LIKE 'cebolinha'

SELECT idfuncionario, nomefuncionario FROM funcionario
WHERE nomefuncionario LIKE 'Cebolinha'

insert into aluguel(
idCliente,
idEquipamento,
idFuncionario ,
dataHoraRetirada ,
dataHoraDevolucao ,
valorAPagar ,
valorPago,
pago,
formaPagamento,
qtdVezes)
VALUE 
('11','1','1','2024-12-24 14:59:15', NULL, 35.89, 0 ,NULL, NULL, NULL)


insert into aluguel(
idCliente,
idEquipamento,
idFuncionario ,
dataHoraRetirada ,
dataHoraDevolucao ,
valorAPagar ,
valorPago,
pago,
formaPagamento,
qtdVezes)
VALUE 
('9','2','3','2024-12-10 14:59:15', NULL, 79.65, 0 ,NULL, NULL, NULL)

idCliente - 9
idFuncionário - 3

// 
 INSERT INTO aluguelequipamento 
 (idAluguel, idEquipamento, valorUnitario, ValorItem, quantidade)
 VALUES 
 ('2','2',79.65, 79.65,2)
 
SELECT * FROM cliente
SELECT * FROM equipamento
SELECT * FROM aluguel
SELECT * FROM aluguelEquipamento
SELECT nomefuncionario, idfuncionario FROM funcionario
WHERE nomefuncionario LIKE 'Chico Bento'

UPDATE equipamento
SET qtd = 98
WHERE idEquipamento = '2' 

8)Inserir o aluguel de 1 guarda sol P para 3 pessoas quaisquer feita pelo Cebolinha, em 27/12/24.
Fazer o update da quantidade retirando do estoque. 

insert into aluguel(
idCliente,
idEquipamento,
idFuncionario ,
dataHoraRetirada ,
dataHoraDevolucao ,
valorAPagar ,
valorPago,
pago,
formaPagamento,
qtdVezes)
VALUE 
('3','3', '1','2024-12-27 15:01:06', NULL, 96.56, 0, NULL,NULL, NULL),  
('4','3', '1','2024-12-27 16:31:06', NULL, 96.56, 0, NULL,NULL, NULL),
('5','3', '1','2024-12-27 17:01:06', NULL, 96.56, 0, NULL,NULL, NULL)

id funcionario = 1
id cliente = 3,4,5
idEquipamento - 
DATA -  27/12/24

SELECT *from aluguel
UPDATE equipamento
SET qtd = 37
WHERE idEquipamento = '3'

INSERT INTO aluguelequipamento 
 (idAluguel, idEquipamento, valorUnitario, ValorItem, quantidade)
 VALUES 
 ('3','3',79.65, 79.65,1),
 ('4','3',79.65, 79.65,1),
 ('5','3',79.65, 79.65,1)
 
 
9)Inserir o aluguel de 2 cadeiras 4 posições e um guarda sol G para 6 pessoas aleatórias feitas pelo Chico Bento, em dez 28/12/24. 
Fazer o update da quantidade retirando do estoque. 

insert into aluguel(
idCliente,
idFuncionario ,
dataHoraRetirada ,
dataHoraDevolucao ,
valorAPagar ,
valorPago,
pago,
formaPagamento,
qtdVezes)
VALUE 
('15','3','2024-12-28 11:01:06', NULL, NULL, NULL, NULL,NULL, NULL),  
('16','3','2024-12-28 12:31:06', NULL, NULL, NULL, NULL,NULL, NULL),
('17','3','2024-12-28 13:01:06', NULL, NULL, NULL, NULL,NULL, NULL),  
('18','3','2024-12-28 16:31:06', NULL, NULL, NULL, NULL,NULL, NULL),
('20','3','2024-12-28 16:31:06', NULL, NULL, NULL, NULL,NULL, NULL),
('22','3','2024-12-28 17:01:06', NULL, NULL, NULL, NULL,NULL, NULL)


idcliente = 15,16,17,18,20,22
idequipamento =  2, 4
idfuncionario = 3 (CHICO BENTO)
idAluguel = 6,7,8
qdt = 2 (CADEIRAS) E 1 GUARDA-SOL g 

UPDATE equipamento
SET qtd = 37
WHERE idEquipamento = '3'

 INSERT INTO aluguelequipamento 
 (idAluguel, idEquipamento, valorUnitario, ValorItem, quantidade)
 VALUES 
 ('6','4',79.65, 79.65,3)
 ('7','4',79.65, 79.65,3)
 ('8','4',79.65, 79.65,3)
 
SELECT * FROM cliente
SELECT * FROM equipamento
SELECT * FROM aluguel
SELECT * FROM aluguelequipamento
SELECT * FROM FUNCIONARIO

DELETE FROM aluguel
WHERE idAluguel = 8;

10)Listar o nome e os contatos de todos os clientes da barraca em ordem alfabética. 
11)Listar o nome e o contato telefônico de todos os funcionários da barraca em ordem alfabética. 
12)Listar todos os dados dos aluguéis realizados em ordem de data da mais antiga para a mais nova.
13)Listar nome, cidade e estado de todos os clientes da baixada santista em ordem alfabética por nome.
14)Listar todos os produtos e a quantidade de estoque do produto que tem mais itens para o que tem menos.
15)Listar o nome, a cidade e o estado de todos os clientes que moram em casa em ordem alfabética.
16)Listar o nome de todos os clientes e o estado daqueles que não vivem no estado de SP.
17)Listar o nome de todos os clientes que começam com a letra A.
18)Listar todos os dados dos clientes que começam com a letra M e vivam no estado de PE.
19)Listar apenas as cadeiras e a quantidade que possui em estoque em ordem de quantidade, da que mais possui itens para a que menos possui. 
20)Listar todos os dados dos alugueis que ocorreram entre 25/12 e 31/12 de 2024 em ordem de data da mais antiga para a mais nova. 
