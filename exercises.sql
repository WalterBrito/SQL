CREATE DATABASE BancoDeDados;

--------------- Cria as tabelas ----------------------------
Create Table Tipo(
IDTipo	 	int 			not null	primary key,
Nome		varchar(50)		not null
);

Create Table Instrutor(
IDInstrutor	int			not null	primary key,
Nome		varchar(50)		not null,
Telefone	int			not null
);
----------------- ADD coluna na tabela instrutor -----------------
Alter Table Instrutor ADD Column Email  varchar(100) not null Default '0'
Alter table Instrutor Drop Column Email;

Create Table Curso(
IDCurso		int		not null	primary key,
IDTipo		int		not null	references Tipo(IDTipo),
IDInstrutor	int 		not null	references Instrutor(IDInstrutor),
Nome		varchar(50)	not null,
Valor		float		not null
);
----------------- Cria um indice instrutor -----------------
Create Index InstrutorCurso On Curso(IDInstrutor);
------------------------------------------------------------

Create Table Aluno(
IDAluno		int		not null	primary key,
Nome		varchar(50)	not null,
Endereco	varchar(50)	not null,
Email		varchar(30)	not null
);
-------------- Adiciona uma coluna na tabela ----------------------------------
Alter Table Aluno ADD Data_Nascimento varchar(10) Not Null Default '0' 
--------------- Altera o nome de uma coluna -----------------------------------
Alter Table Aluno Rename Column Data_Nascimento To Nascimento;
--------------- Altera um tipo de dado ------------------------------------------
Alter Table Aluno Alter Column Nascimento Type varchar(10) using Nascimento::Date;
--------------- Criar um indice -------------------------------------------------
Create Index AlunoIndice On Aluno(Nome);
--------------------------------------------------------------------------------

Create Table Pedido(
IDPedido	int		not null	primary key,
IDAluno		int		not null	references Aluno(IDAluno),
Data		date		not null,
Hora		time		not null
);

Create Table PedidoDetalhe(
IDPedido	int		not null	references Pedido(IDPedido),
IDCurso		int		not null	references Curso(IDCurso),
Valor		float(5)	not null
);

------------------- inseri os dados -------------------------
Insert Into Tipo(IDTipo, Nome) Values (1, 'Banco de Dados')
Insert Into Tipo(IDTipo, Nome) Values (2, 'Programação')
Insert Into Tipo(IDTipo, Nome) Values (3, 'Modelagem de Dados')
---------------------------------------------------------------

------------------- inseri os dados instrutor-------------------------
Insert Into Instrutor(IDInstrutor, Nome, Telefone)
Values (1, 'Jensen Johhanson', 1111-1111)
Insert Into Instrutor(IDInstrutor, Nome, Telefone)
Values (2, 'Phillip Phillips', 2222-2222)
----------------------------------------------------------------------

------------------- inseri os dados Curso ----------------------------
Insert Into Curso(IDCurso, Nome, IDTipo, IDInstrutor, Valor)
Values (1, 'Java Fundamentos', 2, 1, 270)
Insert Into Curso(IDCurso, Nome, IDTipo, IDInstrutor, Valor)
Values (2, 'Python', 2, 1, 330)
Insert Into Curso(IDCurso, Nome, IDTipo, IDInstrutor, Valor)
Values (3, 'Ruby', 2, 1, 230)
Insert Into Curso(IDCurso, Nome, IDTipo, IDInstrutor, Valor)
Values (4, 'SQL Completo',1, 2, 330)
Insert Into Curso(IDCurso, Nome, IDTipo, IDInstrutor, Valor)
Values (5, 'PHP Básico', 1, 2, 150)
Insert Into Curso(IDCurso, Nome, IDTipo, IDInstrutor, Valor)
Values (6, 'PYthon e Django', 2, 1, 550)
----------------- Aumenta em 10% valor do curso menor 300 -------------
----------------- Operador de multiplacar ----------------------------
Select (Valor + 0.10 * 100) From Curso Where Valor < 300 
Update Curso Set Nome  = 'PHP Fundamentos' Where Nome = 'PHP Básico'
----------------------------------------------------------------------

