# @todo tool chain
# @todo post build stuff
# @todo address sanitizer
# @todo 3rd party library
# @todo different targets

cmake_minimum_required(VERSION 3.10)

project(LinuxTrader)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

add_library(utils STATIC
    src/parser.cpp
)

add_executable(unit_test
    unit_test/unit_test.cpp
    unit_test/parser_test.cpp
)

add_executable(benchmark
    benchmark/benchmark.cpp
    benchmark/parser_benchmark.cpp
)

target_link_libraries(unit_test PRIVATE utils)
target_link_libraries(benchmark PRIVATE utils)

