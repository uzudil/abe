import subprocess

#  General setup
##############################
sdl_prefix = subprocess.check_output(["sdl-config", "--prefix"]).decode("utf-8").strip()
sdl_libs = ['SDL', 'SDL_mixer', 'pthread', 'SDLmain']
# other_libs = ['m', 'dl', 'rt']
other_libs = []

#  Required output variables
##############################
targetSuffix = ''

base ='#/src'

libs = sdl_libs + other_libs

libpaths = [sdl_prefix + '/lib']

cppflags = ['-Dmain=SDL_main', '-D_REENTRANT']

sourcepaths = [base,
               sdl_prefix + '/include/SDL']

linkflags = ["-Wl,-framework,Cocoa"]
