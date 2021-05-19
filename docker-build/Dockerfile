from ubuntu:18.04

COPY main.zip /main.zip
COPY SDL_mixer-1.2.12.zip /SDL_mixer-1.2.12.zip
COPY libogg-1.3.1.tar.gz /libogg-1.3.1.tar.gz
COPY libvorbis-1.3.2.tar.gz /libvorbis-1.3.2.tar.gz
COPY sdl_mixer_makefile.in /Makefile.in

RUN apt-get update
RUN apt-get -y install g++-mingw-w64 mingw-w64-tools mingw-w64-x86-64-dev git vim wget scons unzip
RUN unzip main.zip
RUN unzip SDL_mixer-1.2.12.zip

COPY make_sdl.sh /make_sdl.sh
RUN bash /make_sdl.sh
