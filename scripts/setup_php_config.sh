#!/bin/bash

echo "Configurando PHP..."

# Obtener la ruta del archivo php.ini
PHP_INI=$(php --ini | grep "Loaded Configuration File" | sed -e "s|.*:\s*||")

# Hacer backup del php.ini actual
sudo cp "$PHP_INI" "${PHP_INI}.backup"

# Añadir configuraciones al php.ini
sudo cat ../configs/php.ini >> "$PHP_INI"

echo "Configuración de PHP completada. Se ha creado un backup en ${PHP_INI}.backup"
