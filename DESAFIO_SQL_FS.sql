CREATE DATABASE sistema_bancario;
USE sistema_bancario;
    
CREATE TABLE BANCO(
Codigo INT NOT NULL,
Nome VARCHAR(20) NOT NULL,
UNIQUE (Nome),
PRIMARY KEY(Codigo)
    );
    
CREATE TABLE AGENCIA(
Numero_agencia INT NOT NULL,
Endereco VARCHAR(40) NOT NULL, 
Cod_banco INT NOT NULL,
PRIMARY KEY (Numero_agencia, Cod_banco),
FOREIGN KEY (Cod_banco) REFERENCES BANCO (Codigo)
);
    
CREATE TABLE CONTA (
Numero_conta   CHAR(7)     NOT NULL, 
Saldo      DECIMAL(10,2)   NOT NULL, 
Tipo_conta     SMALLINT     NOT NULL, 
Num_agencia    INT, 
PRIMARY KEY (Numero_conta), 
FOREIGN KEY (Num_agencia) REFERENCES AGENCIA (Numero_agencia) 
);


CREATE TABLE cliente
(
cpf CHAR(14) NOT NULL,
nome VARCHAR(20) NOT NULL,
sexo CHAR(1) NOT NULL,
endereço VARCHAR (40),
PRIMARY KEY (cpf)
);

ALTER TABLE cliente
ADD COLUMN email VARCHAR(50);


INSERT INTO BANCO (Codigo, Nome) VALUES (1, 'Banco do Brasil');
INSERT INTO BANCO (Codigo, Nome) VALUES (2, 'Bradesco');

INSERT INTO AGENCIA (Numero_agencia, Endereco, Cod_banco) VALUES (1001, 'Rua A, 123', 1);
INSERT INTO AGENCIA (Numero_agencia, Endereco, Cod_banco) VALUES (1002, 'Rua B, 456', 1);
INSERT INTO AGENCIA (Numero_agencia, Endereco, Cod_banco) VALUES (2001, 'Av. C, 789', 2);

INSERT INTO CONTA (Numero_conta, Saldo, Tipo_conta, Num_agencia) VALUES ('1234567', 1000.00, 1, 1001);
INSERT INTO CONTA (Numero_conta, Saldo, Tipo_conta, Num_agencia) VALUES ('2345678', 5000.00, 2, 1002);
INSERT INTO CONTA (Numero_conta, Saldo, Tipo_conta, Num_agencia) VALUES ('3456789', 1500.00, 1, 2001);

INSERT INTO cliente (cpf, nome, sexo, endereço, email) 
VALUES ('123.456.789-10', 'João da Silva', 'M', 'Rua X, 123', 'joao.silva@uol.com');
INSERT INTO cliente (cpf, nome, sexo, endereço, email) 
VALUES ('123.456.789-11', 'Ruth Oliveira', 'F', 'Rua A, 456', 'ruth.oliveira@hotmail.com');
INSERT INTO cliente (cpf, nome, sexo, endereço, email) 
VALUES ('123.456.789-12', 'Marcia Santos', 'F', 'AV C, 789', 'marcia.santos@gmail.com');

SELECT * FROM BANCO;

SELECT * FROM AGENCIA;

SELECT * FROM CONTA;

SELECT * FROM cliente;

