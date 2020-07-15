*** Settings ***
Documentation    Checking on all invalid credentials

Resource    ../Resources/Base/commonfunctionalities.robot 
Resource    ../Resources/Pages/LoginPage.robot 
Resource    ../Resources/Pages/DashboardPage.robot  

Library    DataDriver    file=../TestData/OpenEMRData_1.xlsx    sheet_name=Valid Credential Test

#Suite Setup
#Suite Teardown

Test Setup    Start Browser
Test Teardown    End Browser


*** Test Cases ***
#Check Loc
#    Log To Console    ${EXECDIR}${/}driver    

Invalid Credential Test
    LoginPage.Enter Username    admin123
    LoginPage.Enter Password    pass   
    LoginPage.Select Language    English (Indian) 
    LoginPage.Click Login

    LoginPage.Validate Error Message    Invalid username or password
