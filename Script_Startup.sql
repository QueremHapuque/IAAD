-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Querem Hapuque Moura de Lima
-- Script do Banco de Dados Startup

begin;
drop schema if exists Statup_Querem; -- inclua seu nome
create schema Statup_Querem; -- Pode usar o comando 'create database empresa_seunome;' (São semelhantes!)
use Statup_Querem;

-- Criando as tabelas
create table Startup(
	id_startup CHAR(5) NOT NULL,
	nome_startup VARCHAR (100) NOT NULL,
	cidade_sede VARCHAR (100) NOT NULL,
	PRIMARY KEY(id_startup));
create table Linguagem_Programacao(
	id_linguagem CHAR(5) NOT NULL,
	nome_linguagem VARCHAR (100) NOT NULL, 
	ano_lancamento YEAR,
    PRIMARY KEY(id_linguagem));
create table Programador(
	id_programador CHAR(5) NOT NULL,
    id_startup CHAR(5) NOT NULL,
	nome_programador VARCHAR(100) NOT NULL,
    genero CHAR(1),
    data_nascimento DATE NOT NULL,
    email VARCHAR(100),
	PRIMARY KEY (id_programador),
    UNIQUE(email));
create table Programador_Linguagem(
	id_programador CHAR(5) NOT NULL,
	id_linguagem CHAR(5) NOT NULL,
	PRIMARY KEY(id_programador, id_linguagem));
create table Produtos_Startup(
	id_produto CHAR(5) NOT NULL,
	nome_produto VARCHAR(100) NOT NULL,
    id_startup CHAR(5) NOT NULL,
	PRIMARY KEY(id_produto));
	
-- populando/carregando as tabelas do banco de dados
insert into Startup values
    ('10001', 'TechToy', 'Porto Alegre'),
    ('10002', 'Smart123', 'Belo Horizonte'),
    ('10003', 'knowledgeUp', 'Rio de Janeiro'),
    ('10004', 'BSI Next Level', 'Recife'),
    ('10005', 'QualiHealth', 'São Paulo'),
    ('10006', 'ProEdu', 'Florianopolis');
insert into Linguagem_Programacao values
    ('20001', 'Python', '1991'),
    ('20002', 'PHP', '1995'),
    ('20003', 'Java', '1995'),
    ('20004', 'C', '1972'),
    ('20005', 'JavaScript', '1995'),
    ('20006', 'Dart', '2011');
insert into Programador values
    ('30001', '10001', 'João Pedro', 'M', '1993-06-23', 'joaop@mail.com'),
    ('30002', '10002', 'Paula Silva', 'F', '1986-01-10', 'paulas@mail.com'),
    ('30003', '10003', 'Renata Vieira', 'F', '1991-07-05', 'renatav@mail.com'),
    ('30004', '10004', 'Felipe Santos', 'M', '1976-11-25', 'felipes@mail.com'),
    ('30005', '10001', 'Ana Cristina', 'F', '1968-02-19', 'anac@mail.com'),
    ('30006', '10004', 'Alexandre Alves', 'M', '1988-07-07', 'alexandrea@mail.com'),
    ('30007', '10002', 'Laura Marques', 'F', '1987-10-04', 'lauram@mail.com');
insert into Programador_Linguagem values
    ('30001', '20001'),
    ('30001', '20002'),
    ('30002', '20003'),
    ('30003', '20004'),
    ('30003', '20005'),
    ('30004', '20005'),
    ('30007', '20001'),
    ('30007', '20002');
insert into Produtos_Startup values
    ('00000', 'Estudo Legal', '10001'),
    ('00001', 'Television Routes', '10002'),
    ('00002', 'Cool Product', '10003'),
    ('00003', 'FlyFood', '10004'),
    ('00004', 'Ginga Tops', '10004'),
    ('00005', 'Life Hacking', '10005'),
    ('00006', 'Echo Luren', '10006'),
    ('00007', 'Dant Lost', '10006');

-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table Programador ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) ON UPDATE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador) ON DELETE CASCADE;
alter table Programador_Linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem) ON DELETE RESTRICT;
alter table Produtos_Startup ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) ON UPDATE CASCADE;
commit;
