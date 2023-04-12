/*Cliente (CLIENTE_ID, Nome, Cidade, Telefone)
Vendedor (VENDEDOR_ID, Nome, Comissao)
Grupo (GRUPO_ID, Descricao)
Produto (PRODUTO_ID, GRUPO_ID, Descricao, Preco, Estoque)
Venda (VENDA_ID, Data, CLIENTE_ID, VENDEDOR_ID, Desconto)
ItemVenda (VENDA_ID, PRODUTO_ID, Quantidade, ValorUnitario, ValorTotal)*/

-- QUESTÃO 1 - Criar as tabelas
CREATE TABLE Cliente(
  cliente_id varchar(5) not null,
  nome varchar(30), 
  cidade varchar(30), 
  telefone int,
  PRIMARY KEY (cliente_id)
);
CREATE TABLE Vendedor(
  vendedor_id varchar(5) not null,
  nome varchar(30), 
  comissao float(2),
  PRIMARY KEY (vendedor_id)
);
CREATE TABLE Grupo (
  grupo_id varchar(5) not null, 
  descricao varchar(30),
  primary key(grupo_id)
);
CREATE TABLE Produto (
  produto_id varchar(5) not null, 
  grupo_id varchar(5), 
  Descricao varchar(15), 
  Preco float(2), 
  Estoque int,
  primary key(produto_id),
  FOREIGN key (grupo_id) REFERENCES Grupo(grupo_id)
);
CREATE TABLE Venda (
  venda_id varchar(6) not null, data date,
  cliente_id varchar(5), 
  vendedor_id varchar(5), 
  Desconto float(2),
  primary key (venda_id),
  FOREIGN key (cliente_id) REFERENCES Cliente(cliente_id),
  FOREIGN key (vendedor_id) REFERENCES Vendedor(vendedor_id)
);
CREATE TABLE ItemVenda (
  venda_id varchar(6) not null, 
  produto_id varchar(5) not null, 
  Quantidade int, 
  Valor_Unitario float(2), 
  Valor_Total float(2),
  FOREIGN key (venda_id) REFERENCES Venda(venda_id),
  FOREIGN key (produto_id) REFERENCES Produto(produto_id),
  primary key(venda_id, produto_id)
);

-- QUESTÃO 2 - Inserir

insert into Cliente values('C-001', 'Janderson', 'Cajazeiras', 22222222);
insert into Cliente values('C-002', 'Beatriz', 'Sousa', 11111111);
insert into Cliente values('C-003', 'Luan', 'Sousa', 33333333);
insert into Cliente values('C-004', 'João', 'João Pessoa', 66666666);

insert into Vendedor values('V-001', 'Káren', 1000.00);
insert into Vendedor values('V-002', 'Kely', 900.00);
insert into Vendedor values('V-003', 'Sara', 1300.00);
insert into Vendedor values('V-004', 'Vitor', 1000.00);

insert into Grupo values('G-001', 'Frutas');
insert into Grupo values('G-002', 'Verduras');

insert into Produto values('P-001','G-001','Maca', 4.00, 28);
insert into Produto values('P-002', 'G-001', 'Goiaba', 10.00, 90);
insert into Produto values('P-003', 'G-002', 'Repolho', 15.00, 33);
insert into Produto values('P-004', 'G-002', 'Alface', 6.00, 30);

insert into Venda values('VD-001', '2015-04-03', 'C-002', 'V-003', 1.00); 
insert into Venda values('VD-002', '2015-04-03', 'C-001','V-002',2.00);
insert into Venda values('VD-003', '2015-04-05', 'C-002','V-001',2.00);
insert into Venda values('VD-004', '2015-04-05', 'C-003', 'V-002', 3.00);

insert into Itemvenda values('VD-001', 'P-001', 3, 4.00, 12.00);
insert into Itemvenda values('VD-001', 'P-002', 2, 10.00, 20.00);
insert into Itemvenda values('VD-001', 'P-003', 4, 15.00, 60.00);
insert into Itemvenda values('VD-002', 'P-004', 4, 6.00, 24.00);
insert into Itemvenda values('VD-003', 'P-002', 4, 6.00, 24.00);
insert into Itemvenda values('VD-003', 'P-003', 5, 15.00, 75.00);
insert into Itemvenda values('VD-003', 'P-004', 3, 15.00, 45.00);
insert into Itemvenda values('VD-004', 'P-003', 2, 15.00, 30.00);
insert into Itemvenda values('VD-004', 'P-004', 1, 6.00, 6.00);

-- QUESTÃO 3 - Aumentar o preço em 20%
update produto set preco=preco*1.2;

-- QUESTÃO 4 -restrição  x<1
ALTER TABLE ItemVenda ADD CONSTRAINT Quantidade CHECK
(Quantidade>=1);



-- QUESTÃO 5 - Substitua por 'Patos' quem mora em Sousa

update cliente set cidade='Patos' where cidade='Sousa';

-- QUESTÃO 6 - Criar dois atributos em cliente - CPF e RG

ALTER TABLE Cliente ADD Cpf varchar(14);
ALTER TABLE Cliente ADD Rg VARCHAR(12);

-- QUESTÃO 7 - Apagar os novos atributos criados - Rg e Cpf

ALTER TABLE Cliente DROP Cpf;
ALTER TABLE Cliente DROP Rg;

-- QUESTÃO 8 - Excluir tuplas com o codigo = 'VD-004'
DELETE FROM ItemVenda WHERE venda_id='VD-004';

-- Questão 9 - deletar as tuplas

delete from ItemVenda;

-- Questão 10 - apagar as tebelas ItemVenda e Venda

drop table ItemVenda;
DROP TABLE Venda;






