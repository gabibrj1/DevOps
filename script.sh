#!/bin/bash

# Verifica daca numarul de argumente este corect
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_passwd_file>"
    exit 1
fi

# Verifica daca fisierul exista
if [ ! -f "$1" ]; then
    echo "File $1 not found"
    exit 1
fi

# Extrage numele fisierului din calea data
filename=$(basename "$1")

# Verifică daca numele fisierului este "passwd"
if [ "$filename" = "passwd" ]; then
    echo "File name is passwd"
else
    echo "File name is not passwd"
    
fi
