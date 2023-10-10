# @todo tool chain
# @todo post build stuff
# @todo address sanitizer
# @todo 3rd party library
# @todo different targets
cmake_minimum_required(VERSION 3.10)

project(LinuxTrader)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

add_subdirectory(unit_test)
add_subdirectory(benchmark)

