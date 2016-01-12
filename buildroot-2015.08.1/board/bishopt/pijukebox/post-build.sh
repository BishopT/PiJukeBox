TARGETDIR=$1
BOARDDIR=board/bishopt/pijukebox

    
# Copy the rootfs additions
cp -a $BOARDDIR/rootfs-overlay/* $TARGETDIR/
