*** Settings ***
Resource         ../../resources/authen.resource
Test Setup       Test set up
Test Teardown    Test tear down

*** Test Cases ***
Check log out function
    Set Selenium Speed                     0.5
    Click on log in link
    Input log in user name and password    ${username}      ${password}
    Click button Log In
    Wait Until Element Is Visible          ${nameOfUser}    timeout=5       error=None
    Click on log out link
    Element Should Not Be Visible          ${nameOfUser}    message=None
    Element Should Be Visible              ${loginLink}     message=None
    Element Should Be Visible              ${signupLink}    message=None
    Set Selenium Speed                     0