#!/bin/bash


BUILD_DIR="$HOME/Desktop/jungle-speed/jungleSpeed/build"


if [ ! -f "$BUILD_DIR/compile_commands.json" ]; then
    echo "Error: compile_commands.json not found in $BUILD_DIR"
    echo "Start: cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B $BUILD_DIR"
    exit 1
fi


run-clang-tidy -p "$BUILD_DIR" -header-filter=".*" \
    -checks='clang-diagnostic-,clang-analyzer-,modernize-use-auto,modernize-use-nullptr,modernize-use-noexcept,modernize-use-emplace,modernize-use-emplace-back,modernize-loop-convert,modernize-use-using' \
    -fix 2>&1 | tee clangTidy.txt

echo "Clang-Tidy finished"
