@echo off
SETLOCAL
git clone https://github.com/MrForExample/ComfyUI-3D-Pack
cd ComfyUI-3D-Pack
call ..\..\venv\scripts\activate
pip install -r requirements.txt
pip install kiui torch_scatter
git clone https://github.com/NVlabs/nvdiffrast
cd nvdiffrast &&  pip install . 
set /p confirm="Are you sure you want to continue? (Y/N)"

if /i "%confirm%"=="Y" (
    echo Continuing...
git clone https://github.com/facebookresearch/pytorch3d.git 
pip install --upgrade setuptools wheel
cd pytorch3d && pip install -e . 
) else (
    echo Operation canceled.
)
call deactivate
ENDLOCAL
pause

