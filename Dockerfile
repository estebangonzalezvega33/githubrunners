# Usamos la imagen base oficial de ARC
FROM ghcr.io/actions/actions-runner:latest

# Cambiamos a root para instalar paquetes
USER root

# Instalamos kubectl y dependencias básicas (curl, ca-certificates)
RUN apt-get update && apt-get install -y curl ca-certificates \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/ \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Volvemos al usuario runner por seguridad
USER runner
