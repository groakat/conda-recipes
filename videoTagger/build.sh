#!/bin/bash
$PYTHON setup.py install

cp $SRC_DIR/pyTools/install/osx/videotagger  $PREFIX/bin

chmod +x $PREFIX/bin/videotagger