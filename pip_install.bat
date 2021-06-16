@echo off
call %~dp0\env_installer.bat %*

echo Are you sure you want to install all the requirements in %requirements% from %WHEELS_TARGET%? 
for %%R in (%requirements%) do echo %%R
echo Press Ctrl+C to abort
pause

setlocal EnableDelayedExpansion
if [%online%]==[] SET pip_offline=--no-index --find-links "%WHEELS_TARGET%"
for %%R in (%requirements%) do (
	echo %%R
	SET ext=%%~xR
	SET req=
	if [!ext!]==[.txt] SET req=-r
	python -m pip install --upgrade %pip_offline% !req! "%%R"
)
pause