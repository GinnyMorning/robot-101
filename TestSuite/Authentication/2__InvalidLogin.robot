*** Settings ***
Documentation    using template to test invalid credential log in
Library          SeleniumLibrary
Resource         ../../resources/authen.resource
Test Setup       Test set up
Test Teardown    Test tear down
Test Template    Log in with invalid credential

*** Test Cases ***                       USER NAME                        PASSWORD
Test with not exist user name            h287228                          1
Test with not correct password           1                                0
Test with blank username and password    ${EMPTY}                         ${EMPTY}
Test with blank user name                ${EMPTY}                         1
Test with blank password                 1                                ${EMPTY}
Test with long username                  12638716273617238123871238128    1
Test with long password                  1                                1287361278378126381293912
Test with special char in username       1*&^                             1
Test with special char in password       1                                !@#$%^&*
Test with email format username          t@gmail.com                      1
Test with sql injection                  105 OR {1}={1}                   1
Test sql injection 2                     \" or \"\"\=\"                   \" or \\"\=\"
Test sql inkection 3                     105; DROP TABLE Suppliers        1                            