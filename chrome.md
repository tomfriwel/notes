### [Include JavaScript file in Chrome console](https://stackoverflow.com/questions/5282228/include-javascript-file-in-chrome-console)


native:

```js
var script = document.createElement('script');
script.type = 'text/javascript';
script.src = 'script.js';
document.head.appendChild(script);
```

jquery:
```js
$.getScript('script.js');
```