#!/bin/bash
# Script de respuesta activa para la eliminación de amenazas detectadas por VirusTotal.
# Implementación bajo normativa IEC 62443 para SOC Industrial.

# Leemos el JSON enviado por el motor de Wazuh
read -r INPUT_JSON
# Extraemos la ruta del archivo identificado como malicioso
FILENAME=$(echo $INPUT_JSON | jq -r .parameters.alert.data.virustotal.source.file)

# Verificamos la existencia del archivo antes de la acción de mitigación
if [ -f "$FILENAME" ]; then
    rm -f "$FILENAME"
    echo "$(date) - ÉXITO: El archivo malicioso $FILENAME fue eliminado por Active Response." >> /var/ossec/logs/active-responses.log
else
    echo "$(date) - ERROR: No se encontró el archivo $FILENAME para su eliminación." >> /var/ossec/logs/active-responses.log
fi
