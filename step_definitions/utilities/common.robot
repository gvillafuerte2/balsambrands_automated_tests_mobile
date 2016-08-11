*** Settings ***
Resource          config.robot
Library           Process

*** Keywords ***
Set Browser For Testing
    [Arguments]    ${store}=US
    [Documentation]    Opens browser using current test
    ...    environment settings.
    ${base_url}=    Get Test Env Base URL    ${store}
    ${browser_instance}=    Go To Url    ${base_url}

Navigate to Homepage
    [Arguments]    ${store}=US
    Set Browser For Testing    ${store}
