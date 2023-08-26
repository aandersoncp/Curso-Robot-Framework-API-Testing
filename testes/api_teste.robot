*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/carrinhos.resource
Resource    ../resources/login.resource
Resource    ../resources/produtos.resource
Resource    ../resources/usuarios.resource
Resource    ../variaveis/variaveis.resource

*** Test Cases ***
Cenário 01 - Cadastrar novo usuario
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente

Cenário 02 - Realizar login com sucesso
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Realizar login    email=${EMAIL_TESTE}    senha=1234  status_code_desejado=200


Cenário 03 - Cadastrar novo produto
    Cadastrar produto

Cenário 04 - Consultar todos os usuários
    Consultar todos os usuário

Cenário 05 - Consultar usuário por id
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente
    Consultar usuário por id

Cenário 06 - Deletar usuário por id
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente
    Deletar usuário por id

Cenário 07 - Atualizar usuário por id
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente
    Atualizar usuário por id