------------------- inseri os dados Aluno -----------------------------------------
Insert Into Aluno(IDAluno, Nome, Endereco, Email, Nascimento)
Values (1, 'José', 'Rua XV de Novembro 72', 'jose@softblue.com.br', '09/02/1980')
Insert Into Aluno(IDAluno, Nome, Endereco, Email, Nascimento)
Values (2, 'Wagner ', 'Av. Paulista', 'wagner@softblue.com.br', '15/12/1990')
Insert Into Aluno(IDAluno, Nome, Endereco, Email, Nascimento)
Values (3, 'Emílio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br', '11/04/1994')
Insert Into Aluno(IDAluno, Nome, Endereco, Email, Nascimento)
Values (4, 'Cris', 'Rua Tauney 22', 'cris@softblue.com.br', '19/07/1992')
--------------- Atualiza os dados dos alunos -------------------------------------
-- Esqueci o Where e atualizei tudo rsrs, mas modifiquei novamente ---
Update Aluno Set Endereco = 'Av. Brasil 778'
Update Aluno Set Endereco = 'Av. Paulista' Where Nome = 'Wagner'
Update Aluno Set Endereco = 'Rua Lajes 103, ap: 701' Where Nome = 'Emílio'
Update Aluno Set Email = 'cristiano@softblue.com.br' Where Nome = 'Cris'
Update Aluno Set IDAluno = 5 Where IDAluno = 1
--------------------------------------------------------------------------------

------------------- inseri os dados Pedido ----------------------------
Insert Into Pedido(IDPedido, IDAluno, Data, Hora)
Values (1, 1, '06-20-2016', '14:34:08');
Insert Into Pedido(IDPedido, IDAluno, Data, Hora)
Values (2, 2, '08-16-2016', '15:35:08');
Insert Into Pedido(IDPedido, IDAluno, Data, Hora)
Values (3, 3, '05-08-2016', '16:38:58');
--------------------------------------------------------------------------------

------------------- inseri os dados PedidoDetalhe ----------------------------
Insert Into PedidoDetalhe(IDPedido, IDCurso, Valor)
Values(1, 2, 330)
Insert Into PedidoDetalhe(IDPedido, IDCurso, Valor)
Values(2, 3, 230)
Insert Into PedidoDetalhe(IDPedido, IDCurso, Valor)
Values(3, 4, 330)
Insert Into PedidoDetalhe(IDPedido, IDCurso, Valor)
Values(2, 1, 270)
Insert Into PedidoDetalhe(IDPedido, IDCurso, Valor)
Values(1, 5, 150)
--------------------------------------------------------------------------------

--------------- Seleciona todos os alunos -------------------------------------
Select * From Aluno
---------------- Seleciona o nome dos cursos ---------------------------------
Select Nome From Curso
---------------- Seleciona o nome e o valor dos cursos menores que 200 ---------
Select Nome, Valor From Curso where valor < 200
---------------- Seleciona o nome e o valor dos cursos maior que 200 e menor que 300 ---------
Select Nome, Valor From Curso where valor > 200 and Valor < 300
---------------- Seleciona o datas em intervalos especificos ---------------------
Select * From Pedido Where Data Between '05-08-2016' and '08-16-2016'
---------------- Seleciona a data especifica  --------------------
Select Data From Pedido Where Data = '08-16-2016'

-------------------- Utilizando o Inner Join -------------------------------------
-- Exiba uma lista com os títulos dos cursos da Softblue e o tipo de curso ao lado;--
Select Curso.Nome, Tipo.Nome
From Curso Inner Join Tipo 
On Curso.IDTipo = Tipo.IDTipo;

-- Exiba uma lista com os títulos dos cursos da Softblue, tipo do curso, nome do instrutor responsável pelo mesmo e telefone;--
SELECT Curso.Nome, Tipo.Nome, Instrutor.Nome, Instrutor.Telefone
From Curso INNER JOIN Tipo 
ON Curso.IDTipo = Tipo.IDTipo
INNER JOIN Instrutor
ON Curso.IDInstrutor = Instrutor.IDInstrutor;

-- Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido; --
SELECT Pedido.IDPedido, Pedido.Data, Pedido.Hora, PedidoDetalhe.IDCurso 
From Pedido INNER JOIN PedidoDetalhe
ON Pedido.IDPedido = PedidoDetalhe.IDPedido;

