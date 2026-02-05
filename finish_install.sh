#!/bin/bash
echo "Starting/Continuing build and installation of Frappe CRM..."
# This will pick up where the background build left off (using cache) or wait for it.
docker-compose up -d --build

echo "Restoring original docker configuration..."
if [ -f ~/.docker/config.json.bak ]; then
    mv ~/.docker/config.json.bak ~/.docker/config.json
    echo "Configuration restored."
else
    echo "Backup config not found, skipping restore."
fi

echo "Installation complete. You can access your system at localhost:8000"
