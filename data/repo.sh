#!/data/data/com.termux/files/usr/bin/sh
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
apt-get update
apt-get  --assume-yes upgrade 
apt-get  --assume-yes install coreutils gnupg2 wget dirmngr
# Make the sources.list.d directory
mkdir $PREFIX/etc/apt/sources.list.d
# Write the needed source file
echo "deb [trusted=yes] https://its-pointless.github.io/files/ termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
# Download signing key from https://its-pointless.github.io/pointless.gpg 
wget https://its-pointless.github.io/pointless.gpg
apt-key add pointless.gpg
wget https://Auxilus.github.io/auxilus.key
apt-key add auxilus.key
echo "deb https://termux.xeffyr.ml/ extra main x11\ndeb [trusted=yes,arch=all] https://Auxilus.github.io/ termux extras\ndeb https://termux.xeffyr.ml/ stable main" >> $PREFIX/etc/apt/sources.list
apt-key adv --keyserver pool.sks-keyservers.net --recv 9D6D488416B493F0
apt-key adv --keyserver pgp.mit.edu --recv 9B4E7D27395024EA5A4FC6395AAAC9E0A46BE53C
mkdir -p $PREFIX/etc/apt/sources.list.d
echo "deb https://grimler.se root stable" > $PREFIX/etc/apt/sources.list.d/termux-root.list
apt update
