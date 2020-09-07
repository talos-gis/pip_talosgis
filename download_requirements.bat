@echo Are you sure you want to download all the requirements? 
@echo Press Ctrl+C to abort
set wheels=%~dp0\wheels\
for %%r in (requirements*.txt) do python -m pip download -r %%r -d %wheels%