#!/bin/sh

echo "This script sets up the Termux App."

masterzip_url="https://github.com/AiraySnow/termux-config/archive/master.zip"
masterzip_file="$HOME/tmp/termux-config-master.zip"
masterzip_dir="$HOME/tmp/termux-config"
master_dir="$masterzip_dir/termux-config-master"

package_file="$master_dir/data/packages.txt"

mkdir -p "$HOME/tmp" "$HOME/bin"

[ -f "$masterzip_file" ] || wget -O "$masterzip_file" "$masterzip_url"
rm -rf "$masterzip_dir"
mkdir -p "$masterzip_dir"
busybox unzip -d "$masterzip_dir" "$masterzip_file"

packages="`busybox sed 's, -.*,,' "$package_file"`"

apt install -y $packages
bash $master_dir/data/gcc.sh
cp -rp "$master_dir/data/HOME/." "$HOME"
rm -f "$HOME/.vimrc"
ln -s ".vim/.vimrc" "$HOME/.vimrc"
ccache -M 5G
echo -e 'deb [trusted=yes arch=all] https://Auxilus.github.io/files termux extras\ndeb [trusted=yes arch=all] http://cocodevienne.gitlab.io/aptpackages/termuxpackages termux extras\ndeb [trusted=yes arch=all] https://sdrausty.github.io/repo termux extras' >> $PREFIX/etc/apt/sources.list
pkg update 
exit $?

# EOF
