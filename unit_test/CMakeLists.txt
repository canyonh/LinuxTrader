cmake_minimum_required(VERSION 3.10)

find_package(GTest)

add_executable(unit_test
    unit_test.cpp
    parser_test.cpp
    bin_file_reader.cpp
)

target_link_libraries(unit_test PRIVATE GTest::GTest)
set_target_properties(unit_test PROPERTIES 
    RUNTIME_OUTPUT_DIRECTORY ${BIN_DIR}
)
