
# [React Native Tutorial – Building Your First iOS App With JavaScript (Part 1)](https://www.smashingmagazine.com/2016/04/the-beauty-of-react-native-building-your-first-ios-app-with-javascript-part-1/)

# iOS Xcode fix sign issues

Open ios project in folder ./ios.

TARGETS > General > Identity > Bundle Identifier

TARGETS > General > Signing > Team

# run

`$ react-native run-ios` or click run button in Xcode

# Specify Simulator

Add `--simulator="xxx"`:

`$ react-native run-ios --simulator="iPhone 8 Plus"`

# shortcuts

ios: Press Cmd+R to reload, Cmd+D or shake for dev menu

android: Double tap R on your keyboard to reload, Shake or press menu button for dev menu

# upgrade

You should consider using the new upgrade tool based on Git. It makes upgrades easier by resolving most conflicts automatically.
To use it:
- Go back to the old version of React Native
- Run "npm install -g react-native-git-upgrade"
- Run "react-native-git-upgrade"
See https://facebook.github.io/react-native/docs/upgrading.html

# Error: EACCES: permission denied ...

`$ sudo ...`

