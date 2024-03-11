#!/bin/bash

# 1. Print the home directory
echo "1. Home directory: $HOME"

# 2. List all usernames from the passwd file
echo "2. List of usernames:"
awk -F: '{print $1}' /etc/passwd

# 3. Count the number of users
echo "3. Number of users: $(awk -F: 'END {print NR}' /etc/passwd)"

# 4. Find the home directory of a specific user
read -p "4. Enter username to find home directory: " username
home_dir=$(awk -v u="$username" -F: '$1 == u {print $6}' /etc/passwd)
echo "   Home directory of $username: $home_dir"

# 5. List users with specific UID range (e.g. 1000-1010)
echo "5. List of users with UID range 1000-1010:"
awk -F: '$3 >= 1000 && $3 <= 1010 {print $1}' /etc/passwd

# 6. Find users with standard shells like /bin/bash or /bin/sh
echo "6. Users with standard shells (/bin/bash or /bin/sh):"
awk -F: '$NF ~ /\/bin\/(bash|sh)$/ {print $1}' /etc/passwd

# 7. Replace "/" character with "\" character in /etc/passwd and redirect the content to a new file
echo "7. Replacing \"/\" character with \"\\\" character in /etc/passwd"
sed 's/\//\\/g' /etc/passwd > /etc/passwd_replaced
echo "   Replaced content saved to /etc/passwd_replaced"

# 8. Print the private IP
echo "8. Private IP: $(hostname -I)"

# 9. Print the public IP
echo "9. Public IP: $(curl -s ifconfig.me)"

# 10. Switch to john user
echo "10. Switching to user john"
su - john

# 11. Print the home directory
echo "11. Home directory of current user: $HOME"
