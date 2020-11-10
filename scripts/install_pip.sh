#! /bin/bash

# Install all the pip packages listed in piplist

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pip install -r $DIR/piplist

