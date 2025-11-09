#!/bin/bash

# Directory where the KDL files are located
NIRI_DIR="$HOME/.config/niri/"
CONFIG_DIR="$HOME/.config/niri/configs/"

# Output file name
# OUTPUT_FILE="$NIRI_DIR/config.kdl"
OUTPUT_FILE="$NIRI_DIR/config.kdl"

# Create or clear the output file
echo "" >"$OUTPUT_FILE"

# Iterate over all the KDL files in the configs directory
for file in "$CONFIG_DIR"/*.kdl; do
  # If the file exists and its name doesn't match the output file
  if [[ -f "$file" && "$file" != "$OUTPUT_FILE" ]]; then
    echo -e "// From: ${file##*/}\n" >>"$OUTPUT_FILE" # Comment the file name header
    cat "$file" >>"$OUTPUT_FILE"                      # Append the content
    echo -e "\n" >>"$OUTPUT_FILE"                     # Add a newline to separate files
  fi
done
