#!/bin/bash
docker run -it -v $PWD/..:/src abe-build bash -c 'cd /src; scons --win64'

mkdir abe.win
cp ../bin/abe.exe abe.win/
cp ../*.dll abe.win/
cp -r ../images abe.win/
cp -r ../maps abe.win/
cp -r ../savegame abe.win/
cp -r ../sounds abe.win/
cp ../AUTHORS abe.win/
cp ../Changelog abe.win/
cp ../INSTALL abe.win/
cp ../NEWS abe.win/
cp ../README abe.win/

zip abe.win.zip abe.win/*

rm -rf abe.win
