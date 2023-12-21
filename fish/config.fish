# Create the `la` alias for a more readable `ls`
alias la='lsd -l -A --tree --depth 1 --date relative --group-dirs first --icon never --blocks "name,size,date"'
alias vim='nvim'

# After changing the directory use the `la` alias to display its contents
function l --on-variable PWD
    la
end

set -U fish_user_paths /usr/local/bin /opt/homebrew/bin $HOME/.composer/vendor/bin $fisher_user_paths

# Make the .config accessible everywhere
alias ..config='cd ~/.config && vim && cd ~'

# Load all files within the configs directory
for config_file in (find $HOME/.config/fish/configs -path "*/*.fish" -depth 1 -type f)
    builtin source $config_file 2> /dev/null
end

if status is-interactive
and not set -q TMUX
    exec tmux
end

# Remove the fish greeting
set fish_greeting

# Set the shell prompt
starship init fish | source
