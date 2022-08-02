-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Querem Hapuque Moura de Lima
-- Script do Banco de Dados Startup
-- Script da Questão 2

begin;
drop schema if exists Statup_Querem; -- inclua seu nome
create schema Statup_Querem; -- Pode usar o comando 'create database empresa_seunome;' (São semelhantes!)
use Statup_Querem;

-- Criando as tabelas
create table Startup(
	id_startup INT PRIMARY KEY AUTO_INCREMENT,
	nome_startup VARCHAR (100) NOT NULL,
	cidade_sede VARCHAR (100) NOT NULL
	) AUTO_INCREMENT = 10001;
create table Linguagem_Programacao(
	id_linguagem INT PRIMARY KEY AUTO_INCREMENT,
	nome_linguagem VARCHAR (100) NOT NULL, 
	ano_lancamento YEAR
    ) AUTO_INCREMENT = 20001;
create table Programador(
	id_programador INT PRIMARY KEY AUTO_INCREMENT,
    id_startup INT(5) NOT NULL,
	nome_programador VARCHAR(100) NOT NULL,
    genero CHAR(1),
    data_nascimento DATE NOT NULL,
    email VARCHAR(100)
    ) AUTO_INCREMENT = 30001;
create table Programador_Linguagem(
	id_programador INT(5) NOT NULL,
	id_linguagem INT(5) NOT NULL,
	PRIMARY KEY(id_programador, id_linguagem));
 create table Produtos_Startup(
 	id_produto INT PRIMARY KEY AUTO_INCREMENT,
 	nome_produto VARCHAR(100) NOT NULL,
    id_startup INT(5) NOT NULL
 	) AUTO_INCREMENT = 40001;
	
-- populando/carregando as tabelas do banco de dados
insert into Startup (nome_startup, cidade_sede) values
    ('TechToy', 'Porto Alegre'),
    ('Smart123', 'Belo Horizonte'),
    ('knowledgeUp', 'Rio de Janeiro'),
    ('BSI Next Level', 'Recife'),
    ('QualiHealth', 'São Paulo'),
    ('ProEdu', 'Florianopolis');
insert into Linguagem_Programacao (nome_linguagem, ano_lancamento) values
    ( 'Python', '1991'),
    ('PHP', '1995'),
    ('Java', '1995'),
    ('C', '1972'),
    ('JavaScript', '1995'),
    ('Dart', '2011');
insert into Programador (id_startup, nome_programador, genero, data_nascimento, email) values
    ('10001', 'João Pedro', 'M', '1993-06-23', 'joaop@mail.com'),
    ('10002', 'Paula Silva', 'F', '1986-01-10', 'paulas@mail.com'),
    ('10003', 'Renata Vieira', 'F', '1991-07-05', 'renatav@mail.com'),
    ('10004', 'Felipe Santos', 'M', '1976-11-25', 'felipes@mail.com'),
    ('10001', 'Ana Cristina', 'F', '1968-02-19', 'anac@mail.com'),
    ('10004', 'Alexandre Alves', 'M', '1988-07-07', 'alexandrea@mail.com'),
    ('10002', 'Laura Marques', 'F', '1987-10-04', 'lauram@mail.com');
insert into Programador_Linguagem values
    ('30001', '20001'),
    ('30001', '20002'),
    ('30002', '20003'),
    ('30003', '20004'),
    ('30003', '20005'),
    ('30004', '20005'),
    ('30007', '20001'),
    ('30007', '20002');
insert into Produtos_Startup (nome_produto, id_startup) values
    ('Estudo Legal', '10001'),
    ('Television Routes', '10002'),
    ('Cool Product', '10003'),
    ('FlyFood', '10004'),
    ('Ginga Tops', '10004'),
    ('Life Hacking', '10005'),
    ('Echo Luren', '10006'),
    ('Dant Lost', '10006');
    

-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table Programador ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) ON UPDATE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador) ON DELETE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem) ON DELETE RESTRICT;
alter table Produtos_Startup ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) ON UPDATE CASCADE;
commit;
