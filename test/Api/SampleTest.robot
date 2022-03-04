*** Settings ***
Documentation    Sample test suite to demo api testing
Library          RequestsLibrary


***Variables***
${HOST} =    https://reqres.in/api


***Test Cases ***
Check API server is working
    [Tags]              smoke                get
    ${params}=          Create Dictionary    page=2
    ${resp} =           GET                  ${HOST}/users    ${params}    expected_status=200
    Status should be    OK                   ${resp}

Check API not exist
    [Tags]                        smoke        get
    ${resp}=                      GET          ${HOST}/status/404    expected_status=ANY
    Should Be Equal As Strings    Not Found    ${resp.reason}

Check user list
    [Tags]                 get
    ${params}=             Create Dictionary       page=2
    ${resp} =              GET                     ${HOST}/users    ${params}           expected_status=200
    Should Not Be Empty    ${resp.json()}
    Log To Console         ${resp.json()}[data]    stream=STDOUT    no_newline=False