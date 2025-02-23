@echo off
SETLOCAL
git clone https://github.com/comfyanonymous/ComfyUI
cd comfyui

    (
    echo @echo off
    echo set PYTHON=venv\Scripts\python.exe
    echo set GIT=
    echo set VENV_DIR=.\venv
    echo %%PYTHON%% main.py --verbose %%*
) > Launch.bat

"%USERPROFILE%\AppData\Local\Programs\Python\Python312\python.exe" -m venv venv
call venv\scripts\activate
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124
pip install -r requirements.txt

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
call deactivate
cd..
cd..
:: Define the target file and shortcut location
set targetFile=%~dp0ComfyUI\Launch.bat
set shortcutLocation=%~dp0LaunchShortcut.lnk

:: Create a VBScript to generate the shortcut
echo Set WshShell = WScript.CreateObject("WScript.Shell") > "%temp%\CreateShortcut.vbs"
echo Set Shortcut = WshShell.CreateShortcut("%shortcutLocation%") >> "%temp%\CreateShortcut.vbs"
echo Shortcut.TargetPath = "%targetFile%" >> "%temp%\CreateShortcut.vbs"
echo Shortcut.WorkingDirectory = "%~dp0ComfyUI" >> "%temp%\CreateShortcut.vbs"
echo Shortcut.WindowStyle = 1 >> "%temp%\CreateShortcut.vbs"
echo Shortcut.Save >> "%temp%\CreateShortcut.vbs"

:: Run the VBScript
cscript //nologo "%temp%\CreateShortcut.vbs"

:: Clean up the temporary VBScript
del "%temp%\CreateShortcut.vbs"
ENDLOCAL
pause



