@set WHEELS_TARGET=%~dp0\wheels
@if %1x==x (set requirements=requirements*.txt) else (set requirements=%*)

@echo Are you sure you want to download all the requirements in %requirements% to %WHEELS_TARGET%? 
@echo Press Ctrl+C to abort
pause
for %%R in (%requirements%) do python -m pip download -r %%R -d %WHEELS_TARGET%