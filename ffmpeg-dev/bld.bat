
REM mkdir %SCRIPTS%
REM copy 7za.exe %SCRIPTS%
REM copy 7-zip.chm %SCRIPTS%

REM dir %SRC_DIR%

7za x %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev.7z -o%SRC_DIR%
mkdir %LIBRARY_INC%\libavcodec
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libavcodec %LIBRARY_INC%\libavcodec
mkdir %LIBRARY_INC%\libavdevice
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libavdevice %LIBRARY_INC%\libavdevice
mkdir %LIBRARY_INC%\libavfilter
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libavfilter %LIBRARY_INC%\libavfilter
mkdir %LIBRARY_INC%\libavformat
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libavformat %LIBRARY_INC%\libavformat
mkdir %LIBRARY_INC%\libavutil
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libavutil %LIBRARY_INC%\libavutil
mkdir %LIBRARY_INC%\libpostproc
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libpostproc %LIBRARY_INC%\libpostproc
mkdir %LIBRARY_INC%\libswresample
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libswresample %LIBRARY_INC%\libswresample
mkdir %LIBRARY_INC%\libswscale
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\include\libswscale %LIBRARY_INC%\libswscale

mkdir %LIBRARY_LIB%
copy %SRC_DIR%\ffmpeg-20140827-git-8c1b942-win64-dev\lib %LIBRARY_LIB%


rem vim:set ts=8 sw=4 sts=4 tw=78 et:
