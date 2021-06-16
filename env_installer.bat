::@echo off
set INSTALLER_ROOT=%~dp0
set WHEELS_TARGET="%~dp0\wheels"
set REQ_DIR=%~dp0\requirements
set requirements=%*
set r1=%1
if [%r1%]==[] (set requirements="%REQ_DIR%\any\*.txt") else if [%r1%]==[64] (set requirements="%REQ_DIR%\any\*.txt","%REQ_DIR%\win64\*.txt") else if [%r1%]==[32] (set requirements="%REQ_DIR%\any\*.txt","%REQ_DIR%\win32\*.txt")
