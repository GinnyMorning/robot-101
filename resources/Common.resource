***Settings***
Library      SeleniumLibrary
Variables    general_var.yaml
Variables    PO/Common_PO.yaml

***Variables***
${BROWSER}    %{BROWSER}
${DELAY}      %{DEPLAY_TIME}

***Keywords***
Test set up
    Open Browser               ${HOST}     ${BROWSER}
    Maximize Browser Window
    Title Should Be            STORE
    Set Selenium Speed         ${DELAY}    #reduce selenium speed to make sure element is present and active

Test tear down
    Set Selenium Speed    0
    Close All Browsers

Click on log in link
    Click Element    ${loginLink}

Click on Sign up link
    Click Element    ${signupLink}

Click on icon
    Click Element    ${navicon}    modifier=False

Click on log out link
    Click Element    ${logOut}

Click on contact us link
    Click Element    ${contactUsLink}    modifier=False

Click on about us link
    Click Element    ${aboutUsLink}    modifier=False

Click on Category
    Click Element    ${category}    modifier=False

Click on category phone
    Click Element    ${catPhones}    modifier=False

Click on category laptop
    Click Element    ${catLaptops}    modifier=False

Click on category monitor
    Click Element    ${catMonitors}    modifier=False

Click on link to Cart
    Click Element    ${cartLink}    modifier=False