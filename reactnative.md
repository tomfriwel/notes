
# [React Native Tutorial – Building Your First iOS App With JavaScript (Part 1)](https://www.smashingmagazine.com/2016/04/the-beauty-of-react-native-building-your-first-ios-app-with-javascript-part-1/)

# new 

`$ react-native init AwesomeProject`

# run ios

`$ react-native run-ios`

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

# [No bundle url present #12754](https://github.com/facebook/react-native/issues/12754)

```
yustada commented on Mar 9, 2017
My problem has been solved by adding NSAllowsLocalNetworking to Info.plist

<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
		<key>NSAllowsArbitraryLoadsInWebContent</key>
		<true/>
		<key>NSAllowsLocalNetworking</key>
		<true/>
	</dict>
</key>
I am not sure it is because of RN0.42 or iOS issue, but it is solved in my case.
```

# [RCTBridge required dispatch_sync to load RCTDevLoadingView. This may lead to deadlocks #16376](https://github.com/facebook/react-native/issues/16376)

I was able to workaround the warning by updating `AppDelegate.m`

```
#if RCT_DEV
#import <React/RCTDevLoadingView.h>
#endif
...
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ...
  RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation
                                            moduleProvider:nil
                                             launchOptions:launchOptions];
#if RCT_DEV
  [bridge moduleForClass:[RCTDevLoadingView class]];
#endif
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"Test"
                                            initialProperties:nil];
  ...
}
```

# React Navigation

### navigate to other page:

```
this.props.navigation.navigate('ToPage')
//or with params
this.props.navigation.navigate('ToPage', {
    title:'anything'
})

//get the param inside of ToPage's render()
const { params } = this.props.navigation.state;

<Text>title:{JSON.stringify(params.title)}</Text>
```

### Back to previous page:

```
this.props.navigation.goBack()
```

### Some library need link after installed
For example:
After run `$ npm i --save react-native-ble-manager`, you need link by command `$ react-native link`

### About Native Module

You need rebuild project to use your module.