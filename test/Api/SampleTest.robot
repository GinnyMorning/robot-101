*** Settings ***
Documentation    Sample test suite to demo api testing
Library          RequestsLibrary
Library          Collections
Test Setup       Test set up session
Test Teardown    Teardown Test Session


***Variables***
${GLOBAL_SESSION}     global_session
${HOST} =             https://reqres.in/api
&{single_User_id}=    id=${2}                                           #set value to be interger, if not test will be fail due to 2 (int) != 2 (string)
...                   email=janet.weaver@reqres.in
...                   first_name=Janet
...                   last_name=Weaver
...                   avatar=https://reqres.in/img/faces/2-image.jpg

***Test Cases ***
Check API server is working
    [Tags]              smoke                get
    ${params}=          Create Dictionary    page=2
    ${resp} =           GET                  ${HOST}/users    ${params}    expected_status=200
    Status should be    OK                   ${resp}

Check API not exist
    [Tags]                        smoke        get
    ${resp}=                      GET          ${HOST}/status/23    expected_status=404
    Should Be Equal As Strings    Not Found    ${resp.reason}

Check user list
    [Tags]                 get
    ${params}=             Create Dictionary    page=2
    ${resp} =              GET                  ${HOST}/users    ${params}    expected_status=200
    Should Not Be Empty    ${resp.json()}

Check signgle user
    [Tags]                          smoke                   get
    ${resp}=                        GET                     ${HOST}/users/2      expected_status=200
    Status Should Be                OK                      ${resp}
    Dictionaries Should Be Equal    ${resp.json()}[data]    ${single_User_id}    

Log in with registered user
    [Tags]              smoke                get
    ${data}=            Create Dictionary    email=eve.holt@reqres.in    password=cityslicka
    ${resp}=            POST On Session      ${GLOBAL_SESSION}           /login                 json=${data}    expected_status=200    
    Status Should Be    OK                   
    Log To Console      ${resp.json()}       


***Keywords***
Test set up session
    Create Session    ${GLOBAL_SESSION}    ${HOST}    disable_warnings=1

Teardown Test Session
    Delete All Sessions