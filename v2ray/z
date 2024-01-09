cp v2ray-upstream-server/v2ray/config/config.json.default v2ray-upstream-server/v2ray/config/config.json
cp v2ray-bridge-server/v2ray/config/config.json.default v2ray-bridge-server/v2ray/config/config.json
cp v2ray-bridge-server/docker-compose.yml.default v2ray-bridge-server/docker-compose.yml

port_number=$(head -n 1 shadowsocks_port.conf)
if [ "$port_number" -ge 1 ] && [ "$port_number" -le 65535 ]; then
    sed -i "s/\"port\": 80/\"port\": $port_number/" v2ray-bridge-server/v2ray/config/config.json
    echo "shadowsocks_port updated in config.json"
else
    echo "Invalid shadowsocks_port: $port_number. It must be between 1 and 65535."
fi
sed -i "s/80:80/$port_number:$port_number/" v2ray-bridge-server/docker-compose.yml
echo "shadowsocks_port mapping updated in docker-compose.yml"

port_number=$(head -n 1 vmess_port.conf)
if [ "$port_number" -ge 1 ] && [ "$port_number" -le 65535 ]; then
    sed -i "s/\"port\": 443/\"port\": $port_number/" v2ray-bridge-server/v2ray/config/config.json
    echo "vmess_port number updated in config.json"
else
    echo "Invalid vmess_port: $port_number. It must be between 1 and 65535."
fi
sed -i "s/443:443/$port_number:$port_number/" v2ray-bridge-server/docker-compose.yml
echo "vmess_port mapping updated in docker-compose.yml"

new_password=$(head -n 1 shadowsocks_pass.conf)
escaped_password=$(echo "$new_password" | sed 's/[\/&]/\\&/g')
sed -i "s/\"password\": \"FR33DoM\"/\"password\": \"$escaped_password\"/" v2ray-bridge-server/v2ray/config/config.json
echo "shadowsocks_pass updated in config.json"

dns_ip=$(head -n 1 dns1.conf)
if [[ $dns_ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    escaped_dns_ip=$(echo "$dns_ip" | sed 's/[\/&]/\\&/g')
    sed -i "s/\"8.8.8.8\"/\"$escaped_dns_ip\"/" v2ray-upstream-server/v2ray/config/config.json
    sed -i "s/\"8.8.8.8\"/\"$escaped_dns_ip\"/" v2ray-bridge-server/v2ray/config/config.json
    echo "dns1 address updated in config.json"
else
    echo "Invalid dns1 address format: $dns_ip"
fi

dns_ip=$(head -n 1 dns2.conf)
if [[ $dns_ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    escaped_dns_ip=$(echo "$dns_ip" | sed 's/[\/&]/\\&/g')
    sed -i "s/\"8.8.4.4\"/\"$escaped_dns_ip\"/" v2ray-upstream-server/v2ray/config/config.json
    sed -i "s/\"8.8.4.4\"/\"$escaped_dns_ip\"/" v2ray-bridge-server/v2ray/config/config.json
    echo "dns2 address updated in config.json"
else
    echo "Invalid dns2 address format: $dns_ip"
fi