-- Exiba uma lista com o código e data e hora dos pedidos e os títulos dos cursos de cada pedido; --
SELECT Pedido.IDPedido, Pedido.Data, Pedido.Hora, PedidoDetalhe.IDCurso, Curso.Nome 
From Pedido INNER JOIN PedidoDetalhe
ON Pedido.IDPedido = PedidoDetalhe.IDPedido
INNER JOIN Curso
ON PedidoDetalhe.IDCurso = Curso.IDCurso;

-- Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido; --
SELECT Pedido.IDPedido, Pedido.Data, Pedido.Hora, PedidoDetalhe.IDCurso, Aluno.Nome, Curso.Nome 
From Pedido INNER JOIN PedidoDetalhe
ON Pedido.IDPedido = PedidoDetalhe.IDPedido
INNER JOIN Curso
ON PedidoDetalhe.IDCurso = Curso.IDCurso
INNER JOIN Aluno 
ON Pedido.IDAluno = Aluno.IDAluno;
-----------------------------------------------------------------------------------------------------------------

----------------------------------------- Criando Views --------------------------------------------------
-- Crie uma visão que traga o título e preço somente dos cursos de programação da Softblue; --
CREATE VIEW CursosProgramacao
AS SELECT Curso.Nome, Curso.Valor 
FROM Curso
INNER JOIN  Tipo 
ON Curso.IDTipo = Tipo.IDTipo
WHERE Tipo.Nome = 'Programação';

--- Seleciona a view --
SELECT * FROM CursosProgramacao

-- Crie uma visão que traga os títulos dos cursos, tipo do curso e nome do instrutor; --
CREATE VIEW NomeCursos_TiposCursos_NomeInstrutor
AS SELECT Curso, Tipo, Instrutor.Nome
FROM Curso
INNER JOIN Tipo
ON Curso.IDTipo = Tipo.IDTipo
INNER JOIN Instrutor
ON Curso.IDInstrutor = Instrutor.IDInstrutor;

--- Seleciona a view --
SELECT * FROM NomeCursos_TiposCursos_NomeInstrutor
---------------------------------------------------------------------------------------------------------------

----- Crie uma visão que exiba os pedidos realizados, informando o nome do aluno, data e código do pedido; ----
CREATE VIEW PedidosRealizados
AS SELECT Aluno.Nome, Pedido.Data, Pedido.IDPedido
FROM Pedido
INNER JOIN Aluno
ON Pedido.IDAluno = Aluno.IDAluno

--- Seleciona a view --
SELECT * FROM PedidosRealizados
---------------------------------------------------------------------------------------------------------------

------------------ Usando o Distinct -------------------
/* Selecione os nomes de todos os alunos que já fizeram 
alguma matrícula na Softblue, sem repetição; */
SELECT DISTINCT(Aluno.Nome) FROM Pedido 
INNER JOIN Aluno
ON Pedido.IDAluno = Aluno.IDAluno;

-- Exiba o nome do aluno mais antigo da Softblue; --
SELECT DISTINCT Aluno.Nome, Pedido.Data FROM Pedido 
INNER JOIN Aluno
ON Pedido.IDAluno = Aluno.IDAluno
ORDER BY Data ASC LIMIT 1;

-- Exiba o nome do aluno mais recente da Softblue;--
SELECT DISTINCT Aluno.Nome, Pedido.Data FROM Pedido 
INNER JOIN Aluno
ON Pedido.IDAluno = Aluno.IDAluno
ORDER BY Data DESC LIMIT 1; 

-- Exiba o nome do terceiro aluno mais antigo da Softblue; --
SELECT DISTINCT Aluno.Nome, Pedido.Data FROM Pedido 
INNER JOIN Aluno
ON Pedido.IDAluno = Aluno.IDAluno
ORDER BY Data ASC LIMIT 1 OFFSET 2;

-- Exiba a quantidade de cursos que já foram vendidos pela Softblue; --
SELECT COUNT(*) FROM PedidoDetalhe;

-- Exiba o valor total já arrecadado pelos cursos vendidos pela Softblue; --
SELECT SUM(Valor) FROM PedidoDetalhe;

-- Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2; --
SELECT AVG(Valor) FROM PedidoDetalhe 
WHERE IDPedido = 2;

--Exiba o valor do curso mais caro da Softblue; --
SELECT MAX(Valor) FROM PedidoDetalhe;

--Exiba o valor do curso mais barato da Softblue; --
SELECT MIN(Valor) FROM PedidoDetalhe;

