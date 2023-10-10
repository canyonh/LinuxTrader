cmake_minimum_required(VERSION 3.10)

find_package(benchmark)

add_executable(benchmark
    benchmark.cpp
    parser_benchmark.cpp
)

target_link_libraries(benchmark PRIVATE benchmark::benchmark)
