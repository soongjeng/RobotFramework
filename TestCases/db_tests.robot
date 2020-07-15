*** Settings ***

Library    DatabaseLibrary    
Library    Collections    

Suite Setup    Connect To Database    pymysql    dbName=dbfree_db    dbUsername=dbfree_db    dbPassword=12345678    dbHost=db4free.net    dbPort=3306
Suite Teardown    Disconnect From Database   

#host 85.10.205.173

*** Variables ***
${USERNAME}    balaji

#declaring global variable list, use @, call use $
@{NAMES}    peter    john    paul

#declaring global variable dictionary, use &, call use $
&{CREDENTIALS}    username=balaji    password=123456

${test}    {'username': 'balaji', 'password': '123456'}


*** Test Cases ***

Print Variable Test
    Log To Console    ${USERNAME}    
    Log To Console    ${NAMES}[0]    
    
    FOR    ${name}    IN    @{NAMES}
        Log To Console    ${name}    
    END
    
    Log To Console    ${CREDENTIALS}[username]   
    
    ${dic}    Convert To Dictionary    ${test}
    Log To Console    ${dic}     


Check Database
    Check If Exists In Database    SELECT * FROM country WHERE code='AFG'   
    Check If Not Exists In Database    SELECT * FROM country WHERE code='AFG123' 
    
Check update and Row count
    Execute Sql String    update country set code = 'afl' where code = 'AFG'    
    Check If Not Exists In Database    SELECT * FROM country WHERE code='AFG'      

Row count
    Row Count Is 0    SELECT * FROM country where 1=2    
    Row Count Is Equal To X    SELECT * FROM country    239  
    Row Count Is Greater Than X    SELECT * FROM country    200    
    Row Count Is Less Than X    SELECT * FROM country    500
    
Get Queries
    ${rowcount}    Row Count    SELECT * FROM country
    Log to Console    ${rowcount}     
    
    ${result}    QUery    SELECT code,name from country where code ='ZZZ'
    Log To Console    ${result}    
    Log To Console    ${result}[0][1]       
    
  







