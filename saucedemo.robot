*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing

*** Variables ***
${SERVER}         https://www.saucedemo.com/
${BROWSER}        Chrome
${DRIVER}         rf-env/WebDriverManager/chromedriver.exe  # Chrome Driver
# ${BROWSER}        Firefox
# ${DRIVER}         rf-env/WebDriverManager/geckodriver.exe  # Firefox Driver
${DELAY}          0

*** Test Cases ***
Test
    Prepare Browser
    Login   standard_user   secret_sauce
    Add Product     Jacket
    Open Shopping Cart
    Checkout
    Insert Infomation    Matti   Testaaja    33200
    Overview
    Finish

*** Keywords ***
Prepare Browser
    Open Browser    ${SERVER}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Login
    [Arguments]     ${username}     ${password}
    Wait Until Page Contains Element    id=user-name
    Input Text      id=user-name    ${username}
    Input Text      id=password     ${password}
    Click Element   id=login-button
    Wait Until Page Contains    Products

Add Product
    [Arguments]     ${product}
    Wait Until Page Contains Element    xpath=//div[@class='inventory_item' and contains(.,'${product}')]//button
    Click Element   xpath=//div[@class='inventory_item' and contains(.,'${product}')]//button

Open Shopping Cart
    Wait Until Page Contains Element    xpath=//div[@id='shopping_cart_container']//a
    Click Element   xpath=//div[@id='shopping_cart_container']//a

Checkout
    Wait Until Page Contains Element    xpath=//div[@id='cart_contents_container']//a[contains(.,'CHECKOUT')]
    Click Element   xpath=//div[@id='cart_contents_container']//a[contains(.,'CHECKOUT')]

Insert Infomation
    [Arguments]     ${firstname}     ${lastname}    ${postalcode}
    Wait Until Page Contains Element    xpath=//div[@id='checkout_info_container']//input
    Input Text      id=first-name     ${firstname}
    Input Text      id=last-name      ${lastname}
    Input Text      id=postal-code    ${postalcode}
    # Click Element   xpath=//div[@class='checkout_buttons']//input
    Submit Form

Overview
    Wait Until Page Contains Element    xpath=//div[@id='checkout_summary_container']//a[contains(.,'FINISH')]
    Click Element   xpath=//div[@id='checkout_summary_container']//a[contains(.,'FINISH')]

Finish
    Wait Until Page Contains    THANK YOU FOR YOUR ORDER