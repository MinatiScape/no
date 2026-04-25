#!/bin/bash
# Check if a file argument is provided
if [[ "$#" == '0' ]]; then
    echo -e 'ERROR: No File Specified!' && exit 1
fi

FILE="$1"

# Upload directly to the new unified endpoint (no server selection needed)
RESPONSE=$(curl -# -F "file=@$FILE" "https://upload.gofile.io/uploadfile")

# Parse the download page link from response
LINK=$(echo "$RESPONSE" | jq -r '.data.downloadPage')

echo "$LINK"
echo
