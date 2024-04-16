#!/bin/bash

curl -o /dev/null -w '%{http_code}\n' --location 'https://localhost:8000/product'
