CREATE TABLE cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
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

SHOW TABLES

SHOW DATABASES

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



DROP TABLE veterinário /*APAGAR TABELA*/
DROP TABLE CONSULTA

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

DROP TABLE cliente

CREATE DATABASE clinicaveterinaria

USE clinicaveterinaria