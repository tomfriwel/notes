# Visual Studio Code (vscode)

### format code

 - On Windows <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>F</kbd>
 - On Mac <kbd>Shift</kbd> + <kbd>Option</kbd> + <kbd>F</kbd>
 - On Ubuntu <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>I</kbd>

 ### open command

 <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> / <kbd>Command</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>

 ### Open from terminal

 Open Visual Studio Code and press <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> then type `Shell` in command palette now you are able to find this option like `Shell Command : Install code in PATH` from suggested list in command palette. Select that options.

 [Run / Open VSCode from Mac Terminal](https://stackoverflow.com/a/36882426/6279975)

 ### Show tab/whitespace

 Check `Setting`>`renderControlCharacters`

 Select `all` in `Setting`>`renderWhitespace`

 [在VScode中显示空格和tab符号](https://www.pianshen.com/article/34461565902/)

 ### [1.25.0 - new error when opening ssh:// URIs - "Error handling uri: " build.gradle, .devcontainer.json #341](https://github.com/SchoofsKelvin/vscode-sshfs/issues/341)


 Code>Preferences>Settings: `"sshfs.flags": ["-FS_NOTIFY_ERRORS"]`