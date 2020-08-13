#### Deep Copy Array

`var copy = JSON.parse(JSON.stringify(array));`

[Copying an array of objects into another array in javascript (Deep Copy)](https://stackoverflow.com/questions/28482593/copying-an-array-of-objects-into-another-array-in-javascript-deep-copy/28482763#28482763)

Simple array like [1, 2, 3]

`var copy = array.slice()`


#### [Deleting array elements in JavaScript - delete vs splice](https://stackoverflow.com/questions/500606/deleting-array-elements-in-javascript-delete-vs-splice)

#### 中文比较

`str1.localeCompare(str2, 'zh-CN')`

[js实现汉字中文排序的方法 例如：省市列表的排序](https://www.cnblogs.com/weblff/p/9051608.html)

#### 数组去重
```js
function unique(arr) {
  return arr.filter(function(item, index, arr) {
    //当前元素，在原始数组中的第一个索引==当前索引值，否则返回当前元素
    return arr.indexOf(item, 0) === index;
  });
}
    var arr = [1,1,'true','true',true,true,15,15,false,false, undefined,undefined, null,null, NaN, NaN,'NaN', 0, 0, 'a', 'a',{},{}];
        console.log(unique(arr))
//[1, "true", true, 15, false, undefined, null, "NaN", 0, "a", {…}, {…}]
```

[JavaScript数组去重（12种方法，史上最全）](https://segmentfault.com/a/1190000016418021?utm_source=tag-newest)