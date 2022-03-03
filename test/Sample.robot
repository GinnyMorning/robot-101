***Settings***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${URL}        http://google.com
${BROWSER}    Chrome


*** Test Cases ***
Test lauch google
    Open Browser     ${URL}    ${BROWSER}
    Close Browser    

Check request lib
    ${respone} =    GET    https://www.google.com

Get respone with parameter
    ${respone} =    GET    https://www.google.com/search    params=query=ciao    expected_status=200

Get respone with JSON Body
    ${respone} =                  GET    https://jsonplaceholder.typicode.com/posts/1
    Should be Equal As Strings    1      ${respone.json()}[id]