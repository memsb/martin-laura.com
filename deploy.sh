#!/usr/bin/env bash

time aws s3 rm s3://martin-laura.com --recursive
time aws s3 sync --exclude="assets/*" public s3://martin-laura.com --acl public-read --content-type "text/html"
time aws s3 sync --exclude="*" --include="assets/*" public s3://martin-laura.com --acl public-read