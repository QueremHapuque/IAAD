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
	CodMed CHAR(3),
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
    Descricao VARCHAR (70) NOT NULL,
 	PRIMARY KEY(CodEspec));
    
-- populando/carregando as tabelas do banco de dados
insert into Clinica values
	('101', 'PetLove', 'Rua das Flores', '8728822105', 'petlove@mail.com'),
    ('102', 'Luz do Sol', 'Rua Heitor Braga', '8736167897', 'luzsol@mail.com'),
    ('103', 'Mao Amiga', 'Travessia Rosa e Silva', '8131747401', 'maoamiga@mail.com'),
    ('104', 'Amor Silvestre', 'Travessia das Luzes', '8127132680', 'amor.silvestre@mail.com'),
    ('105', 'Cruz e Rosas', 'Rua Maria Braga Silva', '8735531623', 'cruz.rosas@mail.com');

insert into Medico values
	('201', 'Luiz Henrique Braga Neto', 'M', '81997802526', 'luizbneto@mail.com', '301'),
    ('202', 'Eduarda Maria Lima', 'F', '81995481697', 'dudalima@mail.com', '306'),
    ('203', 'Marlon Henrique Souza', 'M', '81988745995', 'souza_marlon@mail.com', '305'),
    ('204', 'Luana Maria', 'F', '81992548790', 'maria.luana@mail.com', '307'),
    ('205', 'Carla Lima', 'F', '81987415212', 'carla_lima@mail.com', '303'),
    ('206', 'Cleide Farias', 'F', '81988745962', 'cleidefarias@mail.com', '307'),
    ('207', 'Carlos Moura', 'M', '81950214569', 'carlosmoura@mail.com', '301'),
    ('208', 'Manoel Braga', 'M', '81999874512', 'manoel_braga@mail.com', '302'),
    ('209', 'Jessica Farias', 'F', '81988547120', 'farias.jessica@mail.com', '302'),
    ('210', 'Heitor Freitas', 'M', '81974589620', 'heitorfreitas@mail.com', '304');

insert into Paciente values
	('85504520096', 'Nemo', '2020-12-24', 'M', '81997073226', 'hapuque.lima@mail.com'),
    ('53464371000', 'Maria Jose da Silva', '1992-05-24', 'F', '81999875654', 'mariajose@mail.com'),
    ('61133639020', 'Larissa Lopes', '1985-07-15', 'F', '81978496321', 'lari.lopes@mail.com'),
    ('25501663023', 'Paola Oliveira', '2001-12-05', 'F', '81974859621', 'paola.oli@mail.com'),
    ('12612574489', 'Pepe', '2020-04-07', 'M', '81994569874', 'rhuan@mail.com'),
    ('41516942000', 'Hugo Lins', '2000-12-07', 'M', '81988745963', 'lins.hugo@mail.com'),
    ('90545044049', 'Pongo', '2021-05-31', 'M', '81987456932', 'arquiles.freitas@mail.com'),
    ('93969969042', 'Rodrigo Alves', '1994-01-30', 'M', '81988745693', 'rodrigoalves@mail.com'),
    ('64368589033', 'Lilica', '2021-06-19', 'F', '81987412365', 'querem@mail.com'),
    ('62398900061', 'Manoel Neto', '1975-03-21', 'M', '81998745693', 'manoel_neto@mail.com'),
    ('16625191094', 'Laura Menezes', '1985-04-19', 'F', '81990023569', 'lau.menezes@mail.com'),
    ('25172056041', 'Luiza Souza', '1996-06-06', 'F', '81997789654', 'luiza.souza@mail.com');

insert into ClinicaMedico values
	('101', '205', '2022-03-07', 40.0),
    ('101', '209', '2012-09-20', 18.5),
    ('102', '202', '2016-12-06', 27.6),
    ('102', '203', '2017-05-14', 45.0),
    ('103', '201', '2014-11-27', 35.0),
    ('103', '206', '2018-08-12', 30.0),
    ('103', '208', '2020-11-17', 32.5),
    ('104', '209', '2009-05-08', 25.0),
    ('104', '204', '2004-03-15', 20.0),
    ('105', '206', '2019-02-02', 40.5);

insert into AgendaConsulta values
	('101', '210', '90545044049', '2020-06-03 15:30:00'),
    ('102', '202', '61133639020', '2020-11-15 09:00:00'),
    ('103', '201', '41516942000', '2019-12-07 12:00:00'),
    ('104', '204', '85504520096', '2017-11-27 08:30:00'),
    ('104', '209', '12612574489', '2018-05-04 18:30:00'),
    ('104', '204', '64368589033', '2019-02-25 20:30:00'),
    ('105', '206', '16625191094', '2021-09-30 19:30:00');

insert into Especialidade values
	('301', 'Cardiologia', 'Cuida da saude do coracao'),
    ('302', 'Ortopedia', 'Cuida da saude dos ossos'),
    ('303', 'Fisioterapia', 'Restabelece pacientes que apresentam problemas de movimentacao'),
    ('304', 'Dermatologia', 'Cuida da pele'),
    ('305', 'Gastroenterologia', 'Cuida da saude das vias urinarias e do sistema reprodutor do homem'),
    ('306', 'Ginecologia', 'Cuida da saude da mulher'),
    ('307', 'Oncologia', 'Estuda e trata os diversos tipos de câncer');

-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table Medico ADD FOREIGN KEY(CodEspec) REFERENCES Especialidade(CodEspec) ON DELETE CASCADE ON UPDATE CASCADE;
alter table AgendaConsulta ADD FOREIGN KEY(CpfPaciente) REFERENCES Paciente(CpfPaciente) ON DELETE RESTRICT;
commit;