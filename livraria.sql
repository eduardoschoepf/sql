/*
Implemente um Banco de Dados chamado “Livraria”. Após, implemente as tabelas, conforme o Modelo Relacional dado, observando as chaves primárias e as chaves estrangeiras. Todos os campos, de todas as tabelas, não podem ser nulos (not null).
*/
create database Livraria;
use Livraria;
select database();
create table Cliente (
	idCliente int primary key,
    nome varchar(50) not null,
    telefone varchar(20) not null,
    email varchar(50) not null,
    endereco varchar(100) not null
);

create table Pedido (
	idPedido int primary key,
    idCliente int,
    constraint fkIdCliente foreign key (idCliente)
    references Cliente(idCliente),
    dataPedido date not null,
    valorPedido decimal(5,2) not null
);

create table Editora (
	idEditora int primary key,
    nome varchar(50) not null,
    telefone varchar(20) not null,
    email varchar(50) not null,
    endereco varchar(100) not null
);

create table Livro (
	idLivro int primary key,
    idEditora int,
    constraint fkIdEditora foreign key (idEditora)
    references Editora(idEditora),
    titulo varchar(100) not null,
    autor varchar(50) not null,
    ano int not null,
    ISBN varchar(20) not null,
    preco decimal(5,2) not null
);

create table itemPedido (
	idPedido int,
    constraint fkIdPedido foreign key (idPedido)
    references Pedido(idPedido),
    idLivro int,
    constraint fkIdLivro foreign key (idLivro)
    references Livro(idLivro),
    quantidade int not null,
    valorItemPedido decimal(5,2) not null
);

create table Estoque (
    idLivro int,
    constraint fkIdLivroEstoque foreign key (idLivro)
    references Livro(idLivro),
    quantidade int not null
);

/*
Implemente uma consulta para listar o quantitativo de livros cadastrados, independentemente da editora.
*/
select count(*) from Livro;

/*
Implemente uma consulta para listar o nome dos clientes cadastrados. A listagem deve ser mostrada em ordem crescente
*/
select nome from Cliente order by nome asc;

/*
Implemente uma consulta para listar o nome de todas as editoras e os títulos de seus respectivos livros. A listagem deve ser mostrada em ordem decrescente pelo nome das editoras.
*/
select Editora.nome as 'Nome da Editora', Livro.titulo as 'Títulos  do Livro' from livro
inner join Editora on Livro.idEditora = Editora.idEditora
order by Editora.nome desc;

/*
Implemente uma consulta para listar o nome das editoras e a média de preço de seus respectivos livros. Para isso, utilize o comando group by.
*/
select Editora.nome, avg(Livro.preco) as 'Preço médio'
from Editora
inner join Livro on Editora.idEditora = Livro.idEditora
group by Editora.nome;

/*
Implemente uma consulta para listar o nome de todos os clientes e a quantidade de títulos de livros comprados pelos mesmos. Para isso, utilize o comando group by.
*/
select nome, count(idPedido) AS 'Quantidade de títulos comprados'
from Cliente
inner join Pedido on Cliente.idCliente = Pedido.idCliente
group by nome;