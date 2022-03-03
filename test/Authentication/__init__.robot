*** Settings ***
Documentation    Sample testsuite for authentication
...              use site https://www.demoblaze.com/index.html as demo page
Library          String
Force Tags       authen
Suite Setup      Generate test data

*** Keywords ***
Generate test data
    ${tempU} =             Generate Random String       length=8         chars=[LETTERS]
    ${tempP} =             Generate Random String       length=10        chars=[NUMBERS]
    Set Global Variable    ${username}                  ${tempU}
    Set Global Variable    ${password}                  ${tempP}
    Log To Console         User name is: ${username}    stream=STDOUT    no_newline=False
    Log To Console         Password is: ${password}     stream=STDOUT    no_newline=False