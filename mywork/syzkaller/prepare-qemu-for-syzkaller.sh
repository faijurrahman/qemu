#!/bin/bash

#-----------------------------------------------------------------------
# Setup Source Code
#-----------------------------------------------------------------------
git clone https://github.com/qemu/qemu
cd qemu

#git remote add origin https://github.com/qemu/qemu
#git branch --set-upstream-to=origin/master master

git branch -vv
git remote -vv

git remote add upstream https://gitlab.com/qemu-project/qemu.git
git remote add dev git@github.com:faijurrahman/qemu.git

git branch -vv
git remote -vv


#-----------------------------------------------------------------------
# Build Qemu for Syzkaller
#-----------------------------------------------------------------------
sudo apt update
sudo apt install -y libslirp-dev


./configure --target-list=aarch64-softmmu --enable-slirp
make -j$(nproc)
./build/qemu-system-aarch64 --version
