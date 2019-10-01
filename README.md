# Introduction

Fortran is not well supported by a lot of IDEs. Microsoft Visual Studio has syntax highlighting but missing a lot of great features, when it comes to auto completion, signature help, find and peek references.
Visual Studio Code in comparison has some great extensions and is running on MacOs, Linux and Windows.

This small Guide should help you to setup a full development environment for FORTRAN.

# Install Visual Studio Code and Extensions

Installing Visual Studio Code and some useful extensions.

## Visual Studio Code

* GitHub: [https://github.com/microsoft/vscode](https://github.com/microsoft/vscode)
* Download: [https://code.visualstudio.com/download](https://code.visualstudio.com/download)

## Extensions

Following Extensions can be useful:

* Modern Fortran

  * Description: This extension provides support for the Fortran programming language. It includes syntax highlighting, code snippets and a linting based on gfortran.
  * GitHub: [https://github.com/krvajal/vscode-fortran-support](https://github.com/krvajal/vscode-fortran-support)
  * Download: [https://marketplace.visualstudio.com/items?itemName=krvajalm.linter-gfortran](https://marketplace.visualstudio.com/items?itemName=krvajalm.linter-gfortran)

* Fortran IntelliSense

  * Description: Fortran IntelliSense (IDE functionality) support for VSCode, powered by the Fortran Language Server.
  * GitHub: [https://github.com/hansec/vscode-fortran-ls](https://github.com/hansec/vscode-fortran-ls)
  * Download: [https://marketplace.visualstudio.com/items?itemName=hansec.fortran-ls](https://marketplace.visualstudio.com/items?itemName=hansec.fortran-ls)
  * Requirements:
    * fortran-language-server -> python (with pip)

* Fortran Breakpoint Support

    * Description: Add breakpoint support for fortran
    * GitHub: [https://github.com/ekibun/FortranBreaker](https://github.com/ekibun/FortranBreaker)
    * Download: [https://marketplace.visualstudio.com/items?itemName=ekibun.fortranbreaker](https://marketplace.visualstudio.com/items?itemName=ekibun.fortranbreaker)

## Requirements

The Fortran IntelliSense Extension needs the fortran-language-server to operate.
This is written in Python. Python has is own package-management system called pip.

* Python:

  * Description:
  * GitHub: https://github.com/python
  * Download and Install:

    * Windows: https://www.python.org/downloads/windows/
    * Linux: via apt-get, packman
    * OSX: https://www.python.org/downloads/mac-osx/
* pip:

  * Description: pip is the package installer for Python
  * GitHub: https://github.com/pypa/pip
  * Download and Install:

    * Windows: https://pip.pypa.io/en/stable/installing/
    * Linux: https://pip.pypa.io/en/stable/installing/
    * OSX: https://pip.pypa.io/en/stable/installing/

* fortran-language-server:

  * Description: A Fortran implementation of the Language Server Protocol using Python (2.7+ or 3.0+).
  * GitHub: https://github.com/hansec/fortran-language-server
  * Download and Install:

    * Windows: ```python -m pip install fortran-language-server```
    * Linux: ```pip install fortran-language-server```
    * OSX: ```pip install fortran-language-server```
  * Update:

    * Windows: ```python -m pip install --upgrade fortran-language-server```
    * Linux: ```pip install --upgrade fortran-language-server```
    * OSX : ```pip install --upgrade fortran-language-server```

To setup the fortran language server a file named .fortls is needed in your workspace in Visual Studio Code. Example .fortls:

```JSON
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

In general you have to define a "tasks.json" for the build and link process and a "launch.json" to start to debug.

Also have a look at: https://code.visualstudio.com/docs/editor/debugging

## Install compiler

  * Windows: (gfortran via MinGW for example, Intel has an installer)
  * Linux:
  * OSX

## Create launch.json:

```JSON
{
  "version": "2.0.0",
  "configurations": [
    {
      "name": "Debug Fortran, build gfortran",
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

The gfortran compiler should be accessible via the command line.
To be able to use the intel compiler you can not just call ifort.
The intel compiler can be only after setting the env variable correct.
Calling the specific *.bat-File we can access ifort from this terminal.
Create "tasks.json":

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
