*** Settings ***
Documentation       Home Page - Login

Resource            ${EXECDIR}/resources/main.resource

Test Setup          Start Test
Test Teardown       Finish Test

*** Test Cases ***
Deve logar com sucesso
    Go to Login Page
    Submit Credentials      papito@gmail.com        vaibrasil
    User Logged In
    
Não deve logar com senha incorreta
    Go to Login Page
    Submit Credentials          papito@gmail.com        abc123
    Toast Message Should Be     Credenciais inválidas, tente novamente!

Deve exibir notificação toaster se a senha não for preenchida
    Go to Login Page
    Submit Credentials                  papito@gmail.com        ${EMPTY}
    Toast Message Should Be             Por favor, informe a sua senha secreta!

Deve exibir notificação toaster se o email não for preenchido
    Go to Login Page
    Submit Credentials                      ${EMPTY}        abc123
    Toast Message Should Be                 Por favor, informe o seu email!

Deve exibir notificação toaster se email e senha não forem preenchidos
    Go to Login Page
    Submit Credentials          ${EMPTY}        ${EMPTY}
    Toast Message Should Be     Por favor, informe suas credenciais!