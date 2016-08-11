*** Settings ***
Resource          ../utilities/common.robot

*** Variables ***
${HAMBURGUER}     //a[@class='header-btn-l header-btn-ham']
#${MERCHANDISING_MESSAGE}    id=specialtext
${MINICART}       //a[@class='header-btn-r header-btn-cart minicart']
#${MINICART_PRICE}    //a[@class='minicart']//span[@class='price']
#${MY_ACCOUNT_LINK}    //a[text()='My Account']
#${HELP_LINK}     //a[text()='Help']
#${US_PHONE_TEXT}    //a[text()='1.888.552.2572']
#${IRELAND_PHONE_TEXT}    //a[text()='IRELAND : 021 482 4310']
#${UK_PHONE_TEXT}    //a[text()='UK : 02033 686 726']
#${BALSAM_LOGO}    //img[@title='Balsam Hill']
#${SEARCH_INPUT_FIELD}    //form[@name='search_form_headerSearch']/input
#${SEARCH_BUTTON}    //form[@name='search_form_headerSearch']/button

*** Keywords ***
Verify Header Has Expected Elements On ${store} Homepage
    Navigate To Homepage    ${store}
    Wait Until Page Contains Element    ${HAMBURGUER}    ${MAX WAIT TIME ELEMENT VISIBLE}
    Wait Until Page Contains Element    ${MINICART}    ${MAX WAIT TIME ELEMENT VISIBLE}
