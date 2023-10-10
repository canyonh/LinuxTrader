cmake_minimum_required(VERSION 3.10)
project(LinuxTrader)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

set(BIN_DIR "${CMAKE_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}")
add_subdirectory(unit_test)
add_subdirectory(benchmark)

add_custom_target(copy_data_files
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_SOURCE_DIR}/data" "${BIN_DIR}/data"
    COMMMENT "Copying data files top ${BIN_DIR}/data"
)

add_dependencies(copy_data_files unit_test benchmark)

