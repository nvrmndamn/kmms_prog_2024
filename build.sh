#!/bin/bash
rm -rf build_ninja
mkdir build_ninja
cd build_ninja
cmake -G Ninja ..
ninja
cd ..
