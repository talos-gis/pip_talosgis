@echo off
call %~dp0\env_installer.bat %*

echo Are you sure you want to download all the requirements in %requirements% to %WHEELS_TARGET%? 
for %%R in (%requirements%) do echo %%R
echo Press Ctrl+C to abort
pause

python.exe -m pip install --upgrade pip

setlocal EnableDelayedExpansion

set all_req=
for %%R in (%requirements%) do (
	echo %%R
	SET ext=%%~xR
	SET req=
	if [!ext!]==[.txt] SET req=-r
	set all_req=!all_req! !req! "%%R"
)
python -m pip download -d "%WHEELS_TARGET%" !all_req!
