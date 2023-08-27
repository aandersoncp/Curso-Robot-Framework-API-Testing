*** Settings ***
Resource    base_teste.resource
Resource    ../variaveis/variaveis.resource
Library    ResquestLibrary
Library    OperatingSystem

*** Keywords ***
Consultar todos os carrinhos
    Criar Sessão na ServeRest

    ${resposta}    GET On Session    
    ...            alias=ServeRest
    ...            url=/carrinhos
    ...            expected_status=200

    Log    ${resposta.json()} 

Cadastrar carrinhos
    [Arguments]    ${idProduto}    ${token_auth}
    ${produto}    Create Dictionary
    ...           idProduto=${idProduto}
    ...           quantidade=${QUANTIDADE}
    
    @{produtos}    Create List    ${produto}

    ${body}    Create Dictionary    produtos=${produtos}

    Log    ${body}

    ${auth}     Create Dictionary
    ...     Authorization=${token_auth}
    Log  ${auth}

    ${resposta}    POST On Session
    ...            alias=ServeRest
    ...            url=/carrinhos
    ...            json=${body}
    ...            headers=${auth}
    ...            expected_status=201
    
    Log    ${resposta.json()}

    [Return]    ${resposta.json()["_id"]}

Consultar carrinho por id
    [Arguments]    ${id_carrinho}
    
    ${resposta}    GET On Session
    ...            alias=ServeRest
    ...            url=/carrinhos/${id_carrinho}
    ...            expected_status=200
    
    Log    ${resposta.json()}

Concluir compra
    [Arguments]    ${token_auth}
    ${auth}     Create Dictionary
    ...     Authorization=${token_auth}
    Log  ${auth}

    ${resposta}    DELETE On Session
    ...            alias=ServeRest
    ...            url=/carrinhos/concluir-compra
    ...            headers=${auth}
    ...            expected_status=200
    
    Log    ${resposta.json()}

Cancelar compra
    [Arguments]    ${token_auth}
    ${auth}     Create Dictionary
    ...     Authorization=${token_auth}
    Log  ${auth}

    ${resposta}    DELETE On Session
    ...            alias=ServeRest
    ...            url=/carrinhos/cancelar-compra
    ...            headers=${auth}
    ...            expected_status=200
    
    Log    ${resposta.json()}