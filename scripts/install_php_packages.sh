#!/bin/bash

echo "Instalando paquetes PHP..."

# Actualizar repositorios
sudo apt update

# Instalar paquetes
while read package; do
    sudo apt install -y "$package"
done < ../requirements.txt

# Instalar Composer
if ! command -v composer &> /dev/null; then
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    sudo mv composer.phar /usr/local/bin/composer
fi

echo "Instalación completada."
