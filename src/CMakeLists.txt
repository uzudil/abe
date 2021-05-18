cmake_minimum_required(VERSION 3.10)

# set the project name
project(abe)

find_package(SDL REQUIRED)
find_package(SDL_mixer)
include_directories(${SDL_INCLUDE_DIR})
include_directories(${SDL_MIXER_INCLUDE_DIR})

add_executable(abe Directories.c Editor.c Font.c Game.c Icons.c Image.c Main.c Map.c MapIO.c Menu.c Monster.c Sound.c Splash.c Trans.c Util.c)
target_link_libraries(abe ${SDL_LIBRARY})
target_link_libraries(abe ${SDL_MIXER_LIBRARY})
