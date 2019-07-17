# Introduction
Fortran is not well supported by a lot of IDEs. Microsoft Visual Studio has syntax highlighting but missing a lot of great features, when it comes to auto completion, signature help, find and peek references.
Visual Studio Code in comparison has some great extensions and is running on MacOs, Linux and Windows.

This small Guide should help you to setup a full development environment for FORTRAN.

# Install Visual Studio Code
* GitHub: https://github.com/microsoft/vscode
* Download: https://code.visualstudio.com/download
## Extensions
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
##  Debugging
In general you have to define a "tasks.json" for the build and link process and a "launch.json".

Also have a look at: https://code.visualstudio.com/docs/editor/debugging

### Windows
1. Install compiler (gfortran via MinGW for example, Intel has an installer)
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
    },
    {
      "name": "Debug Fortran, build ifort 2019.4.245",
      "type": "cppdbg",
      "request": "launch",
      "targetArchitecture": "x86",
      "program": "${workspaceRoot}\\${fileBasenameNoExtension}.exe",
      "miDebuggerPath": "gdb.exe",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${workspaceRoot}",
      "externalConsole": false,
      "preLaunchTask": "build_ifort_2019.4.245"
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
  "tasks":[
    {
      "label": "build_gfortran",
      "command": "gfortran",
      "args": [
        "-g",
        "${file}",
        "-o",
        "${workspaceRoot}\\${fileBasenameNoExtension}.exe"
      ]
    },
    {
      "label": "build_ifort_2019.4.245",
      "command": " \"c:\\Program Files (x86)  \\IntelSWTools\\compilers_and_libraries_2019.4.  245\\windows\\bin\\compilervars.bat ia32 \" & ifort",
      "args": [
        "${file}"
      ]
    }
  ],
}
```
### Linux
### MacOS
