*** Settings ***
Documentation        Home Page - Login

Resource        ${EXECDIR}/resources/main.resource

Test Setup            Start Test
Test Teardown         Finish Test

*** Test Cases ***
Deve logar com sucesso
    Go to Login Page
    Submit Credentials        papito@gmail.com        vaibrasil
    User Logged In
    
Não deve logar com senha incorreta
    Go to Login Page
    Submit Credentials             papito@gmail.com        abc123
    Toast Message Should Be        Credenciais inválidas, tente novamente!