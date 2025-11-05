CREATE TABLE cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(200),
cpf CHAR(11) NOT NULL UNIQUE,
celular VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
cep CHAR(8) NULL,
tipoLogradouro VARCHAR(15) NOT NULL,
nomeLogradouro VARCHAR(50) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(30) NOT NULL
);

CREATE TABLE contato (
idcontato INT PRIMARY KEY AUTO_INCREMENT,
ddi VARCHAR(5) NOT NULL,
ddd VARCHAR(5) NOT NULL,
celular VARCHAR(13) NOT NULL,
idCliente INT NOT NULL,
CONSTRAINT fk_contato_cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE animal (
idAnimal Int Primary Key AUTO_INCREMENT,
idCliente INT NOT NULL,
nomeAnimal VARCHAR (45) NOT NULL,
especie VARCHAR (50) NOT NULL,
raca VARCHAR (45) NOT NULL,
peso DECIMAL (5,2), 
porte CHAR (1) NOT NULL ,
sexo char(1)  NOT NULL,
anoNascimento INT NOT NULL,
CONSTRAINT check_port CHECK (porte IN ('P', 'M', 'G','0')),
CONSTRAINT check_sexo CHECK (sexo IN ('M', 'F', 'N')),
CONSTRAINT fk_animal_cliente FOREIGN KEY (idCliente) REFERENCES cliente (idCliente)
);

CREATE TABLE veterinario (
idVeterinario INT PRIMARY KEY AUTO_INCREMENT,
nomeVeterinario VarChar (50) NOT NULL,
CRMV Varchar (20) NOT NULL UNIQUE,
celular char(11) NOT NULL,
especialidade varchar (50) NOT NULL
);

CREATE TABLE consulta (
idConsulta INT PRIMARY KEY AUTO_INCREMENT,
idAnimal INT NOT NULL,
idVeterinario INT NOT NULL,
dataHora DATETIME NOT NULL,
pago BIT DEFAULT 0,
formaPagto VARCHAR(50) NOT NULL,
qtdVezes TINYINT DEFAULT 1,
valorTotal DECIMAL (10,2) NOT NULL,
valorPago DECIMAL (10,2),
CONSTRAINT fk_consulta_animal FOREIGN KEY (idAnimal) REFERENCES animal (idAnimal),
CONSTRAINT fK_consulta_veterinario FOREIGN KEY (idVeterinario) REFERENCES veterinario (idVeterinario) 
);

CREATE TABLE tipoServico (
idTipoServico INT PRIMARY KEY AUTO_INCREMENT, 
nomeServico Varchar(50) NOT NULL,
valor DECIMAL (10,2) NOT NULL
);

CREATE TABLE consultaTipoServicoConsulta (
idConsultaTipoServico INT PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
idTipoServico INT NOT NULL,
valorServico DECIMAL (10,2),
CONSTRAINT fk_tipoServico_consultaTipoServicoConsulta FOREIGN KEY (idTipoServico) REFERENCES tipoServico (idTipoServico), 
CONSTRAINT fk_consulta_consultaTipoServicoConsulta FOREIGN KEY (idConsulta) REFERENCES consulta (idConsulta)
);

SHOW TABLES
SHOW DATABASES
DROP TABLE veterinário /*APAGAR TABELA*/
DROP TABLE CONSULTA
DROP TABLE cliente
CREATE DATABASE clinicaveterinaria
SELECT *from cliente

INSERT into cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(200),
cpf CHAR(11) NOT NULL UNIQUE,
celular VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
cep CHAR(8) NULL,
tipoLogradouro VARCHAR(15) NOT NULL,
nomeLogradouro VARCHAR(50) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(30) NOT NULL
);

INSERT INTO cliente (nomeCliente,cpf,celular,email,cidade,estado,cep,tipoLogradouro,numero,complemento)
VALUES (margarida, '77777777777','121111122222', 'margarida@gmail.com','São Paulo', 'SP`', '12334555', 'Alameda', 'Paulo','34', 'ap 24');

/*busca geral*/
SELECT * FROM cliente 

/*busca específica*/
SELECT nomeAnimal, peso FROM animal

INSERT INTO cliente (nomeCliente,cpf,celular,email,cidade,estado,cep,tipoLogradouro,numero,complemento)
VALUE ('06253313621','1978884805','breno@senac.com.br','ouro branco','SP','AV','jose','156','sem complemento');

