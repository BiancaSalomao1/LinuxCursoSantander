#!/bin/bash

echo "Atualizando e instalando dependências..."
apt-get update && apt-get upgrade -y
apt-get install -y apache2 wget

echo "Baixando e copiando os arquivos da aplicação..."
cd /tmp || exit

#Espelhamento completo do site
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://biancasalomao1.github.io/HTML/De%20Luca/

# Caminho real onde o wget salva
cd biancasalomao1.github.io/HTML/De%20Luca || exit

# Copia todos os arquivos para a pasta do Apache
cp -R * /var/www/html/

echo "Arquivos copiados com sucesso!"
