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

### 