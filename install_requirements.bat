@set WHEELS_TARGET=%~dp0\wheels
@if %1x==x (set requirements=requirements.txt) else (set requirements=%*)

@echo Are you sure you want to install all the requirements in %requirements% from %WHEELS_TARGET%? 
@echo Press Ctrl+C to abort
pause
if [%online%]==[] SET pip_offline=--upgrade --no-index --find-links %WHEELS_TARGET%
for %%R in (%requirements%) do python -m pip install %pip_offline% -r %%R