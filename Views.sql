
-- Criando a VIEW sobre funcionários 
CREATE  OR REPLACE VIEW `dados_funcionarios` AS
SELECT 
	funcionarios.funcionario_id AS funcionario_id, 
    funcionarios.primeiro_nome AS primeiro_nome, 
    funcionarios.sobrenome AS sobrenome, 
    funcionarios.telefone AS telefone, 
    funcionarios.data_contratacao AS data_contratacao, 
    funcionarios.salario AS salario, 
    ocupacoes.ocupacao_nome AS cargo, 
    ocupacoes.min_salario AS min_salario, 
    ocupacoes.max_salario AS max_salario, 
    departamentos.departamento_nome AS departamento, 
    escritorios.escritorio_nome AS escritorio_nome, 
    escritorios.endereco AS escritorio_endereco, 
    paises.pais_nome AS pais, 
    regioes.regiao_nome  AS regiao

 FROM funcionarios

INNER JOIN ocupacoes 
	ON funcionarios.ocupacao_id = ocupacoes.ocupacao_id
INNER JOIN departamentos 
	ON funcionarios.departamento_id = departamentos.departamento_id
INNER JOIN escritorios 
	ON departamentos.escritorio_id = escritorios.escritorio_id
INNER JOIN paises 
	ON escritorios.pais_id = paises.pais_id
INNER JOIN regioes 
	ON paises.regiao_id = regioes.regiao_id;



-- Criando a VIEW sobre dependentes 
CREATE  OR REPLACE VIEW `dados_dependentes` AS
SELECT 
	dependentes.dependente_id AS dependente_id, 
    dependentes.primeiro_nome AS primeiro_nome,
	dependentes.sobrenome AS sobrenome,
	dependentes.parentesco AS parentesco,
	funcionarios.funcionario_id AS funcionario_id, 
	funcionarios.primeiro_nome AS funcionario_primeiro_nome, 
    funcionarios.sobrenome AS funcionario_sobrenome

 FROM dependentes

INNER JOIN funcionarios 
	ON dependentes.funcionario_id = funcionarios.funcionario_id;

-- Selecionando dados da VIEW
SELECT * From dados_funcionarios;
