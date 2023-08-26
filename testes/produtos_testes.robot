*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/login.resource
Resource    ../resources/produtos.resource
Resource    ../variaveis/variaveis.resource

*** Test Cases ***
Cenário 01 - Consultar todos os produtos
    Consultar todos os produtos

Cenário 02 - Cadastrar novo produto
    Realizar login    ${usuario_email_teste}    ${usuario_senha_teste}    200
    Cadastrar produto

Cenário 03 - Consultar produto por id
    Realizar login    ${usuario_email_teste}    ${usuario_senha_teste}    200
    Consultar produto por id

Cenário 04 - Consultar produto por id
    Realizar login    ${usuario_email_teste}    ${usuario_senha_teste}    200
    Deletar produto por id

Cenário 05 - Atualizar produto por id
    Realizar login    ${usuario_email_teste}    ${usuario_senha_teste}    200
    Atualizar produto por id