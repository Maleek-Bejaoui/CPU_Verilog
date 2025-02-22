#!/bin/bash

for file in *.vhd; do
    if [ -f "$file" ]; then
        base_name="${file%.vhd}"  # Supprime l'extension .vhd
        ghdl synth --out=verilog "$file" > "$base_name.v"
        echo "Generated: $base_name.v"
    fi
done