SELECT *FROM cliente
SELECT celular,email,tipoLogradouro, nomelogradouro FROM cliente

INSERT INTO cliente (nomeCliente,cpf,celular,email,cidade,estado,cep,tipoLogradouro,numero,complemento)
VALUES ('João','06253313622','19788848054','brenocunh@senac.com.br','ouro brancoMG','SP','04110201','rua','156','ap 123');

INSERT INTO cliente (nomeCliente,cpf,celular,email,cidade,estado,cep,tipoLogradouro,numero,complemento)
VALUES ('maria','96253313622','39788848054','mrenocunh@senac.com.br','puro brancoMG','mp','84110201','alameda','156','ap 123');

INSERT INTO cliente
VALUES (3, margarida, '77777777777','1211111222', 'margarida@gmail.com','São Paulo', 'SP`', '12334555', 'Alameda', 'Paulo','34', 'ap 24');




SELECT nomecliente, cpf, cidade  FROM cliente 
WHERE nomeCliente LIKE 'A%' AND estado IN ('RJ', 'SP');

nomecliente, cpf, cidade 
LIKE 'f%' AND 

/*buscas por campos específicos*/
SELECT nomecliente, cpf, cidade FROM cliente
WHERE cidade = 'São Paulo' OR cidade='Guarujá'

SELECT nomecliente,cidade, estado FROM cliente
WHERE estado='SP'  
where estado='RJ' ,
LIKE 'a%'

/*operadores not <>, <, >, <=, <>  */  laravel , synfone 

SELECT idcliente, nomeCliente, cidade, estado, FROM cliente
ORDER BY nomeCLiente

INSERT INTO cliente (nomeCliente,cpf,celular,email,cidade,estado,cep,tipoLogradouro,nomelogradouro,numero,complemento)
VALUES 
('João da Silva' , '02345678901' , '11912345678' , 'joao.ilva@email.com' , 'São Paulo' , 'SP' , '01001000' , 'Rua' , 'Augusta' , '123' , 'Apto 12'),
('Ana Pereira' , '98765432199' , '21998765432' , 'ana.pereira@email.com' , 'Rio de Janeiro' , 'RJ' , '22041001' , 'Avenida' , 'Atlântica' , '456' , 'Bloco B'),
('Carlos Souza' , '34567890122' , '31991234567' , 'carlos.souza@email.com' , 'Belo Horizonte' , 'MG' , '30130110' , 'Rua' , 'da Bahia' , '890' , 'Sala 3'),
('Mariana Oliveira' , '45678901233' , '41987654321' , 'mariana.oliveira@email.com' , 'Curitiba' , 'PR' , '80010000' , 'Alameda' , 'Cabral' , '77' , 'Casa 2'),
('Pedro Gomes' , '56789012344' , '51999887766' , 'pedro.gomes@email.com' , 'Porto Alegre' , 'RS' , '90010150' , 'Rua' , 'dos Andradas' , '345' , 'Fundos'),
('Luciana Alves' , '67890123455' , '61912349876' , 'luciana.alves@email.com' , 'Brasília' , 'DF' , '70040010' , 'Setor' , 'Comercial Norte' , '25' , 'Sala 201'),
('Rafael Lima' , '78901234566' , '85998761122' , 'rafael.lima@email.com' , 'Fortaleza' , 'CE' , '60060350' , 'Avenida' , 'Beira Mar' , '999' , 'Cobertura'),
('Patrícia Ferreira' , '89012345677' , '71991238899' , 'patricia.ferreira@email.com' , 'Salvador' , 'BA' , '40015970' , 'Ladeira' , 'da Barra' , '58' , 'sem'),
('Fernando Costa' , '90123456788' , '19987654433' , 'fernando.costa@email.com' , 'Campinas' , 'SP' , '13010200' , 'Rua' , 'Conceição' , '312' , 'Sala 5'),
('Gabriela Santos' , '01234567899' , '27992345566' , 'gabriela.santos@email.com' , 'Vitória' , 'ES' , '29010180' , 'Avenida' , 'Beira Rio' , '500' , 'sem'),
('Bruno Rocha' , '11522233344' , '62981233344' , 'bruno.rocha@email.com' , 'Goiânia' , 'GO' , '74003010' , 'Rua' , '24 de Outubro' , '210' , 'Loja 1'),
('Isabela Mendes' , '22233344455' , '95992223344' , 'isabela.mendes@email.com' , 'Boa Vista' , 'RR' , '69301040' , 'Travessa' , 'das Flores' , '14' , 'sem'),
('Felipe Araújo' , '33344455566' , '92988775566' , 'felipe.araujo@email.com' , 'Manaus' , 'AM' , '69005040' , 'Avenida' , 'Eduardo Ribeiro' , '801' , 'Apto 303'),
('Larissa Martins' , '44455566677' , '48991112233' , 'larissa.martins@email.com' , 'Florianópolis' , 'SC' , '88010400' , 'Rua' , 'Felipe Schmidt' , '230' , 'sem'),
('André Teixeira' , '55566677788' , '98999001111' , 'andre.teixeira@email.com' , 'São Luís' , 'MA' , '65010030' , 'Avenida' , 'Pedro II' , '77' , 'Casa 1'),
('Beatriz Nogueira' , '66677788899' , '13988223344' , 'beatriz.nogueira@email.com' , 'Santos' , 'SP' , '11010001' , 'Rua' , 'Conselheiro Nébias' , '920' , 'Bloco A'),
('Rodrigo Ribeiro' , '77788899900' , '16991225566' , 'rodrigo.ribeiro@email.com' , 'Ribeirão Preto' , 'SP' , '14010060' , 'Avenida' , 'Independência' , '410' ,' sem'),
('Carla Fernandes' , '88899900011' , '84998123344' , 'carla.fernandes@email.com' , 'Natal' , 'RN' , '59020120' , 'Rua' , 'das Dunas' , '199' , 'sem'),
('Ricardo Barbosa' , '99900011122' , '67991122233' , 'ricardo.barbosa@email.com' , 'Campo Grande' , 'MS' , '79002970' , 'Avenida' , 'Afonso Pena' , '321' , 'Sala 10'),
('Vanessa Castro' , '10120230344' , '82999998888' , 'vanessa.castro@email.com' , 'Maceió' , 'AL' , '57020000' , 'Rua' , 'do Sol' , '76' , 'Fundos');

