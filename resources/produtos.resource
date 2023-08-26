*** Settings ***
Resource    base_teste.resource
Library    ResquestLibrary

*** Keywords ***

Cadastrar produto
    ${auth}     Create Dictionary
    ...     Authorization=${TOKEN}
    Log  ${auth}

    ${body}     Create Dictionary
    ...     nome=produto teste1
    ...     preco=${100}
    ...     descricao=descricao teste
    ...     quantidade=${10}
    Log  ${body}

    Criar Sessão na ServeRest

    ${resposta}     POST On Session
    ...          alias=ServeRest
    ...          url=/produtos
    ...          json=${body}
    ...          expected_status=201
    ...          headers=${auth}
    Log  ${resposta.json()}