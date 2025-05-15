FROM odoo:18.0
LABEL maintainer="Omar Diaz <zcool2005@gmail.com>"

USER root

# Instalar Chromium y sus dependencias
RUN apt-get update && apt-get install -y \
    chromium-browser \
    && rm -rf /var/lib/apt/lists/*

USER odoo

# Copiar archivos de la aplicación
COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf
# Instalar dependencias de Python
RUN pip install -r /mnt/extra-addons/requirements.txt
