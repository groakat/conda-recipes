REM python setup.py build
python setup.py install
if errorlevel 1 exit 1

REM rd /s /q %SP_DIR%\__pycache__
REM if errorlevel 1 exit 1
