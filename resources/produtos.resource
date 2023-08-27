*** Settings ***
Resource    base_teste.resource
Library    ResquestLibrary

*** Keywords ***
Criar um novo produto
    [Documentation]    Criação de um novo produto
    [Arguments]    ${argumento}
    ${palavra_aleatoria}  Generate Random String  length=3  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    ${PALAVRA}    Set Variable   ${argumento} ${palavra_aleatoria}
    Log    ${PALAVRA}
    RETURN    ${PALAVRA}

Consultar todos os produtos
    Criar Sessão na ServeRest

    ${resposta}    GET On Session    
    ...            alias=ServeRest
    ...            url=/produtos
    ...            expected_status=200

    Log    ${resposta.json()}    

Cadastrar produto
    [Arguments]    ${TOKEN}
    ${auth}     Create Dictionary
    ...     Authorization=${TOKEN}
    Log  ${auth}

    ${nome_produto}    Criar um novo produto    nome
    ${descricao_produto}    Criar um novo produto    descricao
    
    ${body}     Create Dictionary
    ...     nome=${nome_produto}
    ...     preco=${100}
    ...     descricao=${descricao_produto}
    ...     quantidade=${10}
    Log  ${body}

    ${resposta}     POST On Session
    ...          alias=ServeRest
    ...          url=/produtos
    ...          json=${body}
    ...          expected_status=201
    ...          headers=${auth}
    Log  ${resposta.json()}

    [Return]    ${resposta.json()["_id"]}

Consultar produto por id
    [Arguments]    ${TOKEN}
    ${ID_PRODUTO}    Cadastrar produto    ${TOKEN}

    ${resposta}     GET On Session
    ...             alias=ServeRest
    ...             url=/produtos/${ID_PRODUTO}
    ...             expected_status=200
    Log  ${resposta.json()}

Deletar produto por id
    [Arguments]    ${TOKEN}
    ${ID_PRODUTO}    Cadastrar produto    ${TOKEN}

    ${auth}     Create Dictionary
    ...     Authorization=${TOKEN}
    Log  ${auth}

    ${resposta}     DELETE On Session
    ...             alias=ServeRest
    ...             url=/produtos/${ID_PRODUTO}
    ...             expected_status=200
    ...             headers=${auth}
    Log  ${resposta.json()}

Atualizar produto por id
    [Arguments]    ${TOKEN}
    ${ID_PRODUTO}    Cadastrar produto    ${TOKEN}

    ${auth}     Create Dictionary
    ...     Authorization=${TOKEN}
    Log  ${auth}
    
    ${nome_produto}    Criar um novo produto    novo nome
    ${descricao_produto}    Criar um novo produto    nova descricao
    
    ${body}     Create Dictionary
    ...     nome=${nome_produto}
    ...     preco=${100}
    ...     descricao=${descricao_produto}
    ...     quantidade=${10}
    Log  ${body}

    ${resposta}     PUT On Session
    ...             alias=ServeRest
    ...             url=/produtos/${ID_PRODUTO}
    ...             json=${body}
    ...             expected_status=200
    ...             headers=${auth}
    Log  ${resposta.json()}
