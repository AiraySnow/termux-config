apt update ; \
apt install -y wget ; \
hash -r ; \
wget -qO- https://github.com/AiraySnow/termux-config/raw/master/scripts/setup.sh | bash -x
