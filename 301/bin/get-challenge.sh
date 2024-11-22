#!/bin/bash

# Verificar si se proporcionó un número de challenge
if [ -z "$1" ]; then
    echo "Error: Por favor proporciona el número del challenge"
    echo "Uso: $0 <numero-challenge>"
    exit 1
fi

# Crear la carpeta challenges si no existe
if [ ! -d "./challenges" ]; then
    echo "Creando directorio challenges..."
    mkdir -p ./challenges
fi


echo "Descargando: Code Challenge $1"


# Detectar sistema operativo
if [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
  # Estamos en Git Bash en Windows
  echo "- Windows -"
  CURL_CMD=`command -v curl`
else
  # Asumimos que estamos en Linux
  echo "- Mac o Linux -"
  CURL_CMD=`which curl`
fi

$CURL_CMD -s https://entertechschool.github.io/ncode-301-guide/code-challenges/cc-$1.test.js > ./challenges/challenges-$1.test.js