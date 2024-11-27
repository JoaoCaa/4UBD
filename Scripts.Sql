-- Criação do banco de dados
CREATE DATABASE Empresa;
USE Empresa;

-- Tabela EMPREGADO
CREATE TABLE EMPREGADO (
    RG CHAR(8) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CIC CHAR(8) UNIQUE NOT NULL,
    Depto INT NOT NULL,
    RG_Supervisor CHAR(8),
    Salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Depto) REFERENCES DEPARTAMENTO(Numero),
    FOREIGN KEY (RG_Supervisor) REFERENCES EMPREGADO(RG)
);

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    Numero INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    RG_Gerente CHAR(8) NOT NULL,
    FOREIGN KEY (RG_Gerente) REFERENCES EMPREGADO(RG)
);

-- Tabela PROJETO
CREATE TABLE PROJETO (
    Numero INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Localizacao VARCHAR(50) NOT NULL
);

-- Tabela DEPENDENTES
CREATE TABLE DEPENDENTES (
    RG_Responsavel CHAR(8),
    Nome_Depend VARCHAR(50) NOT NULL,
    Nascimento DATE NOT NULL,
    Relacao VARCHAR(20) NOT NULL,
    Sexo VARCHAR(10) NOT NULL,
    PRIMARY KEY (RG_Responsavel, Nome_Depend),
    FOREIGN KEY (RG_Responsavel) REFERENCES EMPREGADO(RG)
);

-- Tabela DEPARTAMENTO_PROJETO
CREATE TABLE DEPARTAMENTO_PROJETO (
    Numero_Depto INT,
    Numero_Projeto INT,
    PRIMARY KEY (Numero_Depto, Numero_Projeto),
    FOREIGN KEY (Numero_Depto) REFERENCES DEPARTAMENTO(Numero),
    FOREIGN KEY (Numero_Projeto) REFERENCES PROJETO(Numero)
);

-- Tabela EMPREGADO_PROJETO
CREATE TABLE EMPREGADO_PROJETO (
    RG_Empregado CHAR(8),
    Numero_Projeto INT,
    Horas INT NOT NULL,
    PRIMARY KEY (RG_Empregado, Numero_Projeto),
    FOREIGN KEY (RG_Empregado) REFERENCES EMPREGADO(RG),
    FOREIGN KEY (Numero_Projeto) REFERENCES PROJETO(Numero)
);

-- Inserção de dados
INSERT INTO EMPREGADO (RG, Nome, CIC, Depto, RG_Supervisor, Salario) VALUES
('10101010', 'João Luiz', '11111111', 1, NULL, 3000.00),
('20202020', 'Fernando', '22222222', 2, '10101010', 2500.00),
('30303030', 'Ricardo', '33333333', 2, '10101010', 2300.00),
('40404040', 'Jorge', '44444444', 2, '20202020', 4200.00),
('50505050', 'Renato', '55555555', 3, '20202020', 1300.00);

INSERT INTO DEPARTAMENTO (Numero, Nome, RG_Gerente) VALUES
(1, 'Contabilidade', '10101010'),
(2, 'Engenharia Civil', '30303030'),
(3, 'Engenharia Mecânica', '20202020');

INSERT INTO PROJETO (Numero, Nome, Localizacao) VALUES
(5, 'Financeiro 1', 'São Paulo'),
(10, 'Motor 3', 'Rio Claro'),
(20, 'Prédio Central', 'Campinas');

INSERT INTO DEPENDENTES (RG_Responsavel, Nome_Depend, Nascimento, Relacao, Sexo) VALUES
('10101010', 'Jorge', '1986-12-27', 'Filho', 'Masculino'),
('10101010', 'Luiz', '1979-11-18', 'Filho', 'Masculino'),
('20202020', 'Fernanda', '1969-02-14', 'Cônjuge', 'Feminino'),
('20202020', 'Ângelo', '1995-02-10', 'Filho', 'Masculino'),
('30303030', 'Adreia', '1990-05-01', 'Filho', 'Feminino');

INSERT INTO DEPARTAMENTO_PROJETO (Numero_Depto, Numero_Projeto) VALUES
(2, 5),
(3, 10),
(2, 20);

INSERT INTO EMPREGADO_PROJETO (RG_Empregado, Numero_Projeto, Horas) VALUES
('20202020', 5, 10),
('20202020', 10, 25),
('30303030', 5, 35),
('40404040', 20, 50),
('50505050', 20, 35);
