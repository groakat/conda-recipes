if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform      
  	echo "Darwin"
    # g python 
    # cp -R /Volumes/Ramdisk/sw/ffmpeg/lib/ $PREFIX/lib;
    # cp -R /Volumes/Ramdisk/sw/ffmpeg/include $PREFIX/include;
    # taken from http://ffmpegmac.net/HowTo/

	# exit on error
	set -e


	# compiler
	# export CC=clang

	# shortcuts
	MES="/Users/peter/ffmpeg/packages"
	TARGET="/Volumes/Ramdisk/sw" 
	CMPL="/Volumes/Ramdisk/compile"
	FFMPEGTARGET=$PREFIX

	# setup target dirs
	# mkdir ${TARGET} 
	# mkdir ${CMPL}

	# add target to PATH
	export PATH=${TARGET}/bin:$PATH

	# compiler environment for ffmpeg 
	unset LDFLAGS CFLAGS MYFLAGS 
	export MYFLAGS="-L${TARGET}/lib -I${TARGET}/include -lstdc++" 
	export LDFLAGS="$MYFLAGS" 
	export CFLAGS="$MYFLAGS"

	# compiling FFmpeg
	cd ${CMPL} 
	tar xjpf ${MES}/ffmpeg-* 
	cd ffmpeg* 
	./configure --prefix=${FFMPEGTARGET} --enable-shared --enable-gpl --enable-pthreads --enable-version3 --enable-libspeex --enable-libvpx --disable-decoder=libvpx --enable-libmp3lame --enable-libtheora --enable-libvorbis --enable-libx264 --enable-avfilter --enable-libopencore_amrwb --enable-libopencore_amrnb --enable-filters --enable-libgsm --enable-libvidstab --enable-libx265 --arch=x86_64 --enable-runtime-cpudetect

	# change configure to ensure that relative paths are used in dylib files
	# sed -i.bak s/-fforce-addr//g configure
	sed -i.bak "s/-install_name,\$(SHLIBDIR)\/\$(SLIBNAME_WITH_MAJOR),/-install_name,@loader_path\/\$(SLIBNAME_WITH_MAJOR),/g" config.mak
	make -j 4 && make install
	#cp `find . -name '*.dylib'` /Users/peter/ffmpeg/sw/lib



elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
	echo "Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
	echo "Windows"
fi
