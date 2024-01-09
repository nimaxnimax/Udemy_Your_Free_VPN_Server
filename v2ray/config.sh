#!/bin/bash

# File path for the configuration file
config_file="dns1.conf"

# Function to validate if the input is a valid IP address
validate_ip() {
    local ip=$1
    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        return 0 # Valid IP address
    else
        return 1 # Invalid IP address
    fi
}

# Read current DNS from the configuration file
current_dns=$(head -n 1 "$config_file" 2>/dev/null)

# Prompt the user for a new DNS or use default (8.8.8.8)
read -p "Enter a new primary DNS server (default: 8.8.8.8): " user_dns

# Use default DNS if user input is empty
user_dns=${user_dns:-"8.8.8.8"}

# Validate user input for IP address format
if validate_ip "$user_dns"; then
    # Update the configuration file with the new DNS
    echo "$user_dns" > "$config_file"
    echo "Primary DNS server updated to: $user_dns"
else
    echo "Invalid IP address format. Using default DNS: $user_dns"
fi

# File path for the configuration file
config_file="dns2.conf"

# Function to validate if the input is a valid IP address
validate_ip() {
    local ip=$1
    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        return 0 # Valid IP address
    else
        return 1 # Invalid IP address
    fi
}

# Read current DNS from the configuration file
current_dns=$(head -n 1 "$config_file" 2>/dev/null)

# Use default DNS if the file is empty or not found
if [ -z "$current_dns" ]; then
    current_dns="8.8.4.4"
fi

# Prompt the user for a new DNS or use default (8.8.4.4)
read -p "Enter a new secondary DNS server (default: $current_dns): " user_dns

# Use default DNS if user input is empty
user_dns=${user_dns:-"$current_dns"}

# Validate user input for IP address format
if validate_ip "$user_dns"; then
    # Update the configuration file with the new DNS
    echo "$user_dns" > "$config_file"
    echo "Secondary DNS server updated to: $user_dns"
else
    echo "Invalid IP address format. Using default DNS: $current_dns"
fi

# File path for the Shadowsocks password configuration file
config_file="shadowsocks_pass.conf"

# Function to validate if the input is a valid password
validate_password() {
    local password=$1
    # Customize your password format validation logic here
    # In this example, a password must be at least 4 characters long
    if [ ${#password} -ge 4 ]; then
        return 0 # Valid password
    else
        return 1 # Invalid password
    fi
}

# Read the current Shadowsocks password from the configuration file
current_password=$(head -n 1 "$config_file" 2>/dev/null)

# Use default password if the file is empty or not found
if [ -z "$current_password" ]; then
    current_password="FR33DoM"
fi

# Prompt the user for a new password or use default ("FR33DoM")
read -p "Enter a new Shadowsocks password (default: $current_password): " user_password

# Use default password if user input is empty
user_password=${user_password:-"$current_password"}

# Validate user input for password format
if validate_password "$user_password"; then
    # Update the configuration file with the new password
    echo "$user_password" > "$config_file"
    echo "Shadowsocks password updated to: $user_password"
else
    echo "Invalid password format. Using default password: $current_password"
fi

# File path for the Shadowsocks port configuration file
config_file="shadowsocks_port.conf"

# Function to validate if the input is a valid port number
validate_port() {
    local port=$1
    local valid_range="2-65534"
    local invalid_ports="22,1320,1010,1110"

    if [[ ! "$port" =~ ^[0-9]+$ ]]; then
        return 1 # Invalid port format
    fi

    if [ "$port" -ge 2 ] && [ "$port" -le 65534 ] && [[ ! "$invalid_ports" =~ (^|,)$port($|,) ]]; then
        return 0 # Valid port number
    else
        return 1 # Invalid port number
    fi
}

# Read the current Shadowsocks port from the configuration file
current_port=$(head -n 1 "$config_file" 2>/dev/null)

# Use default port if the file is empty or not found
if [ -z "$current_port" ]; then
    current_port=80
fi

# Prompt the user for a new port or use default (80)
read -p "Enter a new Shadowsocks port (default: $current_port): " user_port

# Use default port if user input is empty
user_port=${user_port:-"$current_port"}

# Validate user input for port number format
if validate_port "$user_port"; then
    # Update the configuration file with the new port
    echo "$user_port" > "$config_file"
    echo "Shadowsocks port updated to: $user_port"
else
    echo "Invalid port number format. Using default port: $current_port"
fi

# File path for the vmess port configuration file
config_file="vmess_port.conf"

# Function to validate if the input is a valid port number
validate_port() {
    local port=$1
    local valid_range="2-65534"
    local invalid_ports="22,1320,1010,1110"

    if [[ ! "$port" =~ ^[0-9]+$ ]]; then
        return 1 # Invalid port format
    fi

    if [ "$port" -ge 2 ] && [ "$port" -le 65534 ] && [[ ! "$invalid_ports" =~ (^|,)$port($|,) ]]; then
        return 0 # Valid port number
    else
        return 1 # Invalid port number
    fi
}

# Read the current vmess port from the configuration file
current_port=$(head -n 1 "$config_file" 2>/dev/null)

# Use default port if the file is empty or not found
if [ -z "$current_port" ]; then
    current_port=443
fi

# Prompt the user for a new port or use default (443)
read -p "Enter a new vmess port (default: $current_port): " user_port

# Use default port if user input is empty
user_port=${user_port:-"$current_port"}

# Validate user input for port number format
if validate_port "$user_port"; then
    # Update the configuration file with the new port
    echo "$user_port" > "$config_file"
    echo "vmess port updated to: $user_port"
else
    echo "Invalid port number format. Using default port: $current_port"
fi

bash show_config.sh
