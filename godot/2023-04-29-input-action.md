# Detect input and exec action

```python
func _physics_process(_delta):
    if Input.is_action_just_pressed("mouse_left"):
        action()


def action():
    # some action, also can take some input like click position
    print("action exec")
```