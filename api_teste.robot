*** Settings ***
Resource    api_resource.robot

*** Variables ***

*** Test Cases ***
Cenário 01 - Cadastrar novo usuario
    Criar um novo usuario
    Cadastrar o usuario criado na ServeRest     email=${EMAIL_TESTE}    status_code_desejado=201
    Conferir se o usuario foi cadastrado corretamente

