python setup.py build
python setup.py install
if errorlevel 1 exit 1

rd /s /q %SP_DIR%\__pycache__
if errorlevel 1 exit 1
