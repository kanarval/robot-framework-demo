*** Settings ***
Library    Selenium2Library

*** Variables ***
${HOST}           https://www.google.com/
${DEFAULT BROWSER}      chrome

*** Keywords ***
User Open Browser
    Open Browser    ${HOST}     ${DEFAULT BROWSER}

User Close Browser
    Close Browser