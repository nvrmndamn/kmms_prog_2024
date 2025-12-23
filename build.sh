#!/bin/bash

BUILD_TYPE="Ninja"
BUILD_SUFFIX="ninja"

BUILD_FOLDER="build_$BUILD_SUFFIX"
# Source directory relative to repository root (change if your sources are elsewhere)
SOURCE_FOLDER="modern_programming"
# If the configured source folder doesn't exist, fall back to repository root
if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Warning: source folder '$SOURCE_FOLDER' not found, trying '.' (repo root)"
    SOURCE_FOLDER="."
fi

if [ ! -d "$BUILD_FOLDER" ]; then
    mkdir "$BUILD_FOLDER"
fi

cd "$BUILD_FOLDER"

# Resolve source path relative to build folder
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

cd ..