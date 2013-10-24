calabash-test
=============

Test app to demonstrate calabash iOS bug(s)

Project uses CocoaPods so start with `pod install` after cloning.

To add Calabash test target I used `calabash-ios setup` command.

# Visibility Bug
This branch (`messages`) demonstrates bugs with `uia_` calls in Messages app.

It needs to be tested on iPad device.
To build from command line use something like

    # Xcode 5 example
    xcodebuild clean build -workspace calabash-test.xcworkspace -scheme calabash-test-cal -destination OS=6.1,name=iPad CONFIGURATION_BUILD_DIR=$(pwd)/buildreset OBJ_ROOT=$(pwd)/build SYM_ROOT=$(pwd)/build

There are 2 issues

- The keyboard input toolbar (the one with photo button, text input field and Send button) is "invisible", that is not returned by `uia_query("view")`

- In portrait orientation `uia_tap_mark("Cancel")` is working, but once device is rotated to landscape orientation, this call fails.
