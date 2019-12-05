#!/bin/bash
# Bootstraps/updates tom campbells preferred working environment

# Disable screen lock first so we don't get locked out while updating packages
if [ "$(gsettings get "com.canonical.indicator.datetime" "time-format")" != "'24-hour'" ]; then
    gsettings set "com.canonical.indicator.datetime" "time-format" "24-hour"
    echo "Set clock to 24-hour."
fi

echo "Updating packages..."
sudo apt-get -y update
sudo apt-get -y install tmux vim git unzip wget psql
echo "...done."

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    echo "No default SSH key found, generating new default:"
    mkdir -m 700 -p "$HOME/.ssh"
    ssh-keygen -f "$HOME/.ssh/id_rsa"
    echo "Public key:"
    cat "$HOME/.ssh/id_rsa.pub"
    echo "GitHub:    https://github.com/settings/keys"
    read -n 1 -p "Add key to GitHub, then press any key to continue. "
    echo ""
fi

# Generate gitconfig here so we can get the paths right
if [ ! -h "$HOME/.gitconfig" ]; then
    echo "Generating gitconfig..."
    git config --global user.name "tcampbell90" 
    git config --global user.email "thomas.campbell@nyu.edu"
    git config --global pull.rebase "preserve"
    git config --global merge.ff "false"
    git config --global core.excludesfile "$HOME/.gitignore_global"
    git config --global format.pretty "short"
    git config --global log.abbrevCommit "true"
    git config --global log.decorate "auto"
    git config --global status.branch "true"
    git config --global merge.tool "vimdiff"
    git config --global mergetool.keepBackup "false"
    git config --global merge.conflictStyle "diff3"
    git config --global push.default "simple"
    git config --global core.autocrlf "input"

    echo "...done."
fi

echo "Updating dotfiles..."
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone "git@github.com:tcampbell90/dot_files.git" "$HOME/.dotfiles"
    # Remove loose bootstrap file
    if [ -f "bootstrap.sh" ]; then
        echo "Removing bootstrap.sh (tracked version in ~/.dotfiles/)."
        rm bootstrap.sh
    fi
else
    git -C "$HOME/.dotfiles" pull
fi

dotfiles="gitignore_global tmux.conf vimrc"
for file in $dotfiles; do
    if [ ! -h "$HOME/.$file" ]; then
        echo "Symlinking $file to home."
        ln -s "$HOME/.dotfiles/$file" "$HOME/.$file"
    fi
done
echo "...done."

if [ ! -f "$HOME/.vim/colors/solarized.vim" ]; then
    echo "Adding vim-solarized colorscheme."
    wget -O "$HOME/.dotfiles/downloads/solarized.vim" "https://raw.githubusercontent.com/altercation/vim-colors-solarized/blob/master/colors/solarized.vimu"
    mkdir -p "$HOME/.vim/colors"
    ln -s "$HOME/.dotfiles/downloads/solarized.vim" "$HOME/.vim/colors/solarized.vim"
    echo "...done."
    echo "Restart terminal to fix colorscheme."
fi

restart_confirmation () {
    local confirm
    read -n 1 -p "Do you want to restart now? [y/n] " confirm
    confirm=$(echo "$confirm" | cut -c 1)
    echo ""
    if [ "$confirm" = "y" ]; then
        shutdown -r now
    elif [ "$confirm" = "n" ]; then
        true
    else
        restart_confirmation
    fi
} 

echo "Done."
