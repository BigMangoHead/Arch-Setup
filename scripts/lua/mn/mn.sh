#!/bin/bash

DATA_LOC="/home/bigma/scripts/data"
SCRIPT_LOC="/home/bigma/scripts/lua/mn"

curdir=$PWD

cd "$SCRIPT_LOC"
lua mn.lua "$@"
if [[ $? != 0 ]]; then
    cd "$curdir"
    return 1
fi

MN_LOC="$(cat "$DATA_LOC"/mn-dir)"
MN_LATEX_LOC="$(cat "$DATA_LOC"/mn-latex-file-location)"

if [[ $1 = "make" ]]; then
    source make.sh
    cd "$SCRIPT_LOC"
    source startup.sh
elif [[ $1 = "open" ]]; then
    source open.sh
    cd "$SCRIPT_LOC"
    source startup.sh
elif [[ $1 = "latest" ]]; then
    source open.sh
    cd "$SCRIPT_LOC"
    source startup.sh
fi
