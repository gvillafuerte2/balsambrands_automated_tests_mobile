*** Settings ***
Suite Setup       Load Test Configuration    ${TEST_ENV}
Suite Teardown    Close All Apps
Resource          ../step_definitions/utilities/common.robot
Resource          ../step_definitions/utilities/config.robot
Resource          ../step_definitions/page_sections/header.robot

*** Test Cases ***
Verify Header Elements On All Stores
    [Tags]    smoke
    [Template]    Verify Header Has Expected Elements On ${store} Homepage
    US
    UK
