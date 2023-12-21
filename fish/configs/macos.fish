# Alias to update brew, upgrade all packages and clean everything up afterwards
function update
    set -U COLOR_RESET  "\033[0m"
    set -U COLOR_GREEN  "\033[0;32m"
    set -U COLOR_YELLOW "\033[0;33m"
    set -U COLOR_BLUE   "\033[0;34m"
    set -U COLOR_PURPLE "\033[0;35m"

    printf "%b" "$COLOR_YELLOW\e0[homebrew 🍻] Updating the homebrew catalog ...\n$COLOR_RESET"
    brew update
    printf "%b" "$COLOR_YELLOW\e0[homebrew 🍻] Upgrading all installed packages (if needed) ...\n$COLOR_RESET"
    brew upgrade
    printf "%b" "$COLOR_YELLOW\e0[homebrew 🍻] Running the cleanup ...\n$COLOR_RESET"
    brew autoremove
    brew cleanup

    printf "%b" "$COLOR_PURPLE\e0\n[composer 🎻] Updating global composer dependencies ...\n$COLOR_RESET"
    composer global update
    
    printf "%b" "$COLOR_BLUE\e0\n[npm 📦] Updating global npm dependencies ...\n$COLOR_RESET"
    npm update -g
    
    printf "%b" "$COLOR_GREEN\e0\nDONE! Do something amazing \u2764\n$COLOR_RESET"
end

