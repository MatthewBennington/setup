# Running:

__Does not work lol__

`git clone https://github.com/MatthewBennington/setup.git && setup/setup.sh`

# Installing stuff:
1. Install brew `https://brew.sh/`
2. Install zsh `brew install zsh`
3. Install tmux `brew install tmux`
    - Install tpm (tmux plugin manager) `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
    - Open tmux and type \`b to install plugins.
4. Set zsh as your shelll `sudo echo "$(which zsh)" >> /etc/shells` & `chsh -s $(which zsh)`
5. Configure zsh
    - Install syntax highlighting `brew install zsh-syntax-highlighting`
6. Use the config files from this repo
