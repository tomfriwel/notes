# openpyxl(python)


### Setting the width of sheet's column

```python
from openpyxl import Workbook

wb = Workbook()
worksheet = wb.active
worksheet.column_dimensions['A'].width = 50

wb.save(filename="col_width.xlsx")
```

[Setting Column Width with OpenPyXL](https://joshuahunter.com/posts/setting-column-width-with-openpyxl/)

### create sheet

[Use openpyxl - create a new Worksheet, change sheet property in Python](https://www.soudegesu.com/en/post/python/sheet-excel-with-openpyxl/)

```python
from openpyxl.workbook import Workbook

wb = Workbook()

ws1 = wb.create_sheet("Sheet_A")
ws1.title = "Title_A"

ws2 = wb.create_sheet("Sheet_B", 0)
ws2.title = "Title_B"

wb.save(filename = 'sample_book.xlsx')
```

### Error: AttributeError: 'Workbook' object has no attribute 'get_active_sheet'

`get_active_sheet` removed in new version.

Use `ws = wb.active`:
```python
from openpyxl import Workbook
wb = Workbook()
ws = wb.active
```


[Tutorial - Create a workbook](https://openpyxl.readthedocs.io/en/stable/tutorial.html)

[Python错误：AttributeError: 'Worksheet' object has no attribute 'get_highest_row' 解决办法](https://blog.csdn.net/liuyukuan/article/details/84679683)


### [openpyxl.utils.exceptions.IllegalCharacterError 错误原因分析及解决办法](https://blog.csdn.net/javajiawei/article/details/97147219)

```python
from openpyxl.cell.cell import ILLEGAL_CHARACTERS_RE
text = ILLEGAL_CHARACTERS_RE.sub(r'', text)
```