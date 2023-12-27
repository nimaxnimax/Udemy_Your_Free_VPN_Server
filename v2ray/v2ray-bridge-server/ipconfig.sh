interfaces=$(ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}')
interfacename=""
for interface in $interfaces; do
    if [[ $interface == ens* ]] || [[ $interface == eth* ]]; then
        interfacename="$interface"
    fi
done
interfacename=$(echo $interfacename | sed 's/ *$//')
echo $interfacename
ip_address=$(ip -4 addr show $interfacename | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)
echo "$ip_address"
cat v2ray/config/config.json | grep address
sed -i "s/<UPSTREAM-IP>/$ip_address/g" v2ray/config/config.json
cat v2ray/config/config.json | grep address
echo "IP Address Changed - Done!"

