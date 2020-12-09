# Swift 5.3

[Welcome to Swift.org](https://swift.org)

### 2020 12 8

```swift
// constant
let score = 66
score = 1 // error

// variable
var age = 11
age = 20

// specify type
var age:Int = 11

// concat string
let no = 22
let name = "Tom"
let nameAndNo = name + no // error
// 1
let nameAndNo = "name:" + name + ", no:" + String(no)
// 2
let nameAndNo = "name:\(name), no:\(no)"

// multiple lines
let lines = """
Use three double quotation marks (\"\"\") for strings that take up multiple lines.

Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks.
"""

// To create an empty array or dictionary, use the initializer syntax.
let emptyArray = [String]()
let emptyDictionary = [String: Float]()


// not include upper value 3
for i in 0..<3 {
    print(i)
}
// 0,1,2

// include upper value 3
for i in 0...3 {
    print(i)
}
// 0,1,2,3


// 1. function definatin
func add(a:Double, b: Double)->Double {
    return a + b
}

print(add(a: 2, b: 1)) // 3.0

// 2. no label
func add(_ a:Double, _ b: Double)->Double {
    return a + b
}
print(add(2, 3)) // 5.0

// 3. custom label
func add(add a:Double, with b: Double)->Double {
    return a + b
}

print(add(add: 3, with: 4)) // 7.0
```