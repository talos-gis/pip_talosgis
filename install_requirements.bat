@echo Are you sure you want to install all the requirements? 
@echo Press Ctrl+C to abort
pause
set wheels=%~dp0\wheels\
for %%r in (requirements.txt) do python -m pip install --no-index --find-links %wheels% -r %%r