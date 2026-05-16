cmake_minimum_required(VERSION 4.2.3)
project(HELLO_SDL)

find_package(SDL2 REQUIRED)
find_package(SDL2_image REQUIRED)
set(CMAKE_C_STANDARD 99)

add_executable(Main)
target_sources(
    Main
    PRIVATE
        main.c
    )
target_link_libraries(
    Main
    PRIVATE
        SDL2::SDL2
        SDL2_image::SDL2_image
    )
