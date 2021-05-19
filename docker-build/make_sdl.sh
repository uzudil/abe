#!/bin/bash

mkdir /cross-tools

# make sdl
cd /SDL-1.2-main
mkdir build-win64 && cd $_
 
# Set up some common variables
PREFIX=/cross-tools
TOOLSET=x86_64-w64-mingw32
# We make CC variable available to child processes
export CC="$TOOLSET-gcc -static-libgcc"
 
# Configure build
../configure --target=$TOOLSET --host=$TOOLSET \
    --build=x86_64-linux --prefix=$PREFIX/$TOOLSET
# building and installing
make
make install

# libogg 1.3.1
cd /tmp
mv /libogg-1.3.1.tar.gz .
tar xf libogg-1.3.1.tar.gz
cd libogg-1.3.1/
 
CROSSPATH=$PREFIX/$TOOLSET
./configure --target=$TOOLSET --host=$TOOLSET \
             --build=x86_64-linux --prefix=$CROSSPATH
 
# Make and install
make
make install

# libvorbis 1.3.2
cd /tmp
mv /libvorbis-1.3.2.tar.gz .
tar xf libvorbis-1.3.2.tar.gz
cd libvorbis-1.3.2/
 
export CFLAGS="-I${CROSSPATH}/include"
export LDFLAGS="-L${CROSSPATH}/lib"
./configure --target=$TOOLSET --host=$TOOLSET \
             --build=x86_64-linux --prefix=$CROSSPATH
 
# Make and install
make
make install

# sdl_mixer
cd /SDL_mixer-1.2.12
mkdir build-win64 && cd $_
 
# Set up some common variables
export CC="$TOOLSET-gcc -static-libgcc"
export PKG_CONFIG_PATH=${CROSSPATH}/lib/pkgconfig
export PATH=${CROSSPATH}/bin:$PATH
export CFLAGS="-I${CROSSPATH}/include"
export LDFLAGS="-L${CROSSPATH}/lib"
 
# Configure build (it should find ogg and vorbis)
cp /Makefile.in ../Makefile.in
../configure --target=$TOOLSET --host=$TOOLSET \
             --build=x86_64-linux --prefix=$CROSSPATH \
             --disable-music-mp3-smpeg
 
# Build and install
make
make install