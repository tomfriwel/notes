# CSS

#### animate height: auto

```css
#menu #list {
    max-height: 0;
    transition: max-height 0.15s ease-out;
    overflow: hidden;
    background: #d5d5d5;
}

#menu:hover #list {
    max-height: 500px;
    transition: max-height 0.25s ease-in;
}
```
[How can I transition height: 0; to height: auto; using CSS?](https://stackoverflow.com/questions/3508605/how-can-i-transition-height-0-to-height-auto-using-css)