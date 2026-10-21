#!/usr/bin/env bash

usermod -a -G dialout vscode

sudo -u vscode pip3 install --break-system-packages esphome=="${VERSION}"
