#!/usr/bin/env bash
set -xe
./src/boba src/boba.bb --keep-assembly
mv src/boba.asm bootstrap/boba.asm
mv src/boba bin/boba
