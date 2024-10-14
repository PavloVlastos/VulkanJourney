#!/bin/bash
if [ -d "build" ]; then
    echo "Build directory already exists."
else
    echo "Creating build directory."
    mkdir build
fi

cd build
cmake ..
make -j $(nproc)