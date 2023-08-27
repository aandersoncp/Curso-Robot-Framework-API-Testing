*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/login.resource
Resource    ../resources/produtos.resource
Resource    ../variaveis/variaveis.resource

*** Test Cases ***
Cenário 01 - Consultar todos os produtos
    Consultar todos os produtos

Cenário 02 - Cadastrar novo produto
    ${token}    Realizar login    ${usuario_email_teste}    ${SENHA}    200
    Cadastrar produto    ${token}

Cenário 03 - Consultar produto por id
    ${token}    Realizar login    ${usuario_email_teste}    ${SENHA}    200
    Consultar produto por id    ${token}

Cenário 04 - Consultar produto por id
    ${token}    Realizar login    ${usuario_email_teste}    ${SENHA}    200
    Deletar produto por id    ${token}

Cenário 05 - Atualizar produto por id
    ${token}    Realizar login    ${usuario_email_teste}    ${SENHA}    200
    Atualizar produto por id    ${token}