#!/bin/bash

# Vérifie si un nom d'utilisateur est passé en argument
if [ -z "$1" ]; then
  echo "Passez votre nom en argument"
  exit 1
fi

echo "Bonjour $1!"

# Nom du script PHP générateur
GENERATEUR_HTML="script.php"

# Nom du fichier de sortie
OUTPUT_FILE="page_generee.html"

# Répertoire du serveur web pour linux 
WEB_SERVER_DIR="/var/www/html"

# Vérifie si le script PHP générateur existe
if [ ! -f "$GENERATEUR_HTML" ]; then
  echo "Le script PHP générateur $GENERATEUR_SCRIPT n'existe pas."
  exit 1
fi

# Exécute le script PHP et redirige la sortie vers le fichier de sortie
php "$GENERATEUR_HTML" $1 > "$OUTPUT_FILE"

# Vérifie si l'exécution a réussi
if [ $? -eq 0 ]; then
  echo "La page HTML a été générée avec succès dans $OUTPUT_FILE."
else
  echo "Une erreur s'est produite lors de la génération de la page PHP."
  exit 1
fi

sudo mv "$OUTPUT_FILE" "$WEB_SERVER_DIR/$OUTPUT_FILE"

# Vérifie si le déplacement a réussi
if [ $? -eq 0 ]; then
  echo "La page HTML a été déplacée vers $WEB_SERVER_DIR/$OUTPUT_FILE"
  echo "Tapez http://localhost/page_generee.html sur votre navigateur"
else
  echo "Une erreur s'est produite lors du déplacement de la page PHP."
  exit 1
fi

