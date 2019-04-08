
- [Godot3游戏引擎入门之零一：【翻译】为什么要选择 Godot 引擎](https://blog.csdn.net/SpkingR/article/details/82020539)

- [Roadmap](https://github.com/godotengine/godot-roadmap/blob/master/ROADMAP.md)

- [Godot Engine](https://github.com/godotengine)



# Docs

- [Godot Docs](http://docs.godotengine.org/en/stable/)

# Notes

## 2019 4 4

![](./shooter_instancing.png)
![](./openworld_instancing.png)

```js
Scene:{
    Name,
    Properties,
    Script,
    Nodes,
}
```

Node also can be a Scene.

#### Connect signals to script

Connect in `Signals` or in `func _ready()`, for example, connect button's 'pressed' signal:

manually:

```js
func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	get_node("Label").text = "HELLO!"
```

or:

![](./connect-signal.png)


Get a button in label:

```
get_node("Label/Button")
```

Nodes are referenced by name, not by type.

#### idle processing, physics processing