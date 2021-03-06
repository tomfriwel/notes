### Create

```shell
# Init project
react-native init [project-name]
# install
yarn
# in ios folder
pod install

# install react navigation
# https://reactnavigation.org/docs/getting-started
yarn add @react-navigation/native

# install dependencies required by react-navigation
yarn add react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view

# if ios
npx pod-install ios

# react navigation stack
yarn add @react-navigation/stack

# path alias
yarn add --dev babel-plugin-module-resolver
# tleunen/babel-plugin-module-resolver not work on react native
# solution: https://github.com/tleunen/babel-plugin-module-resolver/issues/332#issuecomment-439346463
```

run `navigation.navigate('Details')` in Details screen will no effect, `navigate` means 'go to this screen', change `navigate` to `push`. This allows us to express the intent to add another route regardless of the existing navigation history.

[navigating](https://reactnavigation.org/docs/navigating)

### Use react-navigation

Fast create Screen:

```js
// Define multiple groups of screens in objects like this
const commonScreens = {
  Help: HelpScreen,
};

const authScreens = {
  SignIn: SignInScreen,
  SignUp: SignUpScreen,
};

const userScreens = {
  Home: HomeScreen,
  Profile: ProfileScreen,
};

// Then use them in your components by looping over the object and creating screen configs
// You could extract this logic to a utility function and reuse it to simplify your code
<Stack.Navigator>
  {Object.entries({
    // Use the screens normally
    ...commonScreens,
    // Use some screens conditionally based on some condition
    ...(isLoggedIn ? userScreens : authScreens),
  }).map(([name, component]) => (
    <Stack.Screen name={name} component={component} />
  ))}
</Stack.Navigator>;
```

[Nesting navigators](https://reactnavigation.org/docs/nesting-navigators/)

### 20201120
```shell
yarn add react-native-image-picker

# RN >= 0.60
cd ios && pod install

# RN < 0.60
react-native link react-native-image-picker
```

[react-native-image-picker/react-native-image-picker](https://github.com/react-native-image-picker/react-native-image-picker)

[An In-Depth Guide to Using React Native Image Picker](https://blog.crowdbotics.com/how-to-use-react-native-image-picker/)

### 20201123 save image

- [react-native-cameraroll/react-native-cameraroll](https://github.com/react-native-cameraroll/react-native-cameraroll)
- [joltup/rn-fetch-blob](https://github.com/joltup/rn-fetch-blob/wiki/File-System-Access-API#writefilepathstring-contentstring--array-encodingstringpromise)

[React Native Series: How to save an image from a remote url in React Native](https://dev.to/majiyd/react-native-series-how-to-save-an-image-from-a-remote-url-in-react-native-109d)

```shell
yarn add @react-native-community/cameraroll rn-fetch-blob
cd ios && pod install
```

#### [useState hook vs this.state and this.setState in React-Native.](https://medium.com/@ayzik55/usestate-hook-vs-this-state-and-this-setstate-in-react-and-react-native-6c0936e9a8b)

### 20201124 icons

[Add custom icons to your React Native application](https://medium.com/bam-tech/add-custom-icons-to-your-react-native-application-f039c244386c)

[Fontello](https://fontello.com)

```shell
yarn add react-native-vector-icons
react-native link react-native-vector-icons

```

Add to `package.json`:

```json
{
  ...
  "yarn": { "assets": [ "src/fonts" ] },
  ...
}
```

### 20201231 bug tracking

```shell
yarn add @sentry/react-native
yarn sentry-wizard -i reactNative -p ios android
```


### trasition
[Custom screen transitions in React Navigation](https://callstack.com/blog/custom-screen-transitions-in-react-navigation/)

[Using TypeScript](https://reactnative.dev/docs/typescript)

`yarn add react-native-swiper`

[magicismight/react-native-root-toast](https://github.com/magicismight/react-native-root-toast)

[magicismight/react-native-root-siblings](https://github.com/magicismight/react-native-root-siblings)


### 20210111 storage

`$ yarn add @react-native-async-storage/async-storage`

- [API](https://react-native-async-storage.github.io/async-storage/docs/api)

### 20210119 Display a native `UIViewController`

[How can I present a native UIViewController in React Native? (Can't use just a UIView)](https://stackoverflow.com/a/36581163/6279975)