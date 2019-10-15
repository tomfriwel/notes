# [SheetJS/js-xlsx](https://github.com/sheetjs/js-xlsx)

## Solutions

#### Date Formatting

[dateNF seems to be ignored #718](https://github.com/SheetJS/js-xlsx/issues/718#issuecomment-485397820)

```js
const workbook = XLSX.read(data, {
  cellDates: true,
  dateNF: 'yyyy-MM-dd'
})

// Setting: raw: false
XLSX.utils.sheet_to_json({ raw: false })
```

#### [利用js-xlsx在vue中与element-ui结合实现excel前端导入](https://www.jianshu.com/p/c1ff63d8b49f)

```html
<el-upload
    ref="upload"
    action="/wm/upload/"
    :show-file-list="false"
    :on-change="readExcel"
    :auto-upload="false">
  <el-button
      slot="trigger"
      icon="el-icon-upload"
      size="small"
      type="primary">
    上传文件
  </el-button>
</el-upload>
```

```js
readExcel(file) {
  const fileReader = new FileReader()
  fileReader.onload = (ev) => {
    try {
      const data = ev.target.result
      const workbook = XLSX.read(data, {
        type: 'binary',
        cellDates: true,
        dateNF: 'yyyy-MM-dd'
      })
      console.log(workbook.Sheets)
      for (const sheet in workbook.Sheets) {
        const sheetArray = XLSX.utils.sheet_to_json(workbook.Sheets[sheet], { raw: false })
        // console.log(sheetArray)
      }
    } catch (e) {
      this.$message.warning('文件类型不正确！')
      return false
    }
  }
  fileReader.readAsBinaryString(file.raw)
}
```