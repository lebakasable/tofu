#!/usr/bin/env bash
set -xe
./build/boba src/boba.bb > bootstrap/boba.asm
./build.sh
