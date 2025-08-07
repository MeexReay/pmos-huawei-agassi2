#!/bin/sh

ln -s $PWD/packages/* $(pmbootstrap config | sed -n 's/^aports = //p')/device/testing
