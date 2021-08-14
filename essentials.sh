#!/bin/bash
xbps-install -Syu &&
xbps-install gcc make pkg-config git &&  # build essentialss
xbps-install vim nano htop atop &&  # utilities
