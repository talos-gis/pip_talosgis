@echo off
call %~dp0\env_installer.bat %*

echo Are you sure you want to download all the requirements in %requirements% to %WHEELS_TARGET%? 
for %%R in (%requirements%) do echo %%R
echo Press Ctrl+C to abort
pause

setlocal EnableDelayedExpansion

for %%R in (%requirements%) do (
	echo %%R
	SET ext=%%~xR
	SET req=
	if [!ext!]==[.txt] SET req=-r
	python -m pip download !req! "%%R" -d "%WHEELS_TARGET%"
)
pause