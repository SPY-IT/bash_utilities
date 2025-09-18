#!/bin/bash

# This script encrypts all (archive) files in a specified directory.

# Ask for the password securely.
echo -n "Enter the encryption password: "
read -s password
echo

# Specify the directory with the files to be encrypted.

read -p "please specify a directory" input_directory

# Check if the directory exists.
if [ ! -d "$input_directory" ]; then
    echo "Directory not found: $input_directory"
    exit 1
fi

# Loop through all files in specified dir
for file in "${INPUT_DIRECTORY}"*.tar.gz; do
    # Check if it is a file (refers to tar ball).
    if [ -f "$file" ]; then
        echo "Encrypting $file..."
        # define the output file name.
        output_file="${file%.tar.gz}.dat"
        #ATTENTION, this REQUIRES a preselection and verification!
        # done as of 23:18...   
      #encryption
        openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -salt -in "$file" -out "$output_file" -pass pass:"$password"
        #this might be subject to change when new conventions in symmetric crypthography are introduced...
    fi
done

echo "All files have been encrypted."
# decryption script also available in repo...