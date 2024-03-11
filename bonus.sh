#!/bin/bash

# Funcție pentru afișarea mesajului de eroare și ieșirea din script
display_error() {
    echo "Error: $1"
    exit 1
}

# Verifică dacă scriptul este executat cu privilegii de root
check_root_privileges() {
    if [ "$(id -u)" != "0" ]; then
        display_error "This script must be run with root privileges."
    fi
}

# Funcție pentru afișarea home directory-ului
print_home_directory() {
    echo "1. Home directory: $HOME"
}

# Funcție pentru listarea tuturor utilizatorilor din fișierul passwd
list_usernames() {
    echo "2. List of usernames:"
    awk -F: '{print $1}' /etc/passwd
}

# Funcție pentru numărarea numărului de utilizatori
count_users() {
    echo "3. Number of users: $(awk -F: 'END {print NR}' /etc/passwd)"
}

# Funcție pentru a găsi directorul home al unui utilizator specific
find_home_directory() {
    read -p "4. Enter username to find home directory: " username
    home_dir=$(awk -v u="$username" -F: '$1 == u {print $6}' /etc/passwd)
    echo "   Home directory of $username: $home_dir"
}

# Funcție pentru listarea utilizatorilor cu un interval UID specific
list_users_with_uid_range() {
    echo "5. List of users with UID range 1000-1010:"
    awk -F: '$3 >= 1000 && $3 <= 1010 {print $1}' /etc/passwd
}

# Funcție pentru găsirea utilizatorilor cu shell-uri standard
find_users_with_standard_shells() {
    echo "6. Users with standard shells (/bin/bash or /bin/sh):"
    awk -F: '$NF ~ /\/bin\/(bash|sh)$/ {print $1}' /etc/passwd
}

# Funcție pentru înlocuirea caracterului "/" cu "\" în fișierul /etc/passwd și redirecționarea conținutului
replace_slash_with_backslash() {
    echo "7. Replacing \"/\" character with \"\\\" character in /etc/passwd"
    sed 's/\//\\/g' /etc/passwd > /etc/passwd_replaced
    echo "   Replaced content saved to /etc/passwd_replaced"
}

# Funcție pentru afișarea adresei IP private
print_private_ip() {
    echo "8. Private IP: $(hostname -I)"
}

# Funcție pentru afișarea adresei IP publice
print_public_ip() {
    echo "9. Public IP: $(curl -s ifconfig.me)"
}

# Funcție pentru comutarea la utilizatorul "john"
switch_to_john_user() {
    echo "10. Switching to user john"
    su - john
}

# Funcție pentru afișarea home directory-ului utilizatorului curent
print_current_user_home_directory() {
    echo "11. Home directory of current user: $HOME"
}

# Verifică privilegiile de root
check_root_privileges

# Afișează cererile utilizând funcțiile definite mai sus
print_home_directory
list_usernames
count_users
find_home_directory
list_users_with_uid_range
find_users_with_standard_shells
replace_slash_with_backslash
print_private_ip
print_public_ip
switch_to_john_user
print_current_user_home_directory
