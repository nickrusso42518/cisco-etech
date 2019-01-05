CTAN_PKGS=(
    longtable
    minted
    booktabs
	graphicx
	caption
	array
)

# texlive-latex-base includes:
# hyperref
# geometry
# fancyhdr
# url

# not sure if needed yet
# xcolor

echo setting up "tlmgr"
tlmgr init-usertree
tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final
# tlmgr update --self

echo packages to install: ${CTAN_PKGS[@]}
# tlmgr update --verify-repo=none ${CTAN_PKGS[@]}
tlmgr update ${CTAN_PKGS[@]}
