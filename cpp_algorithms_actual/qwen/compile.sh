#!/bin/bash

# Compile all C++ files in the qwen directory
for file in *.cpp; do
    if [ -f "$file" ]; then
        g++ -o "${file%.cpp}" "$file" 2>&1 | tee "${file%.cpp}.compile.txt"
    fi
done

echo "Compilation complete."
