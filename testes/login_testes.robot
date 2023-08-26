*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/login.resource
Resource    ../resources/usuarios.resource
Resource    ../resources/produtos.resource
Resource    ../variaveis/variaveis.resource

*** Test Cases ***
Cenário 01 - Realizar login com sucesso
    Criar um novo email
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Realizar login    email=${EMAIL_TESTE}    senha=1234  status_code_desejado=200