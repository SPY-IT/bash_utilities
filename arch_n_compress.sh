#!/bin/bash

# This script archives and compresses each subdirectory in the current path.

#ATTENTION logic explicitl requires to be placed in the directory the stuff
#is to be performed in... 

# Loop through all directories in the current location.
for dir in */; do
    # Check if it is a directory.
    if [ -d "$dir" ]; then
        # Remove the trailing slash from the directory name.
        # good practice i guess ? 
        dir_name=${dir%/}
        # Create the tar.gz file.
        echo "Processing $dir_name..."
        tar -cvf - "$dir_name" | gzip -9 > "${dir_name}.tar.gz"
        #obviously compression ratio can be set as desired... 
    fi
done

echo "All directories have been processed."
