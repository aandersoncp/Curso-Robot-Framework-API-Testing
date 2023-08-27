*** Settings ***
Resource    ../resources/base_teste.resource
Resource    ../resources/login.resource
Resource    ../resources/carrinhos.resource
Resource    ../variaveis/variaveis.resource

*** Test Cases ***
Cenário 01 - Consultar todos os carrinhos
    Consultar todos os carrinhos  