-- Exiba o valor total de cada pedido realizado na Softblue; --
SELECT IDPedido, SUM(Valor) FROM PedidoDetalhe 
GROUP BY IDPedido;

/* Exiba os nomes dos instrutores da Softblue e a quantidade
de cursos que cada um tem sob sua responsabilidade; */
SELECT Instrutor.Nome, COUNT(*) From Curso
INNER JOIN Instrutor
ON Curso.IDInstrutor = Instrutor.IDInstrutor
GROUP BY Instrutor.Nome;

/* Exiba o número do pedido, nome do aluno e valor para todos os pedidos
realizados na Softblue cujo valor total sejam maiores que 500; */
SELECT Pedido.IDPedido, Aluno.Nome, SUM(Valor) FROM PedidoDetalhe
INNER JOIN Pedido
On PedidoDetalhe.IDPedido = Pedido.IDPedido
INNER JOIN Aluno
ON Pedido.IDAluno = Aluno.IDAluno
GROUP BY Pedido.IDPedido,  Aluno.Nome
HAVING SUM(Valor) > 500;

/* Exiba o número do pedido, nome do aluno e quantos cursos foram comprados
no pedido para todos os pedidos realizados na Softblue que compraram dois ou mais cursos;*/
SELECT Pedido.IDPedido, Aluno.Nome, COUNT(*) From PedidoDetalhe
INNER JOIN Pedido
On PedidoDetalhe.IDPedido = Pedido.IDPedido
INNER Join Aluno
ON Pedido.IDAluno = Aluno.IDAluno
GROUP BY Pedido.IDPedido, Aluno.Nome
HAVING COUNT(*) > 1;

-- Exiba o nome e endereço de todos os alunos que morem em Avenidas (Av.); --
SELECT Aluno.Nome, Aluno.Endereco FROM Aluno
WHERE Aluno.Endereco LIKE '%Av.%';

-- Exiba os nomes dos cursos de Java da Softblue; --
SELECT Curso.Nome FROM Curso 
WHERE Curso.Nome LIKE '%Java%';

-- Subqueries --
/* Utilizando subquery, exiba uma lista com os nomes dos cursos disponibilizados
pela Softblue informando para cada curso qual o seu menor valor de venda já praticado; */
SELECT Curso.Nome,(SELECT MIN(Valor) FROM PedidoDetalhe
WHERE PedidoDetalhe.IDCurso = Curso.IDCurso)
AS Menor_Valor From Curso; 

/* Utilizando subquery e o parâmetro IN, exiba os nomes dos cursos disponibilizados pela
Softblue cujo tipo de curso seja 'Programação'; */
SELECT Curso.Nome FROM Curso
WHERE Curso.IDCurso IN (SELECT Tipo.IDTipo FROM Tipo 
WHERE Tipo.Nome = 'Programação');   

/* Utilizando subquery e o parâmetro EXISTS, exiba novamente os nomes dos cursos disponibilizados
pela Softblue cujo tipo de curso seja 'Programação'; */
SELECT Curso.Nome FROM Curso
WHERE EXISTS (SELECT Tipo.IDTipo FROM Tipo 
WHERE Tipo.IDTipo = Curso.IDTipo
AND Tipo.Nome = 'Programação');  

/* Exiba uma lista com os nomes dos instrutores da Softblue e ao lado o total acumulado
das vendas referente aos cursos pelo qual o instrutor é responsável; */
SELECT Instrutor.Nome, (SELECT SUM(PedidoDetalhe.Valor) FROM PedidoDetalhe
INNER JOIN Curso
ON PedidoDetalhe.IDCurso = Curso.IDCurso
Where Curso.IDInstrutor = Instrutor.IDInstrutor)
AS TotalDeVendas FROM Instrutor;

-- Crie uma visão que exiba os nomes dos alunos e quanto cada um já comprou em cursos; --
CREATE VIEW AlunosNomesCompras AS
SELECT Aluno.Nome, (SELECT SUM(PedidoDetalhe.Valor) FROM PedidoDetalhe
INNER JOIN Pedido
ON PedidoDetalhe.IDPedido = Pedido.IDPedido
WHERE Pedido.IDAluno = Aluno.IDAluno)
AS QuantAlunoCompra From Aluno;

SELECT * FROM AlunosNomesCompras
----------------------------------------------------------------------------------------------------------