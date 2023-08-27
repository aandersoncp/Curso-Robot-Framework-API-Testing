*** Settings ***
Resource    base_teste.resource
Library    ResquestLibrary

*** Keywords ***

Realizar login
    [Arguments]     ${email}   ${senha}    ${status_code_desejado}
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

    Log    ${resposta.json()["authorization"]}

    IF    ${resposta.status_code} == 200
        Log     ${resposta.json()["message"]}
    END

    [Return]    ${resposta.json()["authorization"]}