How to Install and Configure V2Ray VPN on VPS - Azure Cloud Example

Example for Linux Ubuntu 22.04 Server Installation

```bash

apt install sudo
sudo apt update -y
sudo apt install git -y

git clone https://github.com/nimaxnimax/Udemy_Your_Free_VPN_Server.git

cd Udemy_Your_Free_VPN_Server
cd v2ray
ls -anp

bash show_config.sh

cat install.sh

bash install.sh

cat zzz_v2ray_config_info.txt

sudo docker ps -a

top

sudo iftop

```

