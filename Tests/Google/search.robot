*** Settings ***
Library    Selenium2Library
Library     ${EXECDIR}/library/CSVLibrary.py
Resource    ${EXECDIR}/Resources/common.resource

*** Variables ***
${data}             ${EXECDIR}/data/keywords.csv
${GOOGLE INPUT}     //input[@class='gLFyf']
${RESULT STATS}     id=result-stats

*** Test Cases ***
User Open Browser
    User Open Browser

User Search
    Wait Until Page Contains Element    ${GOOGLE INPUT}
    ${keywords}=    Read CSV File    ${data}
    FOR  ${keyword}  IN  @{keywords}
        User Search Keyword  ${keyword}[0]
    END

User Close Browser
    User Close Browser

*** Keywords ***
User Search Keyword
    [Arguments]     ${keyword}
    Input Text      ${GOOGLE INPUT}         ${keyword}
    Press Keys      ${GOOGLE INPUT}         RETURN
    Wait Until Element IS Visible   ${RESULT STATS}