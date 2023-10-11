cmake_minimum_required(VERSION 3.10)
project(LinuxTrader)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

set(BIN_DIR "${CMAKE_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE}")
add_subdirectory(unit_test)
add_subdirectory(benchmark)

set(CMAKE_CXX_FLAGS_COMMON "-Wall -Wextra -Werror -fno-omit-frame-pointer")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXXLFLAGS_COMMON} ${CMAKE_CXX_FLAGS_DEBUG} -O0 -ggdb3")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_COMMON} ${CMAKE_CXX_FLAGS_RELEASE} -O3 -DNDEBUG -ggdb3")

# linking data used for unit test and bench mark
add_custom_target(copy_data_files
    COMMAND ${CMAKE_COMMAND} -E create_symlink "${CMAKE_SOURCE_DIR}/data" "${BIN_DIR}/data"
    COMMENT "Copying data files top ${BIN_DIR}/data"
)

add_dependencies(unit_test copy_data_files)
add_dependencies(benchmark copy_data_files)

