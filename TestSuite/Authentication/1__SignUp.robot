*** Settings ***
Library          String
Resource         ../../resources/authen.resource    
Resource         ../../resources/Common.resource
Test Setup       Test set up
Test Teardown    Test tear down

*** Test Cases ***
Check sign up
    Click on Sign up link
    Input Sign Up user name and password    ${username}            ${password}
    Click button Sign up
    ${message} =                            Handle Alert
    Should be Equal As Strings              Sign up successful.    ${message} 

Test close pop up behaviour
    Click on Sign up link
    Wait Until Element Is Enabled    ${signinModal}    timeout=5    
    Scroll Element Into View         ${closeBtn}
    Click Button                     ${closeBtn}
    Element Should Not Be Visible    ${signinModal}

Test log in with registered user
    Click on log in link
    Input log in user name and password    ${username}      ${password}
    Click button Log In
    Wait Until Element Is Visible          ${nameOfUser}    timeout=5      error=None
    Check name of user after log in        ${username}
    Element Should Contain                 ${logOut}        Log out        message=None    ignore_case=False

