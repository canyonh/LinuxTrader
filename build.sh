#!/bin/bash -x
set -e

#BUILD_ROOT="build"
#BUILD_TYPE=${1-"Debug"}
#BUILD_DIR="${BUILD_ROOT}/${BUILD_TYPE}"
#mkdir -p ${BUILD_DIR}
#
#conan install . --build=missing -of ${BUILD_DIR}
#cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=on -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -S . -B ${BUILD_DIR}
#(cd ${BUILD_DIR} && make -j `nproc`)

# this works
BUILD_ROOT="build"
mkdir -p ${BUILD_ROOT}
REQUESTED_BUILD_TYPE=${1-"debug"}
echo req: $REQUESTED_BUILD_TYPE

CONAN_PROFILE_PREFIX="toolchain"

case $REQUESTED_BUILD_TYPE in
    debug)
        CMAKE_BUILD_TYPE="Debug"
        CMAKE_BUILD_DIR="Debug"
        CONAN_PROFILE_NAME="linux64_gcc12_debug.profile"
        ;;
    release)
        CMAKE_BUILD_TYPE="Release"
        CMAKE_BUILD_DIR="Release"
        CONAN_PROFILE_NAME="linux64_gcc12_release.profile"
        ;;
    *)
        echo "Invalid build type ${REQUESTED_BUILD_TYPE}"
        exit 1
        ;;
esac

CONAN_PROFILE_PATH="${CONAN_PROFILE_PREFIX}/${CONAN_PROFILE_NAME}"
echo "Build type: ${CMAKE_BUILD_TYPE}"

# switch to build directory and build
pushd .
cd ${BUILD_ROOT}

conan install .. --output-folder=${CMAKE_BUILD_TYPE} --build=missing --profile=../${CONAN_PROFILE_PATH}
(cd ${CMAKE_BUILD_TYPE} && cmake ../.. -DCMAKE_EXPORT_COMPILE_COMMANDS=on -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} && make -j`nproc`)
popd

ln -sf ${BUILD_ROOT}/${CMAKE_BUILD_TYPE}/compile_commands.json
