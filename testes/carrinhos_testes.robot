*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/login.resource
Resource    ../resources/carrinhos.resource
Resource    ../variaveis/variaveis.resource
Resource    ../resources/usuarios.resource
Resource    ../resources/produtos.resource

*** Test Cases ***
Cenário 01 - Consultar todos os carrinhos
    Consultar todos os carrinhos  

Cenário 02 - Cadastrar carrinho
    ${email}    Criar um novo email
    Cadastrar o usuario criado na ServeRest    ${email}    201
    ${token_auth}    Realizar login    ${email}    ${SENHA}    200
    ${id_prod}    Cadastrar produto    ${token_auth}
    Cadastrar carrinhos    ${id_prod}    ${token_auth}

Cenário 03 - Consultar carrinho por id
    ${email}    Criar um novo email
    Cadastrar o usuario criado na ServeRest    ${email}    201
    ${token_auth}    Realizar login    ${email}    ${SENHA}    200
    ${id_prod}    Cadastrar produto    ${token_auth}
    ${id_carrinho}    Cadastrar carrinhos    ${id_prod}    ${token_auth}
    Consultar carrinho por id    ${id_carrinho}

Cenário 04 - Concluir compra
    ${email}    Criar um novo email
    Cadastrar o usuario criado na ServeRest    ${email}    201
    ${token_auth}    Realizar login    ${email}    ${SENHA}    200
    ${id_prod}    Cadastrar produto    ${token_auth}
    ${id_carrinho}    Cadastrar carrinhos    ${id_prod}    ${token_auth}
    Concluir compra    ${token_auth}

Cenário 05 - Cancelar compra
    ${email}    Criar um novo email
    Cadastrar o usuario criado na ServeRest    ${email}    201
    ${token_auth}    Realizar login    ${email}    ${SENHA}    200
    ${id_prod}    Cadastrar produto    ${token_auth}
    ${id_carrinho}    Cadastrar carrinhos    ${id_prod}    ${token_auth}
    Cancelar compra    ${token_auth}