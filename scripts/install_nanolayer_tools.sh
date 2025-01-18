#!/bin/bash

# Read the map of tools from the environment variable
IFS=' ' read -r -a tools_array <<< "$TOOLS"

# Iterate over the array and run the nanolayer command
for tool in "${tools_array[@]}"; do
    IFS=':' read -r repo binary <<< "$tool"
    nanolayer install gh-release "$repo" "$binary"
done