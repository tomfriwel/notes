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