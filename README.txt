Android Accelerator/starter suite
=================================

The test cases in this test suite use the Calculator application that comes
preinstalled with many Android devices. To run the tests on your local device,
some preparations are needed.


Prepare and connect your mobile device
--------------------------------------

In order to run test cases on your local mobile device, you need to enable
developer mode and allow USB debugging.


Enable developer mode
---------------------

The "de-facto" way of enabling developer mode on Android mobile devices is:

1. Go to "Settings" app
2. Scroll down until you see Build number
3. Tap Build number seven times

You should see a message flashing on the screen for few seconds if developer
mode was correctly activated. In addition, you should see additional menu
Developer options under Settings app (either directly under Settings or under
Settings > System).

NOTE: There may be differences between different vendors and/or device models on
how to enable developer mode. If the above instructions do not work for you,
please refer to your device's user manual.


Allow USB debugging
-------------------

To allow USB debugging, go to your Developer options menu (Settings or
Settings > System). Turn on the switch "USB debugging".


Check application's Package (appPackage) and Activity (appActivity)
-------------------------------------------------------------------

To launch the Calculator application on your device, you need to know the
application's Package (appPackage) and Activity (appActivity). If you don't
already know appPackage/appActivity you can check it using Android Debug Bridge
(adb). Android Debug Bridge is a versatile command-line tool that lets you
communicate with a device.

How to check the appPackage/appActivity:
1) Connect your Android device to the computer via USB cable
2) Launch the application, in this case Calculator, on your mobile device
3) Open Command Prompt on your computer
4) Type the following command to the Command Prompt and press enter:

    Android version < 10:
    > adb shell "dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"

    Android version >= 10:
    > adb shell "dumpsys window displays | grep -E 'mCurrentFocus|mFocusedApp'"

The command output may be e.g.:

    mCurrentFocus=Window{0a60c69 u0 com.sec.android.app.popupcalculator/com.sec.android.app.popupcalculator.Calculator}
    mFocusedApp=ActivityRecord{b5ac3cf u0 com.sec.android.app.popupcalculator/.Calculator t155}

On the first line, the part com.sec.android.app.popupcalculator is the
appPackage, and the second part com.sec.android.app.popupcalculator.Calculator
is the appActivity.


Add appPackage/appActivity to the yaml configuration file
---------------------------------------------------------

Open config.yaml from the resources/config folder and add the correct
appPackage and appActivity values in the sessions section, e.g.

    sessions:
        - session: calculator
          capabilities:
              appPackage: com.sec.android.app.popupcalculator
              appActivity: com.sec.android.app.popupcalculator.Calculator
