#!/bin/bash

echo "Verificando el entorno de desarrollo PHP..."

# Verificar versión de PHP
php -v

# Verificar extensiones de PHP instaladas
php -m

# Verificar Composer
if command -v composer &> /dev/null; then
    composer --version
else
    echo "Composer no está instalado"
fi

# Verificar paquetes instalados
while read package; do
    if dpkg -s "$package" >/dev/null 2>&1; then
        echo "$package está instalado"
    else
        echo "$package no está instalado"
    fi
done < ../requirements.txt
