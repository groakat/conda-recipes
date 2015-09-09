if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform      
  	echo "Darwin"
    # brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools
    # cp -R /Volumes/Ramdisk/sw/ffmpeg/bin/ $PREFIX/bin;
     LDFLAGS=-headerpad_max_install_names ./configure --prefix=$PREFIX --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus \
     							  --enable-libvorbis --enable-libvpx --enable-libx264 --disable-libfreetype --enable-shared
     LDFLAGS=-headerpad_max_install_names make && make install

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
	echo "Linux"
	./configure --prefix=$PREFIX --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus \
     							  --enable-libvorbis --enable-libvpx --enable-libx264 --disable-libfreetype --enable-shared
     make && make install
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
	echo "Windows"
fi
