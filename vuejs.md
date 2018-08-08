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