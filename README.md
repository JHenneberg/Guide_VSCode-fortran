# Introduction

Fortran is not well supported by a lot of IDEs.
Microsoft Visual Studio has syntax highlighting but missing a lot of great features, when it comes to auto completion, signature help, find and peek references.
Visual Studio Code in comparison has some great extensions and is running on MacOs, Linux and Windows.

This small Guide should help you to setup a full development environment for Fortran.

# Visual Studio Code

* Description:
  > Code editing. Redefined. Free. Built on open source. Runs everywhere [[https://code.visualstudio.com/](https://code.visualstudio.com/)].
* GitHub: [https://github.com/microsoft/vscode](https://github.com/microsoft/vscode)
* Download and Install:
  * Windows: `choco install vscode`, [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
  * Linux: [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
  * OSX: [https://code.visualstudio.com/download](https://code.visualstudio.com/download)

## Editor Rulers

If you are working with Fortran in the fixed-column format it is useful to setup rulers at the relevant columns.
Add this to your `settings.json`:

```json
"[FortranFixedForm]": {
    "editor.rulers": [
            {
                "column": 72,
                "color": "#E06C75"
            },
            {
                "column": 6,
                "color": "#E06C75"
            }
        ]
},
```

## Cursive italics and Ligature

Some might like this and some wont: Using cursive italics and programming symbol ligatures.

![code snippet](https://github.com/JHenneberg/Guide_VSCode-fortran/blob/master/public/cursiveItalicsAndLigature.png)

1. Download the font 'Victor Mono' from here: [https://github.com/rubjo/victor-mono](https://github.com/rubjo/victor-mono) or here [https://rubjo.github.io/victor-mono/](https://rubjo.github.io/victor-mono/)

2. Activate font ligatures and select the font:

    ```json
    "editor.fontLigatures": true,
    "editor.fontFamily": "Victor Mono, Consolas, 'Courier New', monospace",
    ```

3. In the standard settings for fortran syntax highlighting nothing more then paramter are italic and therefore then cursive. You can customize this quite easy:

    ```json
    "editor.tokenColorCustomizations": {
         "textMateRules": [
             {
                 "name": "comment",
                 "scope": [
                     "comment",
                     "constant.language.logical",
                     "keyword.logical",
                     "variable.parameter.dummy-variable.fortran.modern",
                     "string.quoted.single.fortran",
                     "string.quoted.double.fortran",
                     "support.function.intrinsic.fortran"
                 ],
                 "settings": {
                     "fontStyle": "italic"
                 }
             },
             {
                 "name": "comment",
                 "scope": [
                     "variable.parameter.fortran"
                 ],
                 "settings": {
                     "fontStyle": ""
                 }
             }
         ]
    }
    ```

    To find out the scope you can type in the command palette (`ctrl` + `shift` + `p`): `Developer: Inspect Editor Tokens and Scopes` and hover over your source code.

# Visual Studio Code Extensions

There are some extensions that are very useful.
`Modern Fortran` can be used for syntax highlighting and snippets.
For features like Signature help or GoTo/Peek definition and much more `fortls` should be installed.

## Modern Fortran

### Overview

* Description:
  > This extension provides support for the Fortran programming language. It includes syntax highlighting, code snippets and a linting based on `gfortran`, `ifort` and `ifx` [[https://github.com/fortran-lang/vscode-fortran-support](https://github.com/fortran-lang/vscode-fortran-support)].
* GitHub: [https://github.com/fortran-lang/vscode-fortran-support](https://github.com/fortran-lang/vscode-fortran-support)
* Download: [https://marketplace.visualstudio.com/items?itemName=fortran-lang.linter-gfortran](https://marketplace.visualstudio.com/items?itemName=fortran-lang.linter-gfortran)
* Optional Requirements:
  * `fortls`

### Language Server Integration

Symbol functionality and hover information is also provided by `Modern Fortran` when the fortran language server `fortls` is installed which is written in python.

### Requirements

1. Install `python`
2. Install `pip`
3. Install `fortls`

* Python:

  * Description:
  * GitHub: https://github.com/python
  * Download and Install:
    * Windows: `choco install python`, [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)
    * Linux: `sudo apt-get install python3`, `pacman -S python` | `pacman -S python2`
    * OSX: [https://www.python.org/downloads/mac-osx/](https://www.python.org/downloads/mac-osx/)

* pip:

  * Description:
    >pip is the package installer for Python. You can use pip to install packages from the Python Package Index and other indexes [[https://github.com/pypa/pip](https://github.com/pypa/pip)].
  * GitHub: https://github.com/pypa/pip
  * Download and Install:
    * Windows: it is often already installed during the installation process of python itself https://pip.pypa.io/en/stable/installing/
    * Linux: https://pip.pypa.io/en/stable/installing/
    * OSX: https://pip.pypa.io/en/stable/installing/

* fortls:

  * Description:
  >A Fortran implementation of the Language Server Protocol (LSP) using Python (3.6+).
  Editor extensions that can integrate with fortls to provide autocomplete and other IDE-like functionality are available for Visual Studio Code Atom, Visual Studio, (Neo)vim, and Emacs.[[https://github.com/gnikit/fortls](https://github.com/gnikit/fortls)].
  * GitHub: https://github.com/gnikit/fortls
  * Download and Install:
    * Windows: `python -m pip install fortls`
    * Linux: `pip install fortls`
    * OSX: `pip install fortls`
  * Update:
    * Windows: `python -m pip install --upgrade fortls`
    * Linux: `pip install --upgrade fortls`
    * OSX : `pip install --upgrade fortls`

### Settings

To setup `fortls` a file named `.fortls` is needed in your workspace in Visual Studio Code.
It is written in JSON.
Example `.fortls`:

```json
{
  "mod_dirs": [
    "src",
    "ins"
  ],
  "excl_paths": ["src/Debug", "src/Release"],
  "excl_suffixes": [".u2d", ".vfproj", ".sln", ".txt"],
  "lowercase_intrinsics": false,
  "debug_log": false
}
```

# Build & Debug

In general you have to define a `tasks.json` for the build and link process and a `launch.json` to start to debug.

Also have a look at: https://code.visualstudio.com/docs/editor/debugging

## Install compiler

  * Windows: gfortran via MinGW for example
  * Linux: `sudo apt-get install gfortran`, `sudo pacman -S gcc-fortran`
  * OSX:

## Create launch.json:

```JSON
{
  "version": "2.0.0",
  "configurations": [
    {
      "name": "Debug Fortran & build",
      "type": "cppdbg",
      "request": "launch",
      "targetArchitecture": "x86",
      "program": "${workspaceRoot}\\${fileBasenameNoExtension}.exe",
      "miDebuggerPath": "gdb.exe",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${workspaceRoot}",
      "externalConsole": true,
      "preLaunchTask": "build_gfortran"
    }
  ]
}
```

## Create tasks.json

The `gfortran` compiler should be accessible via the command line.

Create `tasks.json`:

```JSON
{
  "version": "2.0.0",
  "_runner": "terminal",
  "tasks":[
    {
      "label": "build_gfortran",
      "type": "shell",
      "windows": {
        "command": "gfortran"
      },
      "linux": {
        "command": "gfortran"
      },
      "osx": {
        "command": "gfortran"
      },
      "args": [
        "-g",
        "${file}",
        "-o",
        "${workspaceRoot}\\${fileBasenameNoExtension}.exe"
      ]
    }
  ],
}
```

## Debugging

Click on the debug symbol in Visual Studio Code, choose the debug configuration and press start.
