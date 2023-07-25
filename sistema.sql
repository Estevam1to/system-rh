-- ALUNO: LUÍS ESTEVAM ROSA CHAVES - MATRÍCULA: 536699

-- CRIACAO DAS TABELAS
CREATE TABLE Departamento (
    id_dpto SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL
);

CREATE TABLE Funcionario (
    id_func SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    estado_civil VARCHAR(20),
    id_dpto INTEGER,
    FOREIGN KEY (id_dpto) REFERENCES Departamento (id_dpto)
);

CREATE TABLE Endereco (
    rua VARCHAR(90) NOT NULL,
    numero INTEGER NOT NULL,
    cidade VARCHAR(90) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    complemento VARCHAR(150),
    id_func INTEGER,
    FOREIGN KEY (id_func) REFERENCES Funcionario (id_func)
);

CREATE TABLE Tarefas (
    id_tarefa SERIAL PRIMARY KEY,
    descricao VARCHAR(200),
    data DATE NOT NULL,
    status VARCHAR(40) NOT NULL,
    id_func INTEGER,
    FOREIGN KEY (id_func) REFERENCES Funcionario (id_func)
);

CREATE TABLE Beneficios (
    id_benef SERIAL PRIMARY KEY,
    tipo VARCHAR(40),
    nome VARCHAR(150) NOT NULL,
    valor_beneficio FLOAT,
    id_func INTEGER,
    FOREIGN KEY (id_func) REFERENCES Funcionario (id_func)
);

CREATE TABLE Remuneracao (
    id_func INTEGER,
    salario_bruto FLOAT NOT NULL,
    salario_liquido FLOAT,
    FOREIGN KEY (id_func) REFERENCES Funcionario (id_func)
);

-- INSERÇÕES
INSERT INTO Departamento (nome) VALUES
    ('Vendas'),
    ('Marketing'),
    ('Recursos Humanos'),
    ('Financeiro'),
    ('Produção'),
    ('Tecnologia'),
    ('Logística'),
    ('Qualidade'),
    ('Atendimento ao Cliente'),
    ('Administrativo');
	
INSERT INTO Funcionario (nome, data_nascimento, cpf, estado_civil, id_dpto) VALUES
    ('João Silva', '1990-01-01', '12345678901', 'Solteiro', 1),
    ('Maria Santos', '1985-02-02', '23456789012', 'Casada', 2),
    ('Pedro Souza', '1992-03-03', '34567890123', 'Solteiro', 3),
    ('Ana Costa', '1988-04-04', '45678901234', 'Casada', 4),
    ('Lucas Oliveira', '1995-05-05', '56789012345', 'Solteiro', 5),
    ('Camila Pereira', '1991-06-06', '67890123456', 'Solteira', 6),
    ('Márcio Santos', '1987-07-07', '78901234567', 'Casado', 7),
    ('Carolina Lima', '1994-08-08', '89012345678', 'Solteira', 8),
    ('Ricardo Fernandes', '1989-09-09', '90123456789', 'Solteiro', 9),
    ('Fernanda Rodrigues', '1993-10-10', '01234567890', 'Casada', 10);

INSERT INTO Endereco (rua, numero, cidade, uf, complemento, id_func) VALUES
    ('Rua A', 123, 'São Paulo', 'SP', 'Apartamento 1', 1),
    ('Rua B', 456, 'Rio de Janeiro', 'RJ', NULL, 2),
    ('Rua C', 789, 'Belo Horizonte', 'MG', 'Casa 3', 3),
    ('Rua D', 321, 'Porto Alegre', 'RS', NULL, 4),
    ('Rua E', 654, 'Curitiba', 'PR', 'Apartamento 5', 5),
    ('Rua F', 987, 'Salvador', 'BA', 'Casa 6', 6),
    ('Rua G', 135, 'Fortaleza', 'CE', 'Apartamento 7', 7),
    ('Rua H', 246, 'Recife', 'PE', NULL, 8),
    ('Rua I', 579, 'Brasília', 'DF', 'Casa 9', 9),
    ('Rua J', 864, 'Manaus', 'AM', 'Apartamento 10', 10);

INSERT INTO Tarefas (descricao, data, status, id_func) VALUES
    ('Realizar vendas', '2023-01-01', 'Concluída', 1),
    ('Criar campanha de marketing', '2023-02-01', 'Em andamento', 2),
    ('Recrutamento e seleção', '2023-03-01', 'Pendente', 3),
    ('Gerenciar finanças', '2023-04-01', 'Concluída', 4),
    ('Supervisionar produção', '2023-05-01', 'Em andamento', 5),
    ('Desenvolver software', '2023-06-01', 'Pendente', 6),
    ('Controlar estoque', '2023-07-01', 'Concluída', 7),
    ('Garantir qualidade do produto', '2023-08-01', 'Em andamento', 8),
    ('Atender clientes', '2023-09-01', 'Pendente', 9),
    ('Realizar tarefas administrativas', '2023-10-01', 'Concluída', 10);

