#!/usr/bin/env bash

# Purge bucket
time aws s3 rm s3://martin-laura.com --recursive

# List html files
declare -a arr=(public/*.html)

# rename to remove .html
for filename in "${arr[@]}"; do cp "$filename" "${filename%.html}"; done

# Upload pages
time aws s3 sync --exclude="assets/*" public s3://martin-laura.com --acl public-read --content-type "text/html"

# Upload assets
time aws s3 sync --exclude="*" --include="assets/*" public s3://martin-laura.com --acl public-read

# Rename to add .html
for filename in "${arr[@]}"; do mv  "${filename%.html}" "$filename"; done