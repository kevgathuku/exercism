#!/bin/bash

set -e

for path in `find . -maxdepth 1 -type d \( ! -name . \)`
do
  cd "$path"
  pwd && make test
  cd ..
done
