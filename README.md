# Introduction

Fortran is not well supported by a lot of IDEs. Microsoft Visual Studio has syntax highlighting but missing a lot of great features, when it comes to auto completion, signature help, find and peek references.
Visual Studio Code in comparison has some great extensions and is running on MacOs, Linux and Windows.

This small Guide should help you to setup a full development environment for FORTRAN.

# Install Visual Studio Code

* GitHub: https://github.com/microsoft/vscode
* Download: https://code.visualstudio.com/download

## Extensions

### Overview

Following Extensions can be useful:

* Modern Fortran

    * Description: This extension provides support for the Fortran programming language. It includes syntax highlighting, code snippets and a linting based on gfortran.
    * GitHub: https://github.com/krvajal/vscode-fortran-support
    * Download: https://marketplace.visualstudio.com/items?itemName=krvajalm.linter-gfortran

* Fortran IntelliSense

    * Description: Fortran IntelliSense (IDE functionality) support for VSCode, powered by the Fortran Language Server.
    * GitHub: https://github.com/hansec/vscode-fortran-ls
    * Download: https://marketplace.visualstudio.com/items?itemName=hansec.fortran-ls

* Fortran Breakpoint Support

    * Description: Add breakpoint support for fortran
    * GitHub: https://github.com/ekibun/FortranBreaker
    * Download: https://marketplace.visualstudio.com/items?itemName=ekibun.fortranbreaker

### Extension: Modern Fortran

#### Requirements

#### Recommended Settings


### Extension: Fortran IntelliSense

#### Requirements

The Fortran IntelliSense Extension needs the fortran-language-server to operate.
This is written in Python. Python has is own package-management system called pip.

* Python:

    * Description:
    * GitHub:
    * Download and Install:

        * Windows:
        * Linux:
        * OSX:
* pip:

    * Description: pip is the package installer for Python
    * GitHub: https://github.com/pypa/pip
    * Download and Install:

        * Windows: when installing python make sure to install pip as well
        * Linux:
        * OSX:

* fortran-language-server:

    * Description:
    * GitHub:
    * Download and Install:

        * Windows: cmd -> python -m pip install fortran-language-server
        * Linux:
        * OSX:

Example .fortls:
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

#### Recommended Settings
To upgrade the fortran-language-server
Windows: python -m pip install --upgrade fortran-language-server



### Extension: Fortran Breakpoint Support
#### Requirements
#### Recommended Settings

##  Debugging
In general you have to define a "tasks.json" for the build and link process and a "launch.json".

Also have a look at: https://code.visualstudio.com/docs/editor/debugging

### Windows
1. Install compiler
  * Windows: (gfortran via MinGW for example, Intel has an installer)
  * Linux:
  * OSX
2. Create launch.json:

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

3. The gfortran compiler should be accessible via the command line.
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
