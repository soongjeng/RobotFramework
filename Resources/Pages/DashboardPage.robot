*** Settings ***
Documentation    Page object for handling login page functionalities
Resource    ../Base/commonfunctionalities.robot  

*** Variables ***
${NAME LOCATOR}    //span[@data-bind='text:fname']
${LOGOUT LOCATOR}    //li[text()='Logout'] 



*** Keywords ***

PageTitle should be OpenEMR
    Set Browser Implicit Wait    30s
    [Arguments]    ${title}
    Title Should Be    ${title}
    
Mouse Over on Name
    Set Browser Implicit Wait    30s
    Mouse Over    ${NAME LOCATOR}
    
Click Logout
    Set Browser Implicit Wait    30s
    Click Element    ${LOGOUT LOCATOR} 