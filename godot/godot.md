
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

#### group, loop

For example, change the whole label's text in a group.

Add labels to `Group Labels`, and

```js
func _ready():
    add_to_group("Labels")
    
func _on_Button_pressed():
    var labels = get_tree().get_nodes_in_group("Labels")
        for label in labels:
            label.text = "asb"
```

Or something like a object, you can call its method like:
```js
func _ready():
    add_to_group("horses_group")

func _on_Button_pressed():
    get_tree().call_group("horses_group", "run")
```

#### overrideable funtions

```python
func _enter_tree():
    # When the node enters the _Scene Tree_, it becomes active
    # and  this function is called. Children nodes have not entered
    # the active scene yet. In general, it's better to use _ready()
    # for most cases.
    pass

func _ready():
    # This function is called after _enter_tree, but it ensures
    # that all children nodes have also entered the _Scene Tree_,
    # and became active.
    pass

func _exit_tree():
    # When the node exits the _Scene Tree_, this function is called.
    # Children nodes have all exited the _Scene Tree_ at this point
    # and all became inactive.
    pass

func _process(delta):
    # This function is called every frame.
    pass

func _physics_process(delta):
    # This is called every physics frame.
    pass
```

#### Add node and delete it

```python
var myLabel
func _ready():
	myLabel = Label.new()
	myLabel.text = "My new label."
    add_child(myLabel)
func _on_Button_pressed():
#    myLabel.free() # Immediately removes the node from the scene and frees it.
    # safty way:
    myLabel.queue_free()    # Removes the node from the scene and frees it when it becomes safe to do so.
```

#### Instancing scenes

```python
var scene = load("res://Processing.tscn") # Will load when the script is instanced.
# or
var scene = preload("res://Processing.tscn") # Will load when parsing the script.

func _ready():
    var node = scene.instance()
    add_child(node)
```