INSERT INTO Beneficios (tipo, nome, valor_beneficio, id_func) VALUES
    ('Saúde', 'Plano de saúde', 500.00, 1),
    ('Alimentação', 'Vale-refeição', 300.00, 2),
    ('Saúde', 'Plano de saúde', 500.00, 3),
    ('Alimentação', 'Vale-refeição', 300.00, 4),
    ('Saúde', 'Plano de saúde', 500.00, 5),
    ('Alimentação', 'Vale-refeição', 300.00, 6),
    ('Saúde', 'Plano de saúde', 500.00, 7),
    ('Alimentação', 'Vale-refeição', 300.00, 8),
    ('Saúde', 'Plano de saúde', 500.00, 9),
    ('Alimentação', 'Vale-refeição', 300.00, 10);

INSERT INTO Remuneracao (id_func, salario_bruto, salario_liquido) VALUES
    (1, 5000.00, 4000.00),
    (2, 4500.00, 3600.00),
    (3, 4800.00, 3840.00),
    (4, 5200.00, 4160.00),
    (5, 5500.00, 4400.00),
    (6, 4200.00, 3360.00),
    (7, 4700.00, 3760.00),
    (8, 5100.00, 4080.00),
    (9, 4900.00, 3920.00),
    (10, 4800.00, 3840.00);

-- CONSULTA 1 - CONTAGEM DE FUNCIONÁRIOS POR DEPARTAMENTO:
SELECT d.nome, COUNT(f.id_func) AS total_funcionarios
FROM Departamento AS d
INNER JOIN Funcionario AS f ON d.id_dpto = f.id_dpto
GROUP BY d.nome;

-- CONSULTA 2 - CONTAGEM DE FUNCIONÁRIOS POR CIDADE:
SELECT e.cidade, COUNT(f.id_func) AS total_funcionarios
FROM Endereco AS e
LEFT JOIN Funcionario AS f ON e.id_func = f.id_func
GROUP BY e.cidade;

-- CONSULTA 3 - TAREFAS PENDENTES POR DEPARTAMENTO E FUNCIONÁRIO:
SELECT d.nome AS nome_departamento, f.nome AS nome_funcionario, t.descricao
FROM Departamento AS d
INNER JOIN Funcionario AS f ON d.id_dpto = f.id_dpto
INNER JOIN Tarefas AS t ON f.id_func = t.id_func
WHERE t.status = 'Pendente';

-- CONSULTA 4 - FUNCIONÁRIOS QUE CONCLUÍRAM TAREFAS:
SELECT f.nome
FROM Funcionario AS f
WHERE f.id_func IN (
    SELECT t.id_func
    FROM Tarefas AS t
    WHERE t.status = 'Concluída'
);

-- CONSULTA 5 - FUNCIONÁRIOS COM SALÁRIO BRUTO ACIMA DA MÉDIA DOS BENEFÍCIOS:
SELECT f.nome, r.salario_bruto
FROM Funcionario AS f
LEFT JOIN Remuneracao AS r ON f.id_func = r.id_func
GROUP BY f.nome, r.salario_bruto
HAVING r.salario_bruto > (
    SELECT AVG(b.valor_beneficio)
    FROM Beneficios AS b
);

-- Criar usuário administrativo
CREATE USER administrador WITH PASSWORD 'adm123';
GRANT ALL PRIVILEGES ON DATABASE postgres TO administrador;

-- Criar usuário somente leitura
CREATE USER leitura WITH PASSWORD 'leitor123';
GRANT CONNECT ON DATABASE postgres TO leitura;
GRANT USAGE ON SCHEMA public TO leitura;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO leitura;

-- Criando Visão
CREATE VIEW vw_funcionario_departamento_beneficios AS
SELECT f.id_func, f.nome AS funcionario_nome, d.nome AS departamento_nome, b.nome AS beneficio_nome, b.valor_beneficio
FROM Funcionario f
JOIN Departamento d ON f.id_dpto = d.id_dpto
JOIN Beneficios b ON f.id_func = b.id_func;

CREATE VIEW vw_funcionario_departamento_endereco AS
SELECT f.id_func, f.nome AS funcionario_nome, d.nome AS departamento_nome, e.rua, e.numero, e.cidade, e.uf
FROM Funcionario f
JOIN Departamento d ON f.id_dpto = d.id_dpto
JOIN Endereco e ON f.id_func = e.id_func;

CREATE VIEW vw_funcionario_endereco_remuneracao AS
SELECT f.cpf, f.nome, e.rua, e.numero, e.cidade, e.uf, r.salario_bruto, r.salario_liquido
FROM Funcionario f
LEFT JOIN Endereco e ON f.id_func = e.id_func
LEFT JOIN Remuneracao r ON f.id_func = r.id_func;


-- DETRUIÇÃO DAS TABLES
-- DROP TABLE Remuneracao;
-- DROP TABLE Beneficios;
-- DROP TABLE Tarefas;
-- DROP TABLE Endereco;
-- DROP TABLE Funcionario;
-- DROP TABLE Departamento;




