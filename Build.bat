@echo off

:: Add Qt 6 CMake to PATH
set "PATH=%QT_ROOT_64%\bin;%PATH%"
set PATH=%PATH%;C:\Program Files\Cmake\bin


cmake.exe -A x64 -T v142 -DCMAKE_CONFIGURATION_TYPES=Release;Debug . 

:: Open solution
start analogclock.sln

::pause
