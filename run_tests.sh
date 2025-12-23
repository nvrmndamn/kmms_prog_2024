#!/bin/bash

BUILD_TYPE="Ninja"
BUILD_SUFFIX="ninja"

BUILD_FOLDER="build_$BUILD_SUFFIX"

SOURCE_FOLDER="modern_programming"

if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Warning: source folder '$SOURCE_FOLDER' not found, trying '.' (repo root)"
    SOURCE_FOLDER="."
fi

if [ ! -d "$BUILD_FOLDER" ]; then
    mkdir "$BUILD_FOLDER"
fi

cd "$BUILD_FOLDER"

SOURCE_PATH="../$SOURCE_FOLDER"
if [ ! -f "$SOURCE_PATH/CMakeLists.txt" ]; then
    echo "CMakeLists.txt not found in '$SOURCE_PATH'. Attempting repository root instead."
    SOURCE_PATH=".."
    if [ ! -f "$SOURCE_PATH/CMakeLists.txt" ]; then
        echo "Error: no CMakeLists.txt found in '$SOURCE_PATH' (repo root). Aborting."
        exit 1
    fi
fi

cmake -G "$BUILD_TYPE" "$SOURCE_PATH"
cmake --build .

ctest -V --output-on-failure

cd ..
