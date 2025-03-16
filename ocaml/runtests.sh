#!/bin/bash

set -e

for path in `find . -maxdepth 1 -type d \( ! -name . \) ! -name '_*'`
do
  cd "$path"
  pwd && make
  cd ..
done
