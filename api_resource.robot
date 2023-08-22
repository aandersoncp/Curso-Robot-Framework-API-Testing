*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar um novo usuario
    ${palavra_aleatoria}  Generate Random String  length=3  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    Set Suite Variable    ${EMAIL_TESTE}  teste${palavra_aleatoria}@emailteste.com
    Log  ${EMAIL_TESTE}

Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev   headers=${headers}

Cadastrar o usuario criado na ServeRest
    [Arguments]  ${email}  ${status_code_desejado}
    ${body}  Create Dictionary
    ...      nome=Fulano da Silva
    ...      email=${email}
    ...      password=1234
    ...      administrador=true
    Log   ${body}

    Criar Sessão na ServeRest

    ${resposta}  POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
    ...          expected_status=${status_code_desejado}

    Log  ${resposta.json()}

    IF  ${resposta.status_code} == 201
        Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END

    Set Suite Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se o usuario foi cadastrado corretamente
    Log  ${RESPOSTA}
    Dictionary Should Contain Item  ${RESPOSTA}  message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}  _id

Realizar login
    [Arguments]     ${email}   ${senha}     ${status_code_desejado}
    ${body}     Create Dictionary
    ...     email=${email}
    ...     password=${senha}
    Log  ${body}

    Criar Sessão na ServeRest

    ${resposta}     POST On Session
    ...          alias=ServeRest
    ...          url=/login
    ...          json=${body}
    ...          expected_status=${status_code_desejado}
    Log  ${resposta.json()}

    Set Suite Variable  ${TOKEN}  ${resposta.json()["authorization"]}
    Log    ${TOKEN}

    IF    ${resposta.status_code} == 200
        Log     ${resposta.json()["message"]}
    END

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