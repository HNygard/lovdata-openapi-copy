#!/bin/bash

set -e

curl -s 'https://api.lovdata.no/swagger/api.json' | jq '.' > lovdata-openapi-spec.json
curl -s 'https://api.lovdata.no/v1/publicData/list' | jq '.' > lovdata-public-data-list.json

# [
#   {
#     "filename": "gjeldende-lover.tar.bz2",
#     "description": "Gjeldende lover, ajourført med endringer",
#     "sizeBytes": "5769192",
#     "lastModified": "2025-11-08T02:31:59.418Z"
#   },
#   (... more items ...)
# ]

jq -r '.[].filename' lovdata-public-data-list.json | while read -r filename; do
    filename_without_extension="${filename%.tar.bz2}"
    url="https://api.lovdata.no/v1/publicData/get/$filename"
    echo "Downloading $url"
    wget "$url" -P cache/

    echo "Extracting $filename_without_extension"
    rm -rf data/$filename_without_extension
    mkdir -p data/$filename_without_extension
    tar -xjf "cache/$filename" -C data/$filename_without_extension

done

echo "Formatting XML files"

# Loop through every .xml file under data/ and subfolders
for file in $(find data -type f -name "*.xml"); do
  echo "Formatting: $file"
  xmllint --format --output "$file" "$file"
done

echo "Done."