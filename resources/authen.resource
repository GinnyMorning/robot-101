*** Settings ***
Documentation    Sample resource file for authentication flow
Resource         Common.resource
Library          SeleniumLibrary
Variables        general_var.yaml                                
Variables        PO/login_PO.yaml                                
Variables        PO/Common_PO.yaml
*** Keywords ***
Input log in user name and password
    [Arguments]                      ${userName}         ${password}
    Wait Until Element Is Visible    ${loginUserName}    timeout=10     error=None
    Input Text                       ${loginUserName}    ${userName}
    Input Password                   ${loginPW}          ${password}

Input Sign Up user name and password
    [Arguments]                      ${username}          ${password}
    Wait Until Element Is Visible    ${signupUserName}    timeout=10     error=None
    Input Text                       ${signupUserName}    ${userName}
    Input Password                   ${signupPW}          ${password}

Click button Sign up
    Click Button    ${signupBtn}

Click button Log In
    Click Button    ${loginBtn}

Click button Close
    ${close}              Get WebElement      ${closeBtn}
    Log To Console        ${close}            stream=STDOUT    no_newline=False
    Execute Javascript    ${close}.click()

Check message after log in with invalid credential
    [Arguments]           ${message} 
    Should Contain Any    ${message}     @{expMessage} 

Log in with invalid credential
    [Arguments]                                           ${userName}     ${password}
    Click on log in link
    Input log in user name and password                   ${userName}     ${password}
    Click button Log In
    ${message} =                                          Handle Alert
    Check message after log in with invalid credential    ${message}

Check name of user after log in
    [Arguments]               ${userName}
    Element Should Contain    ${nameOfUser}    ${userName}
