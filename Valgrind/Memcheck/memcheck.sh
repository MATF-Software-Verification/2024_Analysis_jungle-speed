#!/usr/bin/bash

set -xe

valgrind --show-leak-kinds=all --leak-check=full --track-origins=yes --log-file="jungleSpeed.txt" ~/Desktop/jungle-speed/jungleSpeed/src/server/build/server

echo "memcheck finished"
