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
"[fortran_fixed-form]": {
    "editor.rulers": [
        6,
        73
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
For features like Signature help or GoTo/Peek definition and much more `FORTRAN IntelliSense` should be installed.
If you also want to debug, you have to download the extension `Fortran Breakpoint Support`.

## Modern Fortran

### Overview

* Description:
  > This extension provides support for the Fortran programming language. It includes syntax highlighting, code snippets and a linting based on `gfortran` [[https://github.com/krvajal/vscode-fortran-support](https://github.com/krvajal/vscode-fortran-support)].
* GitHub: [https://github.com/krvajal/vscode-fortran-support](https://github.com/krvajal/vscode-fortran-support)
* Download: [https://marketplace.visualstudio.com/items?itemName=krvajalm.linter-gfortran](https://marketplace.visualstudio.com/items?itemName=krvajalm.linter-gfortran)
* Requirements:
  * none

### Settings

Basic symbol functionality or hover information is also provided by `Modern Fortran`. Using `Modern Fortran` and `FORTRAN IntelliSense` simultaneously those should be deactivated in your `settings.json`:

```JSON
"fortran.provideCompletion": false,
"fortran.provideSymbols": false,
"fortran.provideHover": false,
```

## FORTRAN IntelliSense

### Overview

* Description:
  >FORTRAN IntelliSense (IDE functionality) support for VSCode, powered by the Fortran Language Server [[https://github.com/hansec/vscode-fortran-ls](https://github.com/hansec/vscode-fortran-ls)].
* GitHub: [https://github.com/hansec/vscode-fortran-ls](https://github.com/hansec/vscode-fortran-ls)
* Download: [https://marketplace.visualstudio.com/items?itemName=hansec.fortran-ls](https://marketplace.visualstudio.com/items?itemName=hansec.fortran-ls)
* Requirements:
  * fortran-language-server, python[, pip]

This Extension needs the `fortran-language-server` to operate because it is just an interface for the `fortran-language-server` which can be used by different IDEs.
It is written in python

### Requirements

1. Install `python`
2. Install `pip`
3. Install `fortran-Language-server`

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

* fortran-language-server:

  * Description:
  >A Fortran implementation of the Language Server Protocol using Python (2.7+ or 3.0+).
  Editor extensions using this language server to provide autocomplete and other IDE-like functionality are available for Atom, Visual Studio Code, Visual Studio, (Neo)vim, and Emacs [[https://github.com/hansec/fortran-language-server](https://github.com/hansec/fortran-language-server)].
  * GitHub: https://github.com/hansec/fortran-language-server
  * Download and Install:
    * Windows: `python -m pip install fortran-language-server`
    * Linux: `pip install fortran-language-server`
    * OSX: `pip install fortran-language-server`
  * Update:
    * Windows: `python -m pip install --upgrade fortran-language-server`
    * Linux: `pip install --upgrade fortran-language-server`
    * OSX : `pip install --upgrade fortran-language-server`

### Settings

To setup the `fortran-language-server` a file named `.fortls` is needed in your workspace in Visual Studio Code.
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

## Fortran Breakpoint Support

  * Description:
  >Add breakpoint support for fortran [[https://github.com/ekibun/FortranBreaker](https://github.com/ekibun/FortranBreaker)]
  * GitHub: [https://github.com/ekibun/FortranBreaker](https://github.com/ekibun/FortranBreaker)
  * Download: [https://marketplace.visualstudio.com/items?itemName=ekibun.fortranbreaker](https://marketplace.visualstudio.com/items?itemName=ekibun.fortranbreaker)
  * Requirements:
    * none

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
