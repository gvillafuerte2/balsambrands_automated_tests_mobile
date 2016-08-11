*** Settings ***
Library           AppiumLibrary    # run_on_failure=Log Source

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    iOS
${PLATFORM_VERSION}    9.3
${DEVICE_NAME}    iPhone 5
${BROWSER_NAME}    Safari
${MAX_WAIT_TIME_ELEMENT_VISIBLE}    20

*** Keywords ***
Set Appium Server
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    browserName=${BROWSER_NAME}    autoAcceptAlerts=true

Load Test Configuration
    [Arguments]    ${test_env}
    [Documentation]    Loads any environment specific configuration
    ...    values required for testing, e.g. host name,
    ...    server user/password, etc.
    Set Appium Server
    Run Keyword If    '${test_env}'=='QA'    Import Resource    ${CURDIR}/../../resources/qa.robot

Get Test Env Base URL
    [Arguments]    ${store}=US
    [Documentation]    Returns base URL to test env.
    ...    Notes:
    ...    + Default URL domai is US, unless different store is
    ...    provided as argument.
    ...    + The returned URL does NOT contain any page or path.
    ${host_domain_name}=    Set Variable    ${TEST_ENV_US_HOST}
    ${host_domain_name}=    Set Variable If    '${store}'=='UK'    ${TEST_ENV_UK_HOST}    ${host_domain_name}
    ${base_url}=    Set Variable If    '${TEST_ENV_PORT}'!='${EMPTY}'    ${TEST_ENV_PROTOCOL}://${host_domain_name}:${TEST_ENV_PORT}    ${TEST_ENV_PROTOCOL}://${host_domain_name}
    [Return]    ${base_url}

Get Current Test Env Base URL
    ${url}=    Get Location
    ${protocol}=    Fetch From Left    ${url}    ://
    ${host}=    Fetch From Right    ${url}    ://
    ${host}=    Fetch From left    ${host}    \/
    [Return]    ${protocol}://${host}

Close All Apps
    Close All Applications
