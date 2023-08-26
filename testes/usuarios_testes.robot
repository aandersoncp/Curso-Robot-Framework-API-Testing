*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/login.resource
Resource    ../resources/usuarios.resource

*** Test Cases ***
Cenário 01 - Cadastrar novo usuario
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente

Cenário 02 - Consultar todos os usuários
    Consultar todos os usuário

Cenário 03 - Consultar usuário por id
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente
    Consultar usuário por id

Cenário 04 - Deletar usuário por id
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente
    Deletar usuário por id

Cenário 05 - Atualizar usuário por id
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente
    Atualizar usuário por id