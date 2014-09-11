if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform      
  	echo "Darwin"
    # brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools
    cp -R /usr/local/Cellar/ffmpeg/2.3.3/bin/ $PREFIX/bin;
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
	echo "Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
	echo "Windows"
fi
