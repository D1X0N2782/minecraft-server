#!/bin/bash

# Obtener la fecha en formato legible
fecha=$(date "+%Y-%m-%d %H:%M:%S")

# Cambiar al directorio del repositorio
cd /home/kali/minecraft-server || exit

# Verifica el estado actual del repositorio
echo "Actualizando cambios locales..."
git pull origin kali --rebase

# Añadir todos los cambios, incluidos archivos eliminados
git add -A

# Verificar si hay cambios pendientes antes de hacer commit
if git diff --cached --quiet; then
    echo "No hay cambios para sincronizar."
else
    # Realizar el commit con la fecha actual
    git commit -m "Backup automático: $fecha"
    
    # Subir los cambios al repositorio remoto
    echo "Enviando cambios a GitHub..."
    git push origin kali
fi
