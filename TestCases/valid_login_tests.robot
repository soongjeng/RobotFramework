*** Settings ***
Documentation    Validating the user credentials
...    for open EMR application

Resource    ../Resources/Base/commonfunctionalities.robot  
Resource    ../Resources/Pages/LoginPage.robot 
Resource    ../Resources/Pages/DashboardPage.robot 
#Suite Setup
#Suite Teardown

Test Setup    Start Browser
Test Teardown    End Browser
Test Template    Valid Credential Template

*** Test Cases ***                username      password     language            expectedtitle
#Check Loc
#    Log To Console    ${EXECDIR}${/}driver    

Valid Admin Credential Test        admin        pass         English (Indian)    OpenEMR
Valid Physician Credential Test    physician    physician    English (Indian)    OpenEMR   


*** Keywords ***
Valid Credential Template
    [Arguments]    ${username}    ${password}    ${language}    ${expectedtitle}
    #Click Element    xpath=//button[text()='No Thanks']
    LoginPage.Enter Username    ${username}
    LoginPage.Enter Password    ${password}   
    LoginPage.Select Language    ${language} 
    LoginPage.Click Login   
    DashboardPage.PageTitle should be OpenEMR    ${expectedtitle}
    DashboardPage.Mouse Over on Name
    DashboardPage.Click Logout



