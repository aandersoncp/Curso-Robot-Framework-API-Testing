*** Settings ***
Resource    base_teste.resource
Resource    ../variaveis/variaveis.resource
Library     ResquestLibrary

*** Keywords ***
Cadastrar o usuario criado na ServeRest
    [Arguments]  ${email}  ${status_code_desejado}
    ${body}  Create Dictionary
    ...      nome=Anderson Costa
    ...      email=${email}
    ...      password=${SENHA}
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
        Set Suite Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END

    Set Suite Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se o usuario foi cadastrado corretamente
    Log  ${RESPOSTA}
    Dictionary Should Contain Item  ${RESPOSTA}  message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}  _id

Consultar todos os usuário
    Criar Sessão na ServeRest

    ${resposta}    Get On Session
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            expected_status=200
    
    Log    ${resposta.json()}

Consultar usuário por id
    Criar Sessão na ServeRest

    ${resposta}    Get On Session
    ...            alias=ServeRest
    ...            url=/usuarios/{ID_USUARIO}
    ...            expected_status=200 

    Log    ${resposta.json()}

Deletar usuário por id

    ${resposta}    DELETE On Session
    ...            alias=ServeRest
    ...            url=/usuarios/${ID_USUARIO}
    ...            expected_status=200 

    Log    ${resposta.json()}


Atualizar usuário por id
    Criar um novo email

    ${body}    Create Dictionary    
    ...        nome=Novo Teste 
    ...        email=${EMAIL_TESTE}
    ...        password=novaSenha
    ...        administrador=true
    
    ${resposta}   PUT On Session
    ...           alias=ServeRest
    ...           url=/usuarios/${ID_USUARIO} 
    ...           json=${body}
    ...           expected_status=200 
        
    Log    ${resposta}
