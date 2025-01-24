#!/bin/bash

# List of packages for full-stack development and daily usage
PACKAGES=(
    # Development Tools
    "code"                          # Visual Studio Code (official package)
    "nodejs"                        # JavaScript runtime
    "npm"                           # Node.js package manager
    "yarn"                          # Alternative package manager for Node.js
    "python"                        # Python interpreter
    "python-pip"                    # Python package manager
    "jdk-openjdk"                   # Java Development Kit
    "maven"                         # Build automation tool for Java
    "gradle"                        # Build automation tool for Java/Kotlin
    "ruby"                          # Ruby interpreter
    "go"                            # Go programming language
    "rust"                          # Rust programming language
    "php"                           # PHP interpreter
    "composer"                      # PHP dependency manager
    "docker"                        # Containerization platform
    "docker-compose"                # Docker orchestration tool
    "postman-bin"                   # API testing tool (AUR)
    "insomnia-bin"                  # API testing tool (AUR)
    "dbeaver"                       # Universal database tool
    "mongodb-bin"                   # MongoDB (AUR)
    "postgresql"                    # PostgreSQL database
    "mysql"                         # MySQL database
    "redis"                         # In-memory data store
    "sqlite"                        # Lightweight SQL database
    "nginx"                         # Web server
    "apache"                        # Web server
    "git"                           # Version control system
    "github-cli"                    # GitHub CLI tool
    "gitkraken"                     # Git GUI client (AUR)
    "neovim"                        # Modern Vim alternative
    "tmux"                          # Terminal multiplexer
    "zsh"                           # Zsh shell
    "oh-my-zsh-git"                 # Zsh configuration framework (AUR)
    "bash-completion"               # Auto-completion for Bash
    "jq"                            # Command-line JSON processor
    "curl"                          # Command-line tool for HTTP requests
    "wget"                          # Command-line download tool
    "htop"                          # Interactive process viewer
    "neofetch"                      # System information tool

    # Frontend Development
    "typescript"                    # TypeScript compiler
    "angular-cli"                   # Angular CLI (AUR)
    "react-scripts"                 # React development tools (via npm)
    "vue-cli"                       # Vue CLI (via npm)
    "sass"                          # CSS preprocessor
    "less"                          # CSS preprocessor
    "webpack"                       # JavaScript module bundler
    "babel"                         # JavaScript compiler
    "eslint"                        # JavaScript linter
    "prettier"                      # Code formatter

    # Backend Development
    "django"                        # Python web framework
    "flask"                         # Python micro web framework
    "express"                       # Node.js web framework (via npm)
    "nestjs"                        # Node.js framework (via npm)
    "laravel"                       # PHP web framework (via composer)
    "rails"                         # Ruby web framework
    "spring-boot"                   # Java web framework (via maven/gradle)

    # Daily Usage Apps
    "firefox"                       # Web browser
    "thunderbird"                   # Email client
    "discord"                       # Chat client
    "telegram-desktop"              # Messaging app
    "slack-desktop"                 # Slack client (AUR)
    "spotify"                       # Music streaming
    "vlc"                           # Media player
    "libreoffice-fresh"             # Office suite
    "gimp"                          # Image editor
    "inkscape"                      # Vector graphics editor
    "qbittorrent"                   # BitTorrent client

    # Additional Useful Resources
    "ansible"                       # Configuration management tool
    "postgis"                       # PostgreSQL spatial extension
    "graphviz"                      # Graph visualization software
    "ffmpeg"                        # Multimedia framework
    "imagemagick"                   # Image manipulation tool
    "unzip"                         # Zip file extraction
    "zip"                           # Zip file creation
    "rsync"                         # File synchronization tool
    "openssh"                       # SSH client and server
    "net-tools"                     # Networking tools (ifconfig, netstat, etc.)
    "htop"                          # Interactive process viewer
    "iotop"                         # I/O monitoring tool
    "lsof"                          # List open files
    "strace"                        # System call tracer
    "ltrace"                        # Library call tracer
    "man-db"                        # Manual pages
    "texlive-most"                  # LaTeX distribution
    "pandoc"                        # Document converter
)

# Function to install packages with error handling
install_packages() {
    local package_manager="$1"
    shift
    local packages=("$@")

    for package in "${packages[@]}"; do
        echo "Installing $package using $package_manager..."
        if $package_manager -S --noconfirm --needed "$package"; then
            echo "Successfully installed $package."
        else
            echo "Failed to install $package."
        fi
    done
}

# Update the system first
echo "Updating the system..."
sudo pacman -Syu --noconfirm

# Install official packages using pacman
echo "Installing official packages..."
install_packages "sudo pacman" "${PACKAGES[@]}"

# Install AUR packages using paru
echo "Installing AUR packages..."
install_packages "paru" "${PACKAGES[@]}"

echo "Installation complete!"
