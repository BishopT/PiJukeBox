TARGETDIR=$1
BOARDDIR=board/bishopt/pijukebox

    
# Copy the rootfs additions
cp -af $BOARDDIR/rootfs-overlay/* $TARGETDIR/
