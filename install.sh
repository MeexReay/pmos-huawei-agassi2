#!/bin/sh

ln -s $PWD/packages/* $(pmbootstrap config | sed -n 's/^aports = //p')/device/testing 2>/dev/null || echo "already installed"
