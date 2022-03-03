***Settings***
Documentation    Check functional of home page
Resource         ../../resources/Common.resource
Test Setup       Test set up
Test Teardown    Test tear down


*** Test Cases ***
Check navigation when click nav icon
    Click on link to Cart
    Click on icon
    Location Should Contain    index.html    

Check contact modal
    Click on contact us link
    Element Should Be Visible    ${contactUsModal}

Check about us modal
    Click on about us link
    Element Should Be Visible    ${aboutUsModal}

Check link to cart
    Click on link to Cart
    Location Should Contain    cart.html

Check item filter phone
    Click on category phone
    Element Should Contain     ${itemList}    Samsung galaxy s6

Check item filter laptop
    Click on category laptop
    Element Should Contain      ${itemList}    Sony vaio i5    

Check item filter monitor
    Click on category monitor
    Element Should Contain       ${itemList}    Apple monitor 24    