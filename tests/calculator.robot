*** Settings ***
Resource         ${CURDIR}${/}..${/}resources${/}keywords.robot
Suite Teardown   Close All Applications

*** Test Cases ***

Check That 98+4 Equals 102
    [Documentation]     Check that 98+4 equals 102
    [Tags]              OnePlus    Samsung

    AppState            Calculator
    ClickText           9
    ClickText           8
    ClickItem           add        # here we use part of resource-id to click "+" -button
    ClickText           4
    ClickItem           eq         # here we use part of resource-id to click "=" -button
    VerifyText          102

Check That 1+1x100 Equals 101 usign index
    [Documentation]     Check that 1+1x100 equals 101
    [Tags]              OnePlus    Samsung

    AppState            Calculator
    ClickText           1
    ClickItem           add
    ClickText           1           index=2        # we want to click second "1"
    ClickItem           mul         anchor=eq      # we need to use anchor here as some devices have other resource-id that contains text "mul"
    ClickText           1           index=2
    ClickText           0
    ClickText           0           index=2
    ClickItem           eq
    VerifyText          101

Check That 1+1x100 Equals 101 usign anchor
    [Documentation]     Check that 1+1x100 equals 101
    [Tags]              OnePlus    Samsung

    AppState            Calculator
    ClickText           1
    ClickItem           add
    ClickText           1           anchor=eq      # here we want to click "1" -button which is close "=" -button (resourve-id contains eq)
    ClickItem           mul         anchor=eq
    ClickText           1           anchor=eq
    ClickText           0
    ClickText           0           anchor=eq
    ClickItem           eq
    VerifyText          101

Check That 1+1x100 Equals 101 using resource-id
    [Documentation]     Check that 1+1x100 equals 101 using keywords "ClickItem" and defining button using part of Samsung's resource-id
    [Tags]              Samsung

    AppState            Calculator
    ClickItem           01
    ClickItem           +
    ClickItem           01
    ClickItem           mul         anchor=\=
    ClickItem           01
    ClickItem           00
    ClickItem           00
    ClickItem           \=
    VerifyText          101
         
Check That 1+1x100 Equals 101 using resource-id with One+
    [Documentation]     Check that 1+1x100 equals 101 using keywords "ClickItem" and defining button using part of OnePlus's resource-id
    [Tags]              OnePlus

    AppState            Calculator
    ClickItem           digit_1
    ClickItem           op_add
    ClickItem           digit_1
    ClickItem           op_mul
    ClickItem           digit_1
    ClickItem           digit_0
    ClickItem           digit_0
    ClickItem           eq
    VerifyText          101