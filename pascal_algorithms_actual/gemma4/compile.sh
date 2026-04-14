#!/bin/bash

# Compile all Pascal files in the gemma4 directory
for file in *.pas; do
    if [ -f "$file" ]; then
        # Compile with regular Free Pascal
        fpc -o"${file%.pas}" "$file" 2>&1 | tee "${file%.pas}.compile_regular.txt"
        
        # Compile with Delphi mode
        fpc -Mdelphi -o"${file%.pas}_delphi" "$file" 2>&1 | tee "${file%.pas}.compile_delphi.txt"
    fi
done

echo "Compilation complete."
