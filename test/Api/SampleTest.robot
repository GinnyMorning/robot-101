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
    [Tags]              smoke                GET
    ${params}=          Create Dictionary    page=2
    ${resp} =           GET                  ${HOST}/users    ${params}    expected_status=200
    Status should be    OK                   ${resp}

Check API not exist
    [Tags]                        smoke        GET
    ${resp}=                      GET          ${HOST}/status/23    expected_status=404
    Should Be Equal As Strings    Not Found    ${resp.reason}

Check user list
    [Tags]                 GET                  smoke
    ${params}=             Create Dictionary    page=2
    ${resp} =              GET                  ${HOST}/users    ${params}    expected_status=200
    Should Not Be Empty    ${resp.json()}

Check signgle user
    [Tags]                          smoke                   GET
    ${resp}=                        GET                     ${HOST}/users/2      expected_status=200
    Status Should Be                OK                      ${resp}
    Dictionaries Should Be Equal    ${resp.json()}[data]    ${single_User_id}    

Log in with registered user
    [Tags]                           smoke                    GET
    ${data}=                         Create Dictionary        email=eve.holt@reqres.in    password=cityslicka
    ${resp}=                         POST On Session          ${GLOBAL_SESSION}           /login                 json=${data}    expected_status=200    
    Status Should Be                 OK                       
    Dictionary Should Contain Key    ${resp.json()}           token                       
    Should Not Be Empty              ${resp.json()}[token]    

Create new user
    [Tags]                            smoke                        POST
    ${data} =                         Create Dictionary            name=toanpham         job=software engineer
    ${reps}=                          POST On Session              ${GLOBAL_SESSION}     /users                   json=${data}    expected_status=201
    Dictionary Should Contain Item    ${reps.json()}               name                  toanpham 
    Dictionary Should Contain Item    ${reps.json()}               job                   software engineer 
    Should Not Be Empty               ${reps.json()}[id]           
    Set Suite Variable                ${user_id}                   ${reps.json()}[id]
    Should Not Be Empty               ${reps.json()}[createdAt]    

Update user by put request
    [Tags]                            smoke                        PUT
    ${data} =                         Create Dictionary            name=toanplq         job=Tester
    ${reps}=                          PUT On Session               ${GLOBAL_SESSION}    /users/${user_id}    json=${data}    expected_status=200
    Dictionary Should Contain Item    ${reps.json()}               name                 toanplq 
    Dictionary Should Contain Item    ${reps.json()}               job                  Tester
    Should Not Be Empty               ${reps.json()}[updatedAt]

Update user by patch request
    [Tags]                            smoke                        PATCH
    ${data} =                         Create Dictionary            name=TPLQ            job=QC
    ${reps}=                          PATCH On Session             ${GLOBAL_SESSION}    /users/${user_id}    json=${data}    expected_status=200
    Dictionary Should Contain Item    ${reps.json()}               name                 TPLQ 
    Dictionary Should Contain Item    ${reps.json()}               job                  QC
    Should Not Be Empty               ${reps.json()}[updatedAt]

Delete user
    [Tags]      smoke                DELETE
    ${reps}=    DELETE On Session    ${GLOBAL_SESSION}    /users/${user_id}    expected_status=204


Check user is deleted successfull
    [Tags]                        smoke             GET
    ${resp}=                      GET On Session    ${GLOBAL_SESSION}    /users/${user_id}    expected_status=404
    Should Be Equal As Strings    Not Found         ${resp.reason}

***Keywords***
Test set up session
    Create Session    ${GLOBAL_SESSION}    ${HOST}    disable_warnings=1

Teardown Test Session
    Delete All Sessions