*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/login.resource
Resource    ../resources/usuarios.resource
Resource    ../resources/produtos.resource
Resource    ../variaveis/variaveis.resource

*** Test Cases ***
Cenário 01 - Realizar login com sucesso
    ${email_usuario}    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${email_usuario}    status_code_desejado=201
    Realizar login    email=${email_usuario}    senha=123456  status_code_desejado=200