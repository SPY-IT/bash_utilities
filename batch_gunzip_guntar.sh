#!/bin/bash

# This script safely extracts all .tar.gz archives in the current directory.
# CAUTION EXTRACTS ALL .tar.gz files in the DIR, can LEAD TO PROBLEMS


if ! ls ./*.tar.gz &>/dev/null; then
    echo "No .tar.gz files found to extract."
    exit 0
fi

# Loop through each file ending with .tar.gz in the current dir
for archive in ./*.tar.gz; do
    
    if [ -f "$archive" ]; then
        echo "Extracting '$archive'..."
        # The -C flag is used to  ext into the same dir  
        # First, create a directory named after the archive (without .tar.gz).
        dir_name="${archive%.tar.gz}"
        mkdir -p "$dir_name"

        # Now extract the archive's contents into that new directory. [2]
        # The '&&' ensures the success message only shows if extraction succeeds.
        tar -xzf "$archive" -C "$dir_name" && echo "'$archive' extracted successfully to '$dir_name/'"
    fi
done
#currently makes a redundant dir for each extracted archive, 

# ==> this is done with the mkdir and -C system, to do: rework this in 2nd 
echo "Extraction process finished."

#shall be the "cursed" third twin :D 

