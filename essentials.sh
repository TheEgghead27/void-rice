#!/bin/bash
xbps-install -Syu &&
xbps-install gcc make pkg-config git -y &&  # build essentialss
xbps-install vim tree pavucontrol nano htop curl atop -y  # utilities
