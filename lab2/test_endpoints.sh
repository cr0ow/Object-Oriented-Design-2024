#!/bin/bash

file="test_results"
id=11

curl -o /dev/null -w '%{http_code}\n' --location 'https://localhost:8000/product' >> $file
curl -o /dev/null -w '%{http_code}\n' --location 'https://localhost:8000/product/new' >> $file
curl -o /dev/null -w '%{http_code}\n' --location 'https://localhost:8000/product/new' --data '{"name": "test","categoryId": 1}' >> $file
curl -o /dev/null -w '%{http_code}\n' --location "https://localhost:8000/product/$id" >> $file
curl -o /dev/null -w '%{http_code}\n' --location "https://localhost:8000/product/$id/edit" >> $file
curl -o /dev/null -w '%{http_code}\n' --location "https://localhost:8000/product/$id/edit" --data '{"name": "edited","categoryId": 2}' >> $file

while IFS= read -r code; do
    if [ "$code" != "200" ]; then
        echo "Error: \"$code\" != '200'"
        rm -rf $file
        exit 1
    fi
done < "$file"

echo "Success"
rm -rf $file