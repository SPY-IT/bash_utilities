#!/bin/bash

# This script decrypts all (archive) files in a specified directory.

# Ask for the password securely.
echo -n "Enter the decryption  password: "
read -s password
echo

# Specify the directory with the files to be encrypted.

read -p "please specify a directory: " input_directory

# Check if the directory exists.
if [ ! -d "$input_directory" ]; then
    echo "Directory not found: $input_directory"
    exit 1
fi

# Loop through all files in specified dir
for file in "${INPUT_DIRECTORY}"*.dat; do
    # Check if it is a file.(tar ball is singular file of course)
    if [ -f "$file" ]; then
        echo "Decrypting $file..."
        # define the output file name.
        output_file="${file%.dat}.tar.gz"
        #ATTENTION Simon, this REQUIRES a preselection and verification!
        # done as of 23:18...   established in decryption version as well... 
      #encryption
        openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -salt -in "$file" -out "$output_file" -pass pass:"$password"
    fi
done

echo "All files have been decrypted!."
#this is basically the siamese twin of the encryption version ;D 
