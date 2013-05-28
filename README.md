calabash-test
=============

Test app to demonstrate calabash iOS bug(s)

Project uses CocoaPods so start with `pod install` after cloning.

To add Calabash test target I used `calabash-ios setup` command.

# Visibility Bug
Visibility is broken in 0.9.146, visible and touchable elements are not returned by the query.
The same app visibility is OK with 0.9.144

## 0.9.144
Slider closed, all visible.
![0.9.144, closed, visible](screenshots/144-sidebar-closed.png)

Slider opened, all visible.
![0.9.144, open, visible](screenshots/144-sidebar-opened.png)

## 0.9.146
Slider closed, all visible.
![0.9.146, closed, visible](screenshots/146-sidebar-closed.png)

Slider opened, **visibility broken**.
![0.9.146, open, visible](screenshots/146-sidebar-opened-bug.png)