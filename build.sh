#!/usr/bin/env bash
set -xe
mkdir -p build
nasm -felf64 -o build/boba.o bootstrap/boba.asm
ld -o build/boba build/boba.o
