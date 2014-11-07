#!/bin/bash

CORES=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu || 1)
if [ `uname` == Darwin ]; then
    SO_EXT='dylib'
else
    SO_EXT='so'
fi


# GDCM do not support build in the same level than the SRC

# Create a folder in root folder
mkdir ${SRC_DIR}/../gdcm
# Move all files from the SRC_DIR to the previously created folder
mv ${SRC_DIR}/* ${SRC_DIR}/../gdcm
# Move the whole folder into gdcm
mv ${SRC_DIR}/../gdcm/ ${SRC_DIR}
# Redefine the SRC_DIR
SRC_DIR=${SRC_DIR}/gdcm


BUILD_DIR=${SRC_DIR}/../gdcmbin
mkdir ${BUILD_DIR}
cd ${BUILD_DIR}

echo $BUILD_DIR
echo $SRC_DIR

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -D GDCM_BUILD_SHARED_LIBS:BOOL=ON -D GDCM_WRAP_PYTHON:BOOL=ON -D GDCM_WRAP_CSHARP:BOOL=OFF -D GDCM_WRAP_JAVA:BOOL=OFF -D GDCM_WRAP_PHP:BOOL=OFF -D GDCM_USE_VTK:BOOL=OFF -D GDCM_BUILD_APPLICATIONS:BOOL=OFF -D GDCM_BUILD_TESTING:BOOL=ON -D GDCM_DOCUMENTATION:BOOL=OFF -D GDCM_BUILD_EXAMPLES:BOOL=OFF -D "PYTHON_EXECUTABLE:FILEPATH=${PYTHON}" -D "PYTHON_INCLUDE_PATH:PATH=$PREFIX/include/python${PY_VER}" -D "PYTHON_LIBRARY:FILEPATH=$PREFIX/lib/libpython${PY_VER}.${SO_EXT}" $SRC_DIR
    #-D CMAKE_OSX_DEPLOYMENT_TARGET:STRING=${MACOSX_DEPLOYMENT_TARGET} \
    #-D "CMAKE_CXX_FLAGS:STRING=-fvisibility=hidden -fvisibility-inlines-hidden ${CFLAGS}" \
    #-D "CMAKE_C_FLAGS:STRING=-fvisibility=hidden ${CXXFLAGS}" \

make -j ${CORES}
make install

