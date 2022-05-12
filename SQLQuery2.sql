create database Escola;

create table Disciplinas(
	disciplinaID int identity(1,1) primary key,
	disciplina varchar(10)
);

insert into Disciplinas(disciplina)
			values('Matemática'),
				  ('Português'),
				  ('História'),
				  ('Geografia'),
				  ('Filosofia');

create table Turmas(
	turmaID int identity(1,1) primary key,
	turma int not null,
	FK_disciplina1 int,
	FK_disciplina2 int,
	constraint FK_disciplina1 foreign key(FK_disciplina1) references Disciplinas (disciplinaID),
	constraint FK_disciplina2 foreign key(FK_disciplina2) references Disciplinas (disciplinaID)
);

insert into Turmas(turma, fk_disciplina1, fk_disciplina2)
			values(605, 1, 3),
				  (608, 2, 5),
				  (601, 4, 5),
				  (610, 3, 4);

create table Alunos(
	alunoID int identity(1,1) primary key,
	fk_turmaID int foreign key(fk_turmaID) references Turmas(turmaID),
	nome varchar(10) not null,
);
insert into Alunos(fk_turmaID, nome)
			values(2, 'Diego'),
				  (1, 'Marcos'),
				  (3, 'Fabio'),
				  (1, 'Arthur'),
				  (4, 'Thiago');


create table Notas(
	notaID int identity(1,1) primary key,
	fk_alunoID int,
	fk_disciplinaID int,
	bimestre1 decimal(5,2) not null,
	bimestre2 decimal(5,2) not null,
	bimestre3 decimal(5,2) not null,
	bimestre4 decimal(5,2) not null,
	constraint fk_alunoID foreign key(fk_alunoID) references Alunos(alunoID),
	constraint fk_disciplinaID foreign key(fk_disciplinaID) references Disciplinas(disciplinaID)
);

insert into Notas(fk_alunoID, fk_disciplinaID, bimestre1, bimestre2, bimestre3, bimestre4)
			values(1, 2, 10, 8, 8.5, 9.6),
				  (1, 5, 9, 8, 10, 9),
				  (2, 1, 6, 8, 6.3, 9),
				  (2, 3, 7, 10, 9, 8),
				  (3, 4, 10, 8, 6.5, 7),
				  (3, 5, 7, 8.6, 9, 10);

use Escola;

select * from notas;

select alunos.nome,Turmas.turma ,disciplinas.disciplina, notas.bimestre1, notas.bimestre2, notas.bimestre3, notas.bimestre4
	from alunos
	inner join Notas
	on alunos.alunoID = notas.fk_alunoID
	inner join Turmas
	on Turmas.turmaID = Alunos.fk_turmaID
	inner join Disciplinas
	on disciplinas.disciplinaID = Notas.fk_disciplinaID;
	
delete from Alunos;
-- Disciplinas
-- alunos
-- turmas
-- notas