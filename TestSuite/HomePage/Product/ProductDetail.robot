***Settings***
Documentation    Check product detail
Resource         ../../../resources/Common.resource
Test Setup       Test set up
Test Teardown    Test tear down

***Test Cases ***
Check behaviour when click on product link
    Set Selenium Speed           2
    Click Element                //*[@id="tbodyid"]/div[1]/div/a
    Location Should Contain      prod.html?idp_=1 
    Set Selenium Speed           0
    Element Should Contain       //*[@id="tbodyid"]/h2                 Samsung galaxy s6                                                           
    Element Should Contain       //*[@id="tbodyid"]/h3                 $360 
    Element Should Contain       //*[@id="more-information"]/strong    Product description
    Element Should Contain       //*[@id="more-information"]/p         The Samsung Galaxy S6 is powered by 1.5GHz octa-core Samsung Exynos 7420    processor and it comes with 3GB of RAM. The phone packs 32GB of internal storage cannot be expanded.
    Element Should Be Enabled    //*[@id="tbodyid"]/div[2]/div/a
    page Should Contain Image    //*[@id="imgp"]/div/img 