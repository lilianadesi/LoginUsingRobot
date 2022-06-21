*** Settings ***
Library                 SeleniumLibrary
Test Setup             Open Browser         ${base_url}    ${browser_type}
Test Teardown          Close Browser

*** Variables ***
${base_url}             https://pub-eish-dev.keponet.com/frontend/login
${browser_type}         Chrome       
${email_user}           jenareishsatu@yopmail.com
${password_user}        12345678
${invalid_email}        liliana@ymail.com
${invalid_password}     11111111

*** Test Cases ***
I login with valid Email adn valid Password
    Maximize Browser Window 
    Input Text                         //input[@id="email"]            ${email_user}
    Input Text                         //input[@id="password"]         ${password_user}
    Click Element                      //button[@type="submit"]
    Element Should Be Visible          //img[@id="menu-logo"]  
    sleep       2s

I login with invalid Email but valid Password
    Maximize Browser Window
    Input Text                         //input[@id="email"]            ${invalid_email}
    Input Text                         //input[@id="password"]         ${password_user}
    Click Element                      //button[@type="submit"]
    Element Should not Be Visible      //img[@id="menu-logo"]
    sleep       4s

I login with valid Email but invalid Password
    Maximize Browser Window
    input Text                         //input[@id="email"]            ${email_user}
    Input Text                         //input[@id="password"]         ${invalid_password}
    Click Element                      //button[@type="submit"]
    Element Should Be Visible          //div[@class="alert alert-danger text-danger"]
    sleep       2s

I login with invalid Email but invalid Password
    Maximize Browser Window
    input Text                          //input[@id="email"]            ${invalid_email}
    Input Text                          //input[@id="password"]         ${invalid_password}
    Click Element                       //button[@type="submit"]
    Element Should not Be Visible       //img[@id="menu-logo"]
    sleep       2s

I login without email and password
    Maximize Browser Window
    Click Element                        //button[@type="submit"]    
    Element Should not Be Visible        //img[@id="menu-logo"]   
    sleep       2s