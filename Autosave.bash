#!/bin/bash

git add "$(dirname "$(realpath "$0")")"
git commit -m "$(date -u +'%Y%m%dT%H%M%SZ')"
git push
