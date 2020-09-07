@echo Are you sure you want to download all the requirements? 
@echo Press Ctrl+C to abort
pause
set wheels=%~dp0\wheels\
if %1x==x (set requirements=requirements*.txt) else (set requirements=%*)
for %%r in (%requirements%) do python -m pip download -r %%r -d %wheels%