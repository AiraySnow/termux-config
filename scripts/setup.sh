#!/data/data/com.termux/files/usr/bin/sh

echo "This script sets up the Termux App."

master_dir="$HOME/termux-config"

package_file="$master_dir/data/packages.txt"

mkdir -p "$HOME/tmp" "$HOME/bin"

packages="`busybox sed 's, -.*,,' "$package_file"`"

bash $master_dir/data/repo.sh
apt install -y $packages
cp -rp "$master_dir/data/HOME/." "$HOME"
rm -f "$HOME/.vimrc"
ln -s ".vim/.vimrc" "$HOME/.vimrc"
ccache -M 5G
rm *.key *.gpg
rm -rf $master_dir
exit $?

# EOF
