*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar um novo email
    [Documentation]    Criação de um novo usuário
    ${palavra_aleatoria}  Generate Random String  length=3  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    ${EMAIL_TESTE}    Set Variable    teste${palavra_aleatoria}@emailteste.com
    Log     ${EMAIL_TESTE}

    [Return]    ${EMAIL_TESTE}
    
Criar Sessão na ServeRest
    [Documentation]    Criação de uma sessão
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev   headers=${headers}

    ${palavra_aleatoria}  Generate Random String  length=3  chars=[LETTERS]
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    Set Suite Variable    ${EMAIL_TESTE}  teste${palavra_aleatoria}@emailteste.com






