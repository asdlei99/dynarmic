#!/bin/sh

set -e
set -x

export CC=gcc-7
export CXX=g++-7
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

mkdir build && cd build
cmake .. -DBoost_INCLUDE_DIRS=${PWD}/../externals/ext-boost -DCMAKE_BUILD_TYPE=Release -G Ninja
ninja

./tests/dynarmic_tests --durations yes [a64]
