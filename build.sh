#!/usr/bin/env bash
set -xe
nasm -felf64 -o src/boba.o bootstrap/boba.asm
ld -o bin/boba src/boba.o
rm src/boba.o
