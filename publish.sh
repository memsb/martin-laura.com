#!/usr/bin/env bash

time aws s3 sync public s3://martin-laura.com --acl public-read
