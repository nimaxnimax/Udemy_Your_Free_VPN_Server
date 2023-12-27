sleeptime=0
echo "Started!"
sleep $sleeptime
# apt install sudo -y
sudo apt update -y
sudo apt install iftop mtr -y
sleep $sleeptime
sudo fallocate -l 4G /swapfile
ls -anp /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sleep $sleeptime
sudo apt update -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
python3 --version
sleep $sleeptime
sudo apt update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
if [ ! -e "/usr/share/keyrings/docker-archive-keyring.gpg" ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
fi
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo apt install docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker rm -f $(sudo docker ps -q)
sleep $sleeptime
sudo bash zconfig.sh
cd utils
sudo bash bbr.sh
sleep $sleeptime
cd ..
cd v2ray-upstream-server
sudo bash start.sh
sleep $sleeptime
cd ..
cd v2ray-bridge-server
sudo bash ipconfig.sh
sleep $sleeptime
sudo bash start.sh
sleep $sleeptime
sudo bash info.sh > zzz_v2ray_config_info.txt
cd ..
mv v2ray-bridge-server/zzz_v2ray_config_info.txt .
cat zzz_v2ray_config_info.txt
echo "Done!"

