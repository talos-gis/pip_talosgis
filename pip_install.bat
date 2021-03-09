@goto doit

::AT > NUL
@NET SESSION >nul 2>&1
@IF %ERRORLEVEL% EQU 0 (
    goto doit
) ELSE (
    @ECHO you are NOT Administrator. Please run this script as Administrator. Exiting...
    goto finish
)

:doit
@SET WHEELS_TARGET=%~dp0\wheels
@if %1x==x (SET requirements="%~dp0\requirements\*.txt") else (SET requirements=%*)

@echo Are you sure you want to install all the requirements in %requirements% from %WHEELS_TARGET%? 
@echo Press Ctrl+C to abort
pause
setlocal EnableDelayedExpansion
if [%online%]==[] SET pip_offline=--no-index --find-links "%WHEELS_TARGET%"
for %%R in (%requirements%) do (
	SET ext=%%~xR
	SET req=
	if [!ext!]==[.txt] SET req=-r
	python -m pip install --upgrade %pip_offline% !req! "%%R"
)

:finish
pause