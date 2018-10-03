# Termux Configuration

Configuration of the Android [Termux](http://termux.com/) [App](https://play.google.com/store/apps/details?id=com.termux).

To get going, copy the following command and paste it in Termux:


```bash
apt update ; \
apt install -y git ; \
hash -r ; \
git clone --depth=1 https://github.com/AiraySnow/termux-config.git
bash -x termux-config/scripts/setup.sh
```

This is the [start.sh](scripts/start.sh) script.

This will download and run the [setup](scripts/setup.sh) file from the repo.