UPDATE cliente
SET nomelogradouro='pedro henrique'
WHERE idcliente=5

/*buscas básicas*/
SELECT * FROM cliente
WHERE nomeCliente LIKE 'b%'

SELECT nomecliente, cidade, estado, celular  FROM cliente 
WHERE nomeCliente LIKE 'f%' AND estado IN ('RJ', 'SP', 'ES','MG')
ORDER BY nomeCliente;

SELECT nomeCliente, cidade, estado FROM cliente
WHERE email LIKE '%@email.%' AND estado IN ('RJ', 'GO')
ORDER BY nomeCliente

DESC /*(ou contrario da ordem alfabética */

SELECT *FROM cliente
SELECT *FROM animal
SELECT *FROM veterinario
SELECT *FROM consulta
SELECT *FROM tiposervico
SELECT *FROM consultatiposervicoconsulta


INSERT INTO cliente (nomeCliente,cpf,celular, email, cidade, estado, 
cep, tipologradouro,nomelogradouro, numero, complemento) 
VALUES
('João da Silva' , '12345678909' , '11912345678' , 'uclienteoao.silva@email.com' , 'São Paulo' , 'SP' , '01001000' , 'Rua' , 'Augusta' , '123' , 'Apto 12'),
('Ana Pereira' , '98765432199' , '21998765432' , 'ana.pereira@email.com' , 'Rio de Janeiro' , 'RJ' , '22041001' , 'Avenida' , 'Atlântica' , '456' , 'Bloco B'),
('Carlos Souza' , '34567890122' , '31991234567' , 'carlos.souza@email.com' , 'Belo Horizonte' , 'MG' , '30130110' , 'Rua' , 'da Bahia' , '890' , 'Sala 3'),
('Mariana Oliveira' , '45678901233' , '41987654321' , 'mariana.oliveira@email.com' , 'Curitiba' , 'PR' , '80010000' , 'Alameda' , 'Cabral' , '77' , 'Casa 2'),
('Pedro Gomes' , '56789012344' , '51999887766' , 'pedro.gomes@email.com' , 'Porto Alegre' , 'RS' , '90010150' , 'Rua' , 'dos Andradas' , '345' , 'Fundos'),
('Luciana Alves' , '67890123455' , '61912349876' , 'luciana.alves@email.com' , 'Brasília' , 'DF' , '70040010' , 'Setor' , 'Comercial Norte' , '25' , 'Sala 201'),
('Rafael Lima' , '78901234566' , '85998761122' , 'rafael.lima@email.com' , 'Fortaleza' , 'CE' , '60060350' , 'Avenida' , 'Beira Mar' , '999' , 'Cobertura'),
('Patrícia Ferreira' , '89012345677' , '71991238899' , 'patricia.ferreira@email.com' , 'Salvador' , 'BA' , '40015970' , 'Ladeira' , 'da Barra' , '58' , null),
('Fernando Costa' , '90123456788' , '19987654433' , 'fernando.costa@email.com' , 'Campinas' , 'SP' , '13010200' , 'Rua' , 'Conceição' , '312' , 'Sala 5'),
('Gabriela Santos' , '01234567899' , '27992345566' , 'gabriela.santos@email.com' , 'Vitória' , 'ES' , '29010180' , 'Avenida' , 'Beira Rio' , '500' , null),
('Bruno Rocha' , '11122233344' , '62981233344' , 'bruno.rocha@email.com' , 'Goiânia' , 'GO' , '74003010' , 'Rua' , '24 de Outubro' , '210' , 'Loja 1'),
('Isabela Mendes' , '22233344455' , '95992223344' , 'isabela.mendes@email.com' , 'Boa Vista' , 'RR' , '69301040' , 'Travessa' , 'das Flores' , '14' , null),
('Felipe Araújo' , '33344455566' , '92988775566' , 'felipe.araujo@email.com' , 'Manaus' , 'AM' , '69005040' , 'Avenida' , 'Eduardo Ribeiro' , '801' , 'Apto 303'),
('Larissa Martins' , '44455566677' , '48991112233' , 'larissa.martins@email.com' , 'Florianópolis' , 'SC' , '88010400' , 'Rua' , 'Felipe Schmidt' , '230' , null),
('André Teixeira' , '55566677788' , '98999001111' , 'andre.teixeira@email.com' , 'São Luís' , 'MA' , '65010030' , 'Avenida' , 'Pedro II' , '77' , 'Casa 1'),
('Beatriz Nogueira' , '66677788899' , '13988223344' , 'beatriz.nogueira@email.com' , 'Santos' , 'SP' , '11010001' , 'Rua' , 'Conselheiro Nébias' , '920' , 'Bloco A'),
('Rodrigo Ribeiro' , '77788899900' , '16991225566' , 'rodrigo.ribeiro@email.com' , 'Ribeirão Preto' , 'SP' , '14010060' , 'Avenida' , 'Independência' , '410' , null),
('Carla Fernandes' , '88899900011' , '84998123344' , 'carla.fernandes@email.com' , 'Natal' , 'RN' , '59020120' , 'Rua' , 'das Dunas' , '199' , null),
('Ricardo Barbosa' , '99900011122' , '67991122233' , 'ricardo.barbosa@email.com' , 'Campo Grande' , 'MS' , '79002970' , 'Avenida' , 'Afonso Pena' , '321' , 'Sala 10'),
('Vanessa Castro' , '10120230344' , '82999998888' , 'vanessa.castro@email.com' , 'Maceió' , 'AL' , '57020000' , 'Rua' , 'do Sol' , '76' , 'Fundos');


