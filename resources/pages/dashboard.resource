*** Settings ***
Documentation       Dashboard pages

Resource            ../main.resource

*** Keywords ***
User Logged In
    ${HEADER_TITLE}        Set Variable        Aquela figurinha incrível a um clique de distância.

    Get Text               css=.header-content strong        equal        ${HEADER_TITLE}

Search User
    [Arguments]        ${target}
    Fill Text          id=keyword                    ${target}
    Click              css=button >> text=Buscar

Select Sticker
    [Arguments]        ${name}
    Click              xpath=//img[@alt="${name}"]/..

Get In Touch
    Click            css=button >> text=Entrar em contato
   
Whatsapp Sticker Message
    [Arguments]                    ${sticker_name}

    ${expected_message}            Set Variable
    ...                            Oi, achei o seu contato no Trade Sticker. Estou interessado(a) na figurinha do ${sticker_name}, bora negociar?

    Switch Page                    NEW   
    Wait For Elements State        css=p >> text=${expected_message}
    ...                            visible
    ...                            5000
