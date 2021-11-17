# Understanding ArrayBuffer

`1 kb = 1024 bytes; 1 bytes = 8 bit`

```js
const buffer = new ArrayBuffer(1024)
// buffer.byteLength: 1024 bytes = 1kb
// ArrayBuffer(1024)
// byteLength: 1024
// [[Prototype]]: ArrayBuffer
// [[Int8Array]]: Int8Array(1024)
// [[Uint8Array]]: Uint8Array(1024)
// [[Int16Array]]: Int16Array(512)
// [[Int32Array]]: Int32Array(256)
// [[ArrayBufferByteLength]]: 1024
// [[ArrayBufferData]]: "0x007001c30400"

// int8 1 bytes
// int16 2 bytes
// int32 4 bytes
const view = new DataView(buffer)
view.setInt32(0, 123)
view.getInt8()  // 0
view.getInt16() // 0
view.getInt32() // 123
```

### References

- [ArrayBuffer - JavaScript | MDN](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer)
- [怎么理解 JavaScript 中的 ArrayBuffer？ - 李建万的回答 - 知乎](https://www.zhihu.com/question/30401979/answer/133686569)