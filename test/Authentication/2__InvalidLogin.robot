*** Settings ***
Documentation    using template to test invalid credential log in
Library          SeleniumLibrary
Resource         ../../resources/authen.resource
Test Setup       Test set up
Test Teardown    Test tear down
Test Template    Log in with invalid credential

*** Test Cases ***                       USER NAME    PASSWORD
Test with not exist user name            h287228      1
Test with not correct password           1            0
Test with blank username and password    ${EMPTY}     ${EMPTY}
Test with blank user name                ${EMPTY}     1
Test with blank password                 1            ${EMPTY}