#!/bin/sh

dir="$1"

if [ -z "$dir" ]; then
    echo "Usage: $0 directory"
    exit 1
fi

find "$dir" -type f -name "*.svg" | while read -r file; do
    echo "Processing: $file"
    # Make a backup
    cp "$file" "$file.bak"

    # Replace fill/stroke with currentColor
    sed -i \
        -e 's/fill="#[0-9A-Fa-f]\{3,6\}"/fill="currentColor"/g' \
        -e 's/stroke="#[0-9A-Fa-f]\{3,6\}"/stroke="currentColor"/g' \
        "$file"
done