DROP TABLE contato

INSERT INTO tiposervico (nomeservico, valor)
VALUES 
('Consulta Padrão',150),
('Consulta Emergência',250),
('Exame - Sangue',100),
('Exame - Ultrassom|Raio X',300),
('Vacina - Geral',100),
('Castração',80),
('Internação',600);

INSERT INTO animal (idCliente, nomeAnimal, especie, raca, peso, porte, sexo, anoNascimento)
VALUES
(1,  'Thor',  'Canino', 'SRD', 12.40, 'M', 'M', 2021),
(5,  'Maya',  'Felino', 'Siames', 4.20, 'P', 'F', 2023),
(7, 'Pingo', 'Canino', 'Pinscher', 3.10, 'P', 'M', 2022),
(29, 'Luna',  'Felino', 'Persa', 3.80, 'P', 'F', 2020),
(33, 'Zeca',  'Ave',    'Calopsita', 0.09, 'P', 'M', 2024);


INSERT INTO veterinario (nomeVeterinario, celular, crmv, especialidade)
VALUES 
('Farinhas Breno', 999999993, 19234511070, 'Vet de Animais Intolerantes Celíacos'),
('Camila Souza', 988887777, 20234511111, 'Cirurgiã de Pequenos Animais'),
('Rafael Nogueira', 997654321, 18256722222, 'Clínico Geral e Emergencista'),
('Larissa Almeida', 996543210, 17287633333, 'Especialista em Felinos'),
('Pedro Henrique', 995432109, 16234544444, 'Anestesista Veterinário'),
('Juliana Ribeiro', 994321098, 19298755555, 'Dermatologista de Animais Domésticos'),
('Lucas Fernandes', 993210987, 15287666666, 'Ortopedista Veterinário'),
('Ana Beatriz Costa', 992109876, 14234577777, 'Especialista em Animais Silvestres'),
('Gabriel Martins', 991098765, 13287688888, 'Cardiologista Veterinário'),
('Patrícia Lima', 990987654, 12234599999, 'Nutricionista Animal');

