# Download the newest version of TexLive installer
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

# Untar the file without the top level directory, since
# it has an obxiously variable name
tar -xzvf install-tl-unx.tar.gz --strip-components 1

# Perform the basic installation based on the premade profile
./install-tl -profile texlive.profile

# root needs its PATH updated for tlmgr to work
PATH=$PATH:/usr/local/texlive/2018/bin/x86_64-linux
tlmgr --version

# Note: Everything after "minted" is a dependency of it, not directly
# included by any tex source files in this project.
# tar --strip-components avoids the install-tl-(date) directory creation
tlmgr install booktabs caption chktex
tlmgr install minted fvextra etoolbox fancyvrb xcolor upquote
tlmgr install lineno ifplatform xstring framed float
