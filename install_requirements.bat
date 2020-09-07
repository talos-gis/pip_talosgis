@echo Are you sure you want to install all the requirements? 
@echo Press Ctrl+C to abort
pause
set wheels=%~dp0\wheels\
if %1x==x (set requirements=requirements.txt) else (set requirements=%*)
for %%r in (%requirements%) do python -m pip install --no-index --find-links %wheels% -r %%r