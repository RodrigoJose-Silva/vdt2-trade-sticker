*** Settings ***
Documentation       Login Page

Resource            ../main.resource

*** Keywords ***
Go to Login Page
    New Page        https://trade-sticker-dev.vercel.app/

Submit Credentials
    [Arguments]        ${email}        ${password}
    Fill Text          css=input[name="email"]           ${email}
    Fill Text          css=input[name="password"]        ${password}
    Click              xpath=//button[text()="Entrar"] 
    
Toast Message Should Be
    [Arguments]                    ${message_expected}
    ${locator}                     Set Variable            css=.Toastify__toast-body div >> text=${message_expected}
    Wait For Elements State        ${locator}              visible        3