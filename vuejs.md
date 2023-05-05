### The curly braces(`{{variable}}`) appear when the page loads.
css:
```css
[v-cloak] {
  display: none;
}
```

html:
```html
<div id="app" v-cloak>
  {{ message }}
</div>
```

[#v-cloak](https://cn.vuejs.org/v2/api/#v-cloak)

### vue init in current folder

`$ vue init webpack-simple .`


# Single Page App

### disable reload when back to previous page, deal binding `{{param}}` when unready

```js
<template>
  <div id="app" v-cloak>
    <keep-alive>
      <router-view v-if="$route.meta.keepAlive"></router-view>
    </keep-alive>
    <router-view v-if="!$route.meta.keepAlive"></router-view>
  </div>
</template>
```

```css
[v-cloak] {
    display: none;
}
```

### Font Awesome

[Font Awesome - Vue.js](https://fontawesome.com/how-to-use/on-the-web/using-with/vuejs)

### [vite antdv@1.7.8 日期控件报错TypeError: (void 0) is not a function](https://blog.csdn.net/qq_35459724/article/details/128684144)

```shell
yarn add vite-plugin-antdv-fix -D
//or
npm i vite-plugin-antdv-fix -D
```

```js
// vite.config.ts
import antdvFix from 'vite-plugin-antdv-fix'
import { defineConfig } from 'vite'
export default defineConfig({
  plugins: [
    antdvFix()
  ]
})
```
- https://github.com/moliyu/vite-plugin-antdv-fix