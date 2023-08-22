*** Settings ***
Resource    api_resource.robot

*** Test Cases ***
Cenário 01 - Cadastrar novo usuario
    Criar um novo usuario
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente

Cenário 02 - Realizar login com sucesso
    Criar um novo usuario
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Realizar login    email=${EMAIL_TESTE}    senha=1234  status_code_desejado=200


Cenário 03 - Cadastrar novo produto
    Cadastrar produto
