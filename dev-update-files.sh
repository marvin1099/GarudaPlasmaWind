# Define source and destination directories
SOURCE_DIR="$HOME"
DEST_DIR="user"

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname "$SCRIPT")

# Create a list of all files in the destination directory and its subdirectories
cd "$DEST_DIR" || exit
find . -type f > /tmp/dest_files.txt

# Loop through each file in the source directory
cd "$SOURCE_DIR" || exit
for src_file in $(find ./ -type f); do
    # Check if the file exists in the destination list
    if grep -q "$src_file" /tmp/dest_files.txt; then
        # Copy the file to the destination directory
        Target=$(dirname "$src_file")
        cp "$SOURCE_DIR/$src_file" "$SCRIPTPATH/$DEST_DIR/$Target"
    fi
done

chmod -R 777 "$SCRIPTPATH/"*

# Clean up
rm /tmp/dest_files.txt
