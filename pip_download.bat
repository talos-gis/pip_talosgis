@set WHEELS_TARGET=%~dp0\wheels
@if %1x==x (set requirements=requirements\*.txt) else (set requirements=%*)

@echo Are you sure you want to download all the requirements in %requirements% to %WHEELS_TARGET%? 
@echo Press Ctrl+C to abort
pause

setlocal EnableDelayedExpansion
for %%R in (%requirements%) do (
	SET ext=%%~xR
	SET req=
	if [!ext!]==[.txt] SET req=-r
	python -m pip download !req! "%%R" -d "%WHEELS_TARGET%"
)
pause