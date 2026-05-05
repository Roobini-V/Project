*** Settings ***
Resource    ../POM/keywords/registration_keywords.robot
Resource    ../resources/global_keywords.robot
Resource    ../resources/global_variables.robot
Resource    ../POM/keywords/login_keywords.robot
Library    SeleniumLibrary
#Suite Setup    Url_navigation
Test Teardown    exit_browser



*** Test Cases ***
Login User With Valid Credentials
    #[Setup]    Url_navigation    ${SAUCE_URL}
    ${credentials}=    Load Json From File    ./resources/data/login.json
    Login User With Credentials    ${credentials[0]["loginiduser"]}    ${credentials[0]["loginidpass"]}
    


#
#
#Login User With inValid Credentials
#    [Documentation]    Verifies that users with invalid credentials not able to log in
#    [Template]    Login User With Credentials
#    @{inValid_user_login}=    Get Value From Json    ${data}    $.invalid_user
#    FOR    ${i}    IN    ${inValid_user_login}
#        ${login_username}=     Get Value From Json    ${inValid_user_login}    $.username
#        ${login_password}=     Get Value From Json    ${inValid_user_login}    $.password
#        ${login_username}   ${login_password}
#    END
#
#
#Submit Registration Form With Data
#    [Documentation]    Navigates to the registration page, fills user details and submit the form
#    [Template]    Submit Registration Form
#    Roobini    roobini123@gmail.com    Female    1234567890    10-12-2000    Maths    C:/Users/Prem/Downloads/image.pdf    chennai    Uttar Pradesh    Lucknow
#    Senthil    senthil123@gmail.com    Male    9876543210    11-12-1998    Science    C:/Users/Prem/Downloads/image.pdf    Salem    Uttar Pradesh    Lucknow



*** Keywords ***
Login User With Credentials
    [Arguments]    ${loginiduser}    ${loginidpass}
    Given Url_navigation    ${SAUCE_URL}
    When User Logging In    ${loginiduser}    ${loginidpass}
    Then User Should See Cart


Submit Registration Form
    [Arguments]    ${person_name}    ${person_email}    ${person_gender}    ${person_mobile}    ${person_dob}    ${person_subject}    ${person_file}    ${person_address}    ${person_state}    ${person_city}
    Given Url_navigation    ${REG_URL}
    When Fill Registration Form With Data    ${person_name}    ${person_email}    ${person_gender}    ${person_mobile}    ${person_dob}    ${person_subject}    ${person_file}    ${person_address}    ${person_state}    ${person_city}
    Then Submit Registration Form With Data
    


#login user
#    [Setup]    Url_navigation    ${SAUCE_URL}
#    Wait Until Element Is Visible    ${username}    ${MIN_WAIT}
#    Wait Until Element Is Enabled    ${username}
#    ${credential_obj}=    Load Json From File    ./resources/data/login.json
#    ${user_json}=    Get Value From Json     ${credential_obj}    $.username
#    clear_input_textbox    ${username}    ${user_json}[0]
#    Wait Until Element Is Visible    ${password}    ${MAX_WAIT}
#    Wait Until Element Is Enabled    ${password}
#    ${new_password_}=    Get Value From Json     ${credential_obj}    $.password
#    clear_input_textbox    ${password}    ${new_password_}[0]
#    Wait Until Element Is Visible    ${submit_click}
#    Submit_login    ${submit_click}
#    User_loging_in
#    Wait Until Element Is Visible    ${cart_visible}    ${MID_WAIT}

#Submit Registration form
#    [Setup]    Open Browser    ${REG_URL}    chrome
#    ${reg_cred_obj}=    Load Json From File    ./resources/data/registration.json
#    ${name_json}=    Get Value From Json    ${reg_cred_obj}    $.user_name
#    clear_input_textbox    ${name}    ${name_json}[0]
#    ${email_json}=    Get Value From Json    ${reg_cred_obj}    $.user_email
#    clear_input_textbox    ${email}    ${email_json}[0]
#    select_button    ${gender}
#    ${mobile_json}=    Get Value From Json    ${reg_cred_obj}    $.user_mobile_num
#    clear_input_textbox    ${mobile}    ${mobile_json}[0]
#    ${dob_json}=    Get Value From Json    ${reg_cred_obj}    $.user_date_of_birth
#    clear_input_textbox    ${birth}    ${dob_json}[0]
#    ${sub_json}=    Get Value From Json    ${reg_cred_obj}    $.user_subject
#    clear_input_textbox    ${subject}    ${sub_json}[0]
#    select_button    ${hobbies}
#    ${file_json}=    Get Value From Json    ${reg_cred_obj}    $.user_file
#    Choose File    ${file}    ${file_json}[0]
#    ${address_json}=    Get Value From Json    ${reg_cred_obj}    $.user_address
#    clear_input_textbox    ${address}    ${address_json}[0]
#    ${state_json}=    Get Value From Json    ${reg_cred_obj}    $.user_state
#    select_list    ${state}    ${state_json}[0]
#    ${city_json}=    Get Value From Json    ${reg_cred_obj}    $.user_city
#    select_list    ${city}     ${city_json}[0]
#    submit_form    ${submit}


    

    

    