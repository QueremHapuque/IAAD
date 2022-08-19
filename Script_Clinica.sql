-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Querem Hapuque Moura de Lima
-- Script do Banco de Dados Clínica Médica

begin;
drop schema if exists Clinicas_Medicas;
create schema Clinicas_Medicas;
use Clinicas_Medicas;

-- Criando as tabelas
create table Clinica(
	CodCli CHAR(3) NOT NULL,
	NomeCli VARCHAR (25),
	Endereco VARCHAR (40),
    Telefone VARCHAR (10),
    Email VARCHAR (25),
	PRIMARY KEY(CodCli),
    UNIQUE(Email));
create table Medico(
	CodMed CHAR(3) NOT NULL,
	NomeMed VARCHAR (25) NOT NULL, 
	Genero CHAR(1),
    Telefone VARCHAR (11),
    Email VARCHAR (25),
    CodEspec CHAR(3) NOT NULL,
    PRIMARY KEY(CodMed),
    UNIQUE(Email));
create table Paciente(
	CpfPaciente CHAR(11) NOT NULL,
    NomePac VARCHAR (25) NOT NULL,
	DataNascimento DATE NOT NULL,
    Genero CHAR(1),
    Telefone VARCHAR (11),
    Email VARCHAR(25),
	PRIMARY KEY (CpfPaciente),
    UNIQUE(Email));
create table ClinicaMedico(
	CodCli CHAR(3) NOT NULL,
	CodMed CHAR(3) NOT NULL,
    DataIngresso DATE NOT NULL,
    CargaHorariaSemanal DECIMAL(3,1),
	PRIMARY KEY(CodCli, CodMed));
create table AgendaConsulta(
	CodCli CHAR(3) NOT NULL,
	CodMed CHAR(3) NOT NULL,
    CpfPaciente CHAR(11) NOT NULL,
    Data_Hora DATETIME NOT NULL,
	PRIMARY KEY(CodCli, CodMed, CpfPaciente, Data_Hora));
create table Especialidade(
	CodEspec CHAR(3) NOT NULL,
	NomeEspec VARCHAR(25),
    Descricao VARCHAR (50) NOT NULL,
	PRIMARY KEY(CodEspec));

-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table Medico ADD FOREIGN KEY(CodEspec) REFERENCES Especialidade(CodEspec) ON UPDATE CASCADE;
alter table Medico ADD FOREIGN KEY(CodEspec) REFERENCES Especialidade(CodEspec) ON DELETE CASCADE;
alter table AgendaConsulta ADD FOREIGN KEY(CpfPaciente) REFERENCES Paciente(CpfPaciente) ON DELETE RESTRICT;
commit;