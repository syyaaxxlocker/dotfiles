#!/bin/bash

#Colors
RED="\x1b[0;31m"
GREEN="\x1b[0;32m"
BLUE="\x1b[0;34m"
YELLOW="\x1b[0;33m"
WHITE="\x1b[0;37m"
NC="\x1b[0m"

print_info() {
    echo -e "${YELLOW}[INFO]${NC}: $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC}: $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC}: $1"
}

function setup_pacmanconf() {
    sudo cp /etc/pacman.conf /etc/pacman.conf.bak || true
    sudp cp ./etc/pacman.conf /etc/pacman.conf

    sudo pacman -Syu --noconfirm    
}

function install_core_deps() {
    if ! command -v pacman &>/dev/null; then
        print_error "Pacman is not available. This script for Arch-based distributions."
        exit 1
    fi    

    core_deps=("git" "base-devel")
    core_deps_to_install=()

    for pkg in $core_deps; do
        if ! pacman -Qq "$pkg" &>/dev/null; then
            core_deps_to_install+=("$pkg")
        fi
    done
    
    if [ ${#core_deps_to_install[@]} -gt 0 ]; then
        if ! sudo pacman -S --noconfirm --needed ${core_deps_to_install[@]} 1>/dev/null; then
            print_error "Packages is not installed"
            exit 1
        else
            print_success "Dependencies installed successfully"
        fi
    else
        print_success "Dependencies already installed."
    fi
}

function install_pkgs() {
    local to_install=()
    for pkg in $@; do
        if ! pacman -Qq "$pkg" &>/dev/null; then
            to_install+=("$pkg")
        fi
    done

    if [ ${#to_install[@]} -gt 0 ]; then
        if ! sudo pacman -S --noconfirm --needed "${to_install[@]}"; then
            print_error "Packages is not installed."
            exit 1
        fi
        print_success "Installed: ${to_install[*]}"
    else
        print_success "Packages already installed."
    fi
}

function ensure_yay() {
    if ! command -v yay &>/dev/null; then
        print_info "Installing AUR Helper (yay)"
        local tmp_dir
        tmp_dir=$(mktemp -d)
        git clone https://aur.archlinux.org/yay.git "$tmp_dir"
        (
            cd "$tmp_dir"
            makepkg -si --noconfirm
        )
        rm -rf "$tmp_dir"
        print_success "Yay installed."
    else
        print_info "Yay is already installed."
    fi
}

function setup_cursor() {
    sudo sh -c 'echo -e "[Icon Theme]\nName=Default\nComment=Default Cursor Theme\nInherits=breeze_cursors" > /usr/share/icons/default/index.theme'
}

function main() {
    if [ $EUID -eq 0 ]; then
        print_error "Script must not be run as root"
        exit 1
    fi
    
    if ! sudo -v; then
        print_error "Sudo privileges are required for this script."
        exit 1
    fi

    install_core_deps
    ensure_yay

    print_info "Install DWL dependencies."
    install_pkgs libinput wayland wlroots0.19 libxkbcommon wayland-protocols pkg-config libxcb xcb-util-wm xorg-xwayland fcft tllist wmenu libxcursor

    print_info "Install utilities and tools packages."
    install_pkgs kitty wl-clipboard wlr-randr grim slurp ranger vim nano stow swaybg wget python-pillow htop fastfetch cliphist fd tmux hyprlock mako mupdf-gl

    print_info "Install Audio and XDG packages."
    install_pkgs wireplumber pipewire pipewire-pulse xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk

    print_info "Install programs packages."
    install_pkgs obs-studio discord telegram-desktop obsidian wine-staging wine-mono winetricks zathura zathura-pdf-mupdf mpv

    print_info "Install fonts and cursor packages."
    install_pkgs ttf-font-awesome ttf-roboto ttf-roboto-mono ttf-jetbrains-mono ttf-dejavu ttf-liberation ttf-opensans noto-fonts-emoji breeze-cursors
    setup_cursor
}

main
