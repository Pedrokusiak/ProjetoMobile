//comando para criar tabela
const criarTrabalho = '''
 CREATE TABLE trabalho(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,endereco VARCHAR(200) NOT NULL
  )
''';
//array de inserções
const insercoesTrabalho = [
  '''
INSERT INTO trabalho (nome, endereco)
VALUES ('Mecanica Simas','aaaaaaaaaaaaa')
''',
  '''
INSERT INTO trabalho (nome, endereco)
VALUES ('Escritorio','15412')
''',
  '''
INSERT INTO trabalho (nome, endereco)
VALUES ('Escola','asdasdas')
'''
];
