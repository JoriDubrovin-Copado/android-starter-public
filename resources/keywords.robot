*** Settings ***
Library   QMobile   configs=${CURDIR}${/}${/}config${/}config.yaml

*** Variables ***
${First_Run}   ${True}

*** Keywords ***

AppState
    [Arguments]       ${state}

    Run Keyword IF    '${state}'=='Calculator'    GoToCalculator
    ...    ELSE       Fail        Unknown App State::${state}

GoToCalculator
    Run Keyword IF    ${First_Run}==${True}         Open Mobile App
    ...    ELSE       Launch Application

Open Mobile App
    OpenApp
    Set Suite Variable  ${First_Run}   ${False}

Launch Application
    [Documentation]   Launch app on non-Browserstack provider

    ${appPackage}=    GetConfig      capabilities.appPackage
    ActivateApp       app_id=${appPackage}
