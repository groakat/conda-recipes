
REM mkdir %SCRIPTS%
REM copy 7za.exe %SCRIPTS%
REM copy 7-zip.chm %SCRIPTS%

REM dir %SRC_DIR%

REM 7za x %SRC_DIR%\ffmpeg-20140827-git-9e8ab36-win64-shared.7z -o%SRC_DIR%

mkdir %SCRIPTS%
copy %SRC_DIR%\bin %SCRIPTS%
copy %SRC_DIR%\ff-prompt.bat %SCRIPTS%


rem vim:set ts=8 sw=4 sts=4 tw=78 et:
