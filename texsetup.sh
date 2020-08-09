#!/bin/bash

# File:    texsetup.sh
# Version: GNU bash, version 3.2.57(1)
# Author:  Nicholas Russo (njrusmc@gmail.com)
# Purpose: Wrap many commands requiring sudo into a script to simplify
#          the CI config file and provide better commentary on what
#          needs to be done to get things working.

# The following packages are included with "texlive-basic" which is
# installed per the profile specified at installation.
# ae [56k]
# amscls [32k]
# amsfonts [3542k]
# amsmath [30k]
# babel [140k]
# babel-english [3k]
# babelbib [26k]
# bibtex [15k]
# bibtex.x86_64-linux [72k]
# carlisle [12k]
# cm [233k]
# collection-basic [1k]
# collection-latex [1k]
# colorprofiles [86k]
# colortbl [4k]
# dehyph [46k]
# dvipdfmx [27k]
# dvipdfmx.x86_64-linux [404k]
# dvips [34k]
# dvips.x86_64-linux [141k]
# enctex [24k]
# etex [12k]
# etex-pkg [6k]
# fancyhdr [4k]
# fix2col [3k]
# geometry [9k]
# glyphlist [25k]
# graphics [15k]
# graphics-cfg [2k]
# graphics-def [10k]
# gsftopk [4k]
# gsftopk.x86_64-linux [40k]
# hyperref [106k]
# hyph-utf8 [16k]
# hyphen-base [22k]
# ifluatex [3k]
# ifxetex [2k]
# knuth-lib [30k]
# knuth-local [23k]
# kpathsea [31k]
# kpathsea.x86_64-linux [47k]
# latex [154k]
# latex-bin [1k]
# latex-bin.x86_64-linux [1k]
# latex-fonts [18k]
# latexconfig [5k]
# ltxmisc [16k]
# lua-alt-getopt [2k]
# luatex [13k]
# luatex.x86_64-linux [7318k]
# makeindex [5k]
# makeindex.x86_64-linux [49k]
# metafont [33k]
# metafont.x86_64-linux [189k]
# mflogo [2k]
# mfnfss [3k]
# mfware [4k]
# mfware.x86_64-linux [120k]
# mptopdf [38k]
# mptopdf.x86_64-linux [1k]
# natbib [17k]
# oberdiek [222k]
# pdftex [37k]
# pdftex.x86_64-linux [795k]
# plain [60k]
# pslatex [6k]
# psnfss [12k]
# pspicture [2k]
# tetex [70k]
# tetex.x86_64-linux [1k]
# tex [1k]
# tex-ini-files [4k]
# tex.x86_64-linux [172k]
# texlive-common [1k]
# texlive-docindex [108k]
# texlive-en [1k]
# texlive-msg-translations [114k]
# texlive-scripts [3913k]
# texlive-scripts.x86_64-linux [1k]
# texlive.infra [209k]
# texlive.infra.x86_64-linux [146k]
# tools [40k]
# unicode-data [225k]
# updmap-map [202k]
# url [6k]
# xdvi [7k]
# xdvi.x86_64-linux [518k]

# Packages required above and beyond the ones include with "texlive-basic".
# Everything after "minted" is a dependency of it, not directly
# included by any tex source files in this project.
TL_PKGS=(
    booktabs
    caption
    chktex
    etoolbox
    fancyvrb
    float
    framed
    fvextra
    helvetic
    ifplatform
    lineno
    ltxcmds
    minted
    parskip
    upquote
    xcolor
    xstring
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
PATH=$PATH:/usr/local/texlive/2020/bin/x86_64-linux

# Quickly test to see if the PATH was properly updated
tlmgr --version

# Install all of the packages at once
tlmgr install ${TL_PKGS[@]}
