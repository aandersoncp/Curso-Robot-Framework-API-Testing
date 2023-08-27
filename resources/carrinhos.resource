*** Settings ***
Resource    base_teste.resource
Library    ResquestLibrary

*** Keywords ***
Consultar todos os carrinhos
    Criar Sessão na ServeRest

    ${resposta}    GET On Session    
    ...            alias=ServeRest
    ...            url=/carrinhos
    ...            expected_status=200

    Log    ${resposta.json()} 

Cadastrar carrinhos


Consultar carrinho por id


Concluir compra


Cancelar compra