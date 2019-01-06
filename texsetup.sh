#!/bin/bash

# File:    texsetup.sh
# Version: GNU bash, version 3.2.57(1)
# Author:  Nicholas Russo (njrusmc@gmail.com)
# Purpose: Wrap many commands requiring sudo into a script to simplify
#          the CI config file and provide better commentary on what
#          needs to be done to get things working.

# Packages required above and beyond the ones include with "texlive-basic".
# Everything after "minted" is a dependency of it, not directly
# included by any tex source files in this project.
TL_PKGS=(
    booktabs
    caption
    chktex
    minted
    fvextra
    etoolbox
    fancyvrb
    xcolor
    upquote
    lineno
    ifplatform
    xstring
    framed
    float
)

# Download the newest version of TexLive installer for Linux
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

# Untar the file without the top level directory, since
# it has an variable name, such as "install-tl-20190105/" and
# "--strip-components" avoids the  directory creation entirely
tar -xzvf install-tl-unx.tar.gz --strip-components 1

# Perform the basic installation based on the premade profile
./install-tl -profile texlive.profile

# root needs its PATH updated for tlmgr to work
PATH=$PATH:/usr/local/texlive/2018/bin/x86_64-linux

# Quickly test to see if the PATH was properly updated
tlmgr --version

# Install all of the packages at once
tlmgr install ${TL_PKGS[@]}
