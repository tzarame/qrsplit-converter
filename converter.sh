#!/bin/bash

# replace_newlines.sh
# This script replaces all instances of \n with real line breaks in a specified input file.
# It creates input and output files automatically if they do not exist.
# After successful replacement, the input file is cleared.

# Input file
input_file="input.txt"

# Output file
output_file="output.txt"

# Check if input file exists; create it if it does not exist
if [ ! -f "$input_file" ]; then
    touch "$input_file"
    echo "The file $input_file has been created. Please populate it with content."
    exit 1
fi

# Check if output file exists; create it if it does not exist
if [ ! -f "$output_file" ]; then
    touch "$output_file"
fi

# Replace \n symbols with actual line breaks and save the result in the output file
awk '{gsub(/\\n/,"\n")}1' "$input_file" > "$output_file"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    # Clear the input file after successful replacement
    > "$input_file"
    echo "Replacement completed. The result has been saved in $output_file."
    echo "The file $input_file has been cleared."
else
    echo "An error occurred during the replacement process."
    exit 1
fi

# Usage:
# 1. Place the script in the desired directory.
# 2. Make the script executable with: chmod +x replace_newlines.sh
# 3. Run the script: ./replace_newlines.sh
# 4. If the input file does not exist, it will be created automatically.
# 5. After running the script, the input file will be cleared, and the output file will contain the processed content.