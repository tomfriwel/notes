# Github Project 功能介绍

### 结构

```
Project: {
    columns:[
        {
            columnName,
            type,   // None, To do, In progress, Done
            cards:[
                {
                    cardName,
                }
            ],
            addCard(){},
            editColumn(){},
            manageAutomation(){},   // Change type
            archiveAllCards(){},
            copyColumnLink(){},
            deleteColumn(){},
        }
    ],
    addColumn(){},


}
```

## 基本使用

创建`Project`的时候可以选择`Project template`，默认是空的。比如我想创建一个用于管理待办事项的`Project`，那么我就选择`Project template -> Basic kanban`，这项里面会自动创建`To do`, `In progress`和`Done`三个`column`。

支持`Markdown`。

如果某一项（card）已完成，直接将该项拖动到另一个`column`中。

`Archive（存档）`相当于暂时把某一项从`column`中移除，`card`上点击`...->Archive`进行操作。想要恢复的时候点击`Menu->...->View archive->Restore`。

## 实践

## Related Links

- [GitHub重大更新 增加项目管理工具Projects](http://news.yesky.com/227/105048727.shtml)