@echo off
SETLOCAL
set PYTHON=venv\Scripts\python.exe
call venv\scripts\activate
%PYTHON% -m pip install --upgrade pip %*
call deactivate
ENDLOCAL
pause



