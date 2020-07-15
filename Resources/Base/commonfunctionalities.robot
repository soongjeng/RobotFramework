*** Settings ***
Documentation    This file helps in managing the browser session for all the test cases

Library    SeleniumLibrary    screenshot_root_directory=screenshots/ 
Library    OperatingSystem    


*** Variables ***

${URL}    https://demo.openemr.io/a/openemr/index.php
${BROWSER}    chrome


*** Keywords ***

Start Browser
    Append To Environment Variable    PATH    ${EXECDIR}${/}driver  
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    30s
    
End Browser
    Close All Browsers
