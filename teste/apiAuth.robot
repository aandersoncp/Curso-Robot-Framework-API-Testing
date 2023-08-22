# *** Settings ***
# Library    RequestsLibrary
# Library    String

# *** Variables ***
# ${URL}   http://www.barrigarest.wcaquino.me
# ${EMAIL}  nome_teste1297@tese.com
# ${SENHA}  123456

# *** Keywords ***
# Criar seção
#     ${headers}  Create Dictionary  Content-Type=application/json
#     Create Session    alias=SeuBarriga    url=https://www.barrigarest.wcaquino.me   headers=${headers}
# Fazer login

#     ${body}  Create Dictionary
#     ...      email=${EMAIL}
#     ...      senha=123456
#     Log   ${body}
    
#     ${Resultado_login}     POST On Session    
#     ...                    alias=SeuBarriga    
#     ...                    url=/signin    
#     ...                    json=${body}    
#     ...                    expected_status=${200}

#     Log  ${Resultado_login}    

# #Fazer ação

# *** Test Cases ***
# Cenario 01
#     Criar seção
#     Fazer login
# #    Fazer ação