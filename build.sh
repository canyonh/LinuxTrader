#!/bin/bash -x
BUILD_ROOT="build"
BUILD_TYPE=${1-"Debug"}
BUILD_DIR="${BUILD_ROOT}/${BUILD_TYPE}"
mkdir -p ${BUILD_DIR}

conan install . --build=missing -of ${BUILD_DIR}
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=on -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -S . -B ${BUILD_DIR}
(cd ${BUILD_DIR} && make -j `nproc`)
