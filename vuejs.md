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