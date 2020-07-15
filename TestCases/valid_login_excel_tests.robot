*** Settings ***
Documentation    Validating the user credentials
...    for open EMR application

Resource    ../Resources/Base/commonfunctionalities.robot  
Resource    ../Resources/Pages/LoginPage.robot 
Resource    ../Resources/Pages/DashboardPage.robot 

Library    DataDriver    file=../TestData/OpenEMRData.xlsx    sheet_name=Valid Credential Test

#Suite Setup
#Suite Teardown

Test Setup    Start Browser
Test Teardown    End Browser
Test Template    Valid Credential Template

*** Test Cases ***                 
#Check Loc
#    Log To Console    ${EXECDIR}${/}driver    

Valid Credential Test using ${username} and ${password}      



*** Keywords ***
Valid Credential Template
    [Arguments]    ${username}    ${password}    ${language}    ${title}
    #Click Element    xpath=//button[text()='No Thanks']
    LoginPage.Enter Username    ${username}
    LoginPage.Enter Password    ${password}   
    LoginPage.Select Language    ${language} 
    LoginPage.Click Login   
    DashboardPage.PageTitle should be OpenEMR    ${title}
    DashboardPage.Mouse Over on Name
    DashboardPage.Click Logout



