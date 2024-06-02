-- Inclua suas próprias informações no departamento de tecnologia da empresa

-- A administração está sem funcionários. Inclua alguns colegas de turma nesse departamento. 
select * from funcionarios;


insert into funcionarios(funcionario_id, primeiro_nome, sobrenome, email, telefone, data_contratacao, ocupacao_id, salario, gerente_id, departamento_id)
values
(207, 'gustavo', 'petta','gustavo@gmail.com', '11123456789','2024-06-01',2,16000.00,101, 1);

-- Agora diga, quantos funcionários temos ao total na empresa? 41 funcionarios
select count(*)
from funcionarios;

-- Quantos funcionários temos no departamento de finanças? 6 funcionarios
select count(*) 
from funcionarios 
where departamento_id = 10;
-- Qual a média salarial do departamento de tecnologia?
select avg(salario)
from funcionarios 
where departamento_id = 6;

-- Quanto o departamento de Transportes gasta em salários? 41.200,00
SELECT SUM(salario)
FROM funcionarios
WHERE departamento_id = 5;

-- Um novo departamento foi criado. O departamento de inovações. 
-- Ele será locado no Brasil. Por favor, adicione-o no banco de dados.

update escritorios 
set escritorio_nome = 'Avengers'
where escritorio_id = 5400;

insert into departamentos (departamento_id, departamento_nome, escritorio_id)
values
(12, 'Inovações', 5400);

-- Três novos funcionários foram contratados para o departamento de inovações. 
-- Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, 
-- possuem uma filha chamada Maria Antônia que tem 1 anos e adora brincar com cachorros. 
-- Ele será programador.

insert into funcionarios( primeiro_nome, sobrenome, email, telefone, data_contratacao, ocupacao_id, salario, gerente_id, departamento_id)
values
('William', 'Ferreira', 'william.ferreira@gmail.com', 123456789,'2024-06-01', 9, 7000.00, 103, 6);

insert into dependentes(primeiro_nome, sobrenome, parentesco, funcionario_id)
values
('Maria', 'Antonia','filha',209),
('Inara', 'Ferreira','filha',209);

-- Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. 
-- Ela vai ocupar a posição de desenvolvedora.

insert into funcionarios( primeiro_nome, sobrenome, email, telefone, data_contratacao, ocupacao_id, salario, gerente_id, departamento_id)
values
('Fernanda', 'Lima', 'fernanda.lima@gmail.com', 123456789,'2024-06-01', 9, 9000.00, 103, 6);

insert into dependentes(primeiro_nome, sobrenome, parentesco, funcionario_id)
values
('Rodrigo', 'Lima','conjugue',209);
  
-- Por último, a Gerente do departamento será Sumaia Azevedo. 
-- Casada, duas filhas (Tainã e Nathalia).

insert into funcionarios( primeiro_nome, sobrenome, email, telefone, data_contratacao, ocupacao_id, salario, gerente_id, departamento_id)
values
('Sumaia', 'Azevedo', 'sumaia.azevedo@gmail.com', 123456789,'2024-06-01', 7, 11000.00, 103,7);

insert into dependentes(primeiro_nome, sobrenome, parentesco, funcionario_id)
values
('Tainã','Azevedo','filho',210),
('Nathalia', 'Azevedo', 'filha',210);

-- O salário de todos eles será a média salarial dos departamentos de administração e finanças.
select avg(salario) from funcionarios
where departamento_id in (1,10);
 



-- Informe todas as regiões em que a empresa atua acompanhadas de seus países.
SELECT r.regiao_nome, p.pais_nome
FROM regioes r
JOIN paises p ON r.regiao_id = p.regiao_id;

-- Joe Sciarra é filho de quem?
SELECT f.*
FROM funcionarios f
JOIN dependentes d ON f.funcionario_id = d.funcionario_id
WHERE d.primeiro_nome = 'Joe'
  AND d.sobrenome = 'Sciarra';


-- Jose Manuel possui filhos?
SELECT COUNT(*) AS numero_de_filhos
FROM dependentes d
JOIN funcionarios f ON d.funcionario_id = f.funcionario_id
WHERE f.primeiro_nome = 'Jose Manuel';




SELECT regiao_id, COUNT(*) AS num_paises
FROM paises
GROUP BY regiao_id
ORDER BY num_paises DESC
LIMIT 1;

-- Exiba o nome cada funcionário acompanhado de seus dependentes.
SELECT f.primeiro_nome AS nome_funcionario, d.primeiro_nome AS nome_dependente
FROM funcionarios f
JOIN dependentes d ON f.funcionario_id = d.funcionario_id;

-- Karen Partners possui um(a) cônjuge?
SELECT d.parentesco
FROM dependentes d
JOIN funcionarios f ON d.funcionario_id = f.funcionario_id
WHERE f.primeiro_nome = 'Karen' AND f.sobrenome = 'Partners';
