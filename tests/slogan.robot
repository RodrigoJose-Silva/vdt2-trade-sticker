*** Settings ***
Documentation       Home Page - Slogan

Resource            ../resources/main.resource

*** Variables ***
${SLOGAN}        Conectando colecionadores de figurinhas da copa.

*** Test Cases ***
Deve validar o slogan da home page
    New Browser         headless=False
    New Page            https://trade-sticker-dev.vercel.app/
    Get Text            css=.logo-container h2        contains        ${SLOGAN}
    Take Screenshot
    