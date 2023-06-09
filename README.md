# CONFIGS, DOTFILES, RC

Install config files using 'stow'. https://www.gnu.org/software/stow/

`sudo apt install stow`

clone the repo, enter the folder and run stow for the desired config to install.

## ZSH.

Install oh-my-zsh:

`https://github.com/ohmyzsh/ohmyzsh`

Install the .zshrc config

`stow -t ~ -S zsh`

Install the theme.

`stow -t ~ -S oh-my-zsh`

Install fzf for fuzzy find in the command history: (https://github.com/junegunn/fzf#using-git)

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Install zsh zsh-autosuggestions. (https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Follow the instructions and restart the shell (zsh)

## NEOVIM

Build from source, 0.9+. (https://github.com/neovim/neovim)
Install on system with sudo make install.

Install the init.lua config directory.

`stow -t ~ -S neovim`

Open nvim to automatically install all plugins.


Extra stuff:

Install node-js/npm so that language servers can be installed.
Se official docs so that LTS or newer version is used.

Install ripgrep for fuzzy finding of files.

`sudo apt install ripgrep`

Install custom font on system and use in terminal. For fancy icons.

`https://github.com/ryanoasis/nerd-fonts#font-installation`

Do a sparse checkout:

`https://github.com/ryanoasis/nerd-fonts#option-5-clone-the-repo`

Install the fonts with the script:

`./install.sh JetBrainsMono`


## SSH config.

Configure so that correct username is used for ssh connections to gittools/torg.

`stow -t ~ -S ssh`

## TMUX config.
A default config for tmux that makes it usable. Support for correct colors copy paste and mouse.

Install the plugin manager for a better look!
* tmux-plugin-manager: (https://github.com/tmux-plugins/tpm)
    * `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
    * Install plugins with C-prefix + I

`stow -t ~ -S tmux`

## Tmuxinator.
(Requires ruby/gem to install, use rvm to get ruby.)

`https://github.com/tmuxinator/tmuxinator`

Install the projects using (if existing projects, use --adapt?):
`stow -t ~/ -S tmuxinator`



Dotfiles installation readme.

Dependencies:
nvim:
* ripgrep (install via apt)
* nodejs & npm for language server installations. (https://github.com/nvm-sh/nvm)


tmux: (install via apt.)
* tmux-plugin-manager: (https://github.com/tmux-plugins/tpm)
    - git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    - Install plugins with C-prefix + I

tmuxinator: https://github.com/tmuxinator/tmuxinator
* ruby. (https://github.com/rvm/rvm)

zsh:
* oh-my-zsh. (https://github.com:/ohmyzsh/ohmyzsh)
