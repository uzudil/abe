
#  General setup
##############################
cross_prefix = "/cross-tools/x86_64-w64-mingw32"
sdl_libs = ['mingw32', 'SDLmain', 'SDL_mixer', 'SDL']

 # vorbisfile, vorbis, and ogg, are required by SDL_mixer
other_libs = ['vorbisfile', 'vorbis', 'ogg',
              'm', 'dinput8', 'dxguid', 'dxerr8', 'user32',
              'gdi32', 'winmm', 'imm32', 'ole32', 'oleaut32',
              'shell32', 'version', 'uuid']


#  Required output variables
##############################
targetSuffix = '.exe'

base ='#/src'

libs = sdl_libs + other_libs

libpaths = ['#/lib/',
            cross_prefix + '/lib']

cppflags = ['-Dmain=SDL_main']

sourcepaths = [base,
               cross_prefix + '/include/SDL']

linkflags = ['--static',
             '-Wl,--no-undefined',
             '-static-libgcc',
             '-static-libstdc++']

