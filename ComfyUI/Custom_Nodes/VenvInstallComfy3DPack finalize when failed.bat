@echo off
SETLOCAL
cd ComfyUI-3D-Pack
call ..\..\venv\scripts\activate
pip install --upgrade setuptools wheel
cd nvdiffrast
cd pytorch3d && pip install -e . 
call deactivate
ENDLOCAL
pause