DESCRIBE consulta

INSERT INTO consulta (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
( 7, 1, "2025-11-03 12:23:45", 1, 'à vista', 1, 30.78, 38.78)
( 8, 1, "2025-11-03 15:23:45", 1, 'à vista', 1, 30.78, 38.78),
( 9, 1, "2025-11-03 17:23:45", 1, 'à vista', 1, 30.78, 38.78),
( 10, 1, "2025-11-03 19:23:45", 1, 'à vista', 1, 30.78, 38.78),
( 6, 1, "2025-11-03 23:23:45", 1, 'à vista', 1, 30.78, 38.78)


INSERT into consultatiposervicoconsulta (idConsulta,idTipoServico,valorServico)
VALUES 
(1, 1, 150.00),
(2, 3, 100.00),
(3, 4, 300.00),
(4, 6, 80.00),
(5, 3, 100.00),
(6, 1, 150.00)

-- Inserir 2 consultas com 1 procedimento cada para um mesmo animal da clínica, mas em dias diferentes; 


INSERT INTO consulta (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
( 6, 1, "2025-11-03 12:23:45", 1, 'pix', 1, 30.78, 38.78),
( 6, 1, "2025-12-03 15:23:45", 1, 'pix', 1, 30.78, 38.78);

INSERT into consultatiposervicoconsulta (idConsulta,idTipoServico,valorServico)
VALUES 
(7, 1, 150.00),
(8, 1, 150.00);

-- Inserir 1 cosulta com 2 procedimentos para um mesmo animal da clínica. 

INSERT INTO consulta (idAnimal, idVeterinario, dataHora, pago, formaPagto, qtdVezes, valorTotal, valorPago)
VALUES
( 7, 1, "2025-11-25 12:23:45", 1, 'pix', 1, 30.78, 38.78);

INSERT into consultatiposervicoconsulta (idConsulta,idTipoServico,valorServico)
VALUES 
(9, 1, 150.00),
(9, 2, 250.00);

-- veterinário (nome,crmv,datahora) que tinham consultas
 
SELECT nomeVeterinario,crmv,datahora FROM veterinario
INNER JOIN consulta 
ON veterinario.idVeterinario = consulta.idVeterinario

-- consulta de nomeCLiente e nomeAnimal  

SELECT nomecliente, nomeAnimal FROM cliente, 
INNER JOIN animal 
ON cliente.idcliente = animal.idcliente


SELECT nomeVeterinario,crmv, datahora, valorTotal 
FROM veterinario LEFT JOIN consulta
ON veterinario.idVeterinario = consulta.idveterinario


SELECT nomeVeterinario,crmv, datahora, valorTotal 
FROM consulta LEFT JOIN veterinario
ON consulta.idveterinario = veterinario.idVeterinario
WHERE nomeVeterinario LIKE 'P%'
ORDER BY nomeVeterinario, datahora Asc



SELECT nomeCLiente, nomeAnimal, celular, email
FROM cliente inner JOIN animal
ON cliente.idcliente = animal.idCliente
WHERE estado like 'SP' 
ORDER BY nomeanimal

SELECT nomeAnimal,nomeCliente,celular,email
FROM animal LEFT JOIN cliente
ON animal.idCliente = cliente.idCliente
WHERE estado LIKE 'SP'
ORDER BY nomeAnimal ASC

SELECT nomeCliente, cidade, estado FROM cliente
WHERE email LIKE '%@email.%' AND estado IN ('RJ', 'GO')
ORDER BY nomeCliente
