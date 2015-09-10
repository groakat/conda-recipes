./autogen.sh
# important: configure-params, otherwise make ends in errors 
./configure --disable-tls --enable-only64bit --build=amd64-darwin --prefix=$PREFIX;
make
make install  