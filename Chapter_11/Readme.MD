How to Change the Default Port and Password Configurations and Install V2Ray VPN Server

Example Commands >>
```bash

cd Udemy_Your_Free_VPN_Server
cd v2ray
ls -anp

bash show_config.sh

echo "1.1.1.1" > dns1.conf

echo "4.2.2.4" > dns1.conf

echo "NEWPASSWORD" > shadowsocks_pass.conf

echo "4000" > shadowsocks_port.conf

echo "5000" > vmess_port.conf

bash show_config.sh

bash install.sh

cat v2ray_config_info.txt

sudo docker ps -a

top

sudo iftop

```

