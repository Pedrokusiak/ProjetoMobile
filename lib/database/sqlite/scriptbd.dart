//comando para criar tabela
const criarTabelas = [
  '''
CREATE TABLE trabalho(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,endereco VARCHAR(200) NOT NULL
  )
''',
  '''
CREATE TABLE solicitacao(
    id INTEGER NOT NULL PRIMARY KEY
    ,motivo VARCHAR(200) NOT NULL
    ,descricao VARCHAR(200) NOT NULL
    ,data_ocorrencia VARCHAR(200) NOT NULL
  )
''',
  '''
CREATE TABLE estado(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,sigla CHAR(2) NOT NULL
  )
''',
  '''
CREATE TABLE cidade(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,estado_id INTEGER NOT NULL
    ,FOREIGN KEY (estado_id) REFERENCES estado (id) 
  )
'''
];
//array de inserções
const insercoes = [
  '''
INSERT INTO trabalho (nome, endereco,cidade_id)
VALUES ('Mecanica','aaaaaaaaaaaaa',1)
''',
  '''
INSERT INTO trabalho (nome, endereco,cidade_id)
VALUES ('Escritorio','aaaaaaabbb',2)
''',
  '''
INSERT INTO trabalho (nome, endereco,cidade_id)
VALUES ('Escola','asdasdas',1)
''',
  '''
INSERT INTO solicitacao (motivo, descricao, data_ocorrencia)
VALUES ('Atestatdo','atestado apos ir ao medico', '01/06/2023')
''',
  '''
INSERT INTO solicitacao (motivo, descricao, data_ocorrencia)
VALUES ('Outros','carro quebro', '11/05/2023')
''',
  '''
INSERT INTO solicitacao (motivo, descricao, data_ocorrencia)
VALUES ('Tsuname','F', '01/07/2023')
''',
  '''
INSERT INTO estado (nome, sigla)
VALUES ('PARANÁ','PR')
''',
  '''
INSERT INTO estado (nome, sigla)
VALUES ('SÃO PAULO','SP')
''',
  '''
INSERT INTO cidade (id,nome, estado_id)
VALUES (1,'PARANAVAÍ',1)
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('MARINGÁ',1)
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('BAURU',2)
'''
];
