#!/bin/bash

set -e  # Detener el script en caso de error

# Definir directorios
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"
REPO_URL="https://github.com/dczinil/dotfiles.git"

# Crear directorio de backup si no existe
mkdir -p "$BACKUP_DIR"

# Función para detectar la distribución de Linux
detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
    else
        echo "❌ No se pudo detectar la distribución de Linux."
        exit 1
    fi
}

# Instalar solo git y curl si aún no están
install_basic_tools() {
    echo "📦 Instalando herramientas básicas..."
    case "$OS" in
        ubuntu|debian)
            sudo apt update && sudo apt install -y git curl zip
            ;;
        fedora)
            sudo dnf install -y git curl zip
            ;;
        rocky)
            sudo dnf install -y git curl zip
            ;;
        ol)
            sudo dnf install -y git curl zip
            ;;
        opensuse*)
            sudo zypper install -y git curl zip
            ;;
        *)
            echo "❌ Distribución no soportada: $OS"
            exit 1
            ;;
    esac
}

# Clonar el repositorio si no existe
clone_repo() {
    if [ ! -d "$DOTFILES_DIR" ]; then
        echo "🔄 Clonando dotfiles en $DOTFILES_DIR..."
        git clone "$REPO_URL" "$DOTFILES_DIR"
    else
        echo "✔️ El repositorio ya existe en $DOTFILES_DIR, actualizando..."
        git -C "$DOTFILES_DIR" pull
    fi
}

# Función para instalar todos los paquetes necesarios
#install_packages() {
#    echo "📦 Instalando paquetes adicionales..."
#    case "$OS" in
#        ubuntu|debian)
#            sudo apt update && sudo apt install -y wget vim zip
#            ;;
#        fedora)
#            sudo dnf install -y wget vim zip
#        rocky)
#            sudo yum install -y git curl zip
#            ;;
#        ol)
#            sudo yum install -y git curl zip
#            ;;
#        opensuse*)
#            sudo zypper install -y wget vim zip
#            ;;
#        *)
#            echo "❌ Distribución no soportada: $OS"
#            exit 1
#            ;;
#    esac
#}

# Función para crear enlaces simbólicos con respaldo
link_file() {
    src=$1
    dest=$2

    if [ -e "$dest" ]; then
        mv "$dest" "$BACKUP_DIR/$(basename $dest)_$(date +%Y%m%d%H%M%S)"
    fi

    ln -sf "$src" "$dest"
}

# Detectar la distribución
detect_os

# Instalar git y curl para poder clonar el repo
install_basic_tools

# Clonar el repositorio
clone_repo

# Instalar paquetes adicionales
#install_packages

# Ejecutar scripts de instalación
bash "$DOTFILES_DIR/setup/packages.sh"
bash "$DOTFILES_DIR/setup/languages.sh"
bash "$DOTFILES_DIR/setup/frameworks.sh"
bash "$DOTFILES_DIR/setup/package_managers.sh"
bash "$DOTFILES_DIR/setup/tools.sh"

# Crear enlaces simbólicos para los archivos de configuración
for config in "$DOTFILES_DIR/configs/"*; do
    link_file "$config" "$HOME/$(basename $config)"
done

# Configurar shell (aliases, exports, etc.)
for file in "$DOTFILES_DIR/configs/shell/"*.sh; do
    link_file "$file" "$HOME/.${file##*/}"
    source "$HOME/.${file##*/}"
done

# Hacer disponibles las configuraciones para todos los usuarios
sudo ln -sf "$DOTFILES_DIR/configs/shell/aliases.sh" /etc/profile.d/aliases.sh
sudo ln -sf "$DOTFILES_DIR/configs/shell/exports.sh" /etc/profile.d/exports.sh
sudo ln -sf "$DOTFILES_DIR/configs/shell/env.sh" /etc/profile.d/env.sh

# Clonar repositorios adicionales
bash "$DOTFILES_DIR/scripts/clone_repos.sh"

echo "✅ Instalación completada en $OS."
