# ====================
# = INSTANT PROMPT P10K
# ====================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ====================
# = ENVIRONMENT VARIABLES & EXPORTS
# ====================
export ZSH="$HOME/.oh-my-zsh"
export BAT_CONFIG_PATH="~/.config/bat/config.conf"
export EDITOR="nvim"
export DOTNET_ROOT=$HOME/.dotnet
export BUN_INSTALL="$HOME/.bun"
export JAVA_HOME="/home/ncasatti/.jdks/jbr-17.0.12"
export BROWSER="zen-browser"

# Path configurations
export PATH=$PATH:/snap/bin
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$HOME/.local/share/Uts/.sdk/flutter-sdk3/bin"
export PATH="$PATH:/home/ncasatti/.lmstudio/bin"

# ====================
# = OH-MY-ZSH CONFIGURATION
# ====================
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git aliases archlinux branch github zsh-syntax-highlighting zsh-completions zsh-interactive-cd zsh-navigation-tools colored-man-pages)
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

# ====================
# = DIRECTORY NAVIGATION
# ====================
alias home='cd ~'
alias etc='cd /etc/'
alias music='cd ~/Music'
alias vids='cd ~/Videos'
alias conf='cd ~/.config'
alias temp='cd ~/Temp'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias dldz='cd ~/Downloads'
alias docs='cd ~/Documents'
alias sapps='cd /usr/share/applications'
alias lapps='cd ~/.local/share/applications'
alias zx='zoxide query --interactive'
alias y='yazi'

# Development directories
alias dev='cd ~/Documents/Development'
alias devp='cd ~/Documents/Development/Python'
alias devf='cd ~/Documents/Development/Frontend'
alias deve='cd ~/Documents/Development/Python/.venv'
alias devem='cd ~/Documents/Development/Emser'
alias deva='cd ~/Documents/Development/AndroidStudio'
alias devr='cd ~/Documents/Development/React'
alias devdb='cd ~/Documents/Development/DB'
alias devdbmy='cd ~/Documents/Development/DB/MySql'

# ====================
# = FILE OPERATIONS
# ====================
alias ls='exa -al --git --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias l='exa -lah --color=always --group-directories-first'
alias l1='exa -T -L 1 --color=always --group-directories-first'
alias l2='exa -T -L 2 --color=always --group-directories-first'

# File management
alias rmd='rm -r'
alias srm='sudo rm'
alias srmd='sudo rm -r'
alias cpd='cp -R'
alias scp='sudo cp'
alias scpd='sudo cp -R'
alias rm='rm -rf'
alias mkfile='touch'

# Archive operations
alias tarc="tar -caf"
alias tarx="tar -xf"
alias tarv="tar -tvf"

# ====================
# = SYSTEM MANAGEMENT
# ====================
# System info
alias free='free -mt'
alias df='df -h'
alias hw='hwinfo --short'
alias userlist='cut -d: -f1 /etc/passwd'
alias probe='sudo -E hw-probe -all -upload'
alias ctl='sudo systemctl'

# System control
alias sr='reboot'
alias sp='poweroff'
alias start-docker='ctl start docker'
alias start-bluetooth='sudo systemctl start bluetooth'
alias start-teamviewer='sudo teamviewer --daemon start'

# ====================
# = PACKAGE MANAGEMENT
# ====================
# Pacman
alias upall='topgrade'
alias search='sudo pacman -Qs'
alias remove='sudo pacman -Rs'
alias install='sudo pacman -S'
alias linstall='sudo pacman -U '
alias update='sudo pacman -Syyu'
alias clrcache='yay -Scc'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias akring='sudo pacman -Sy archlinux-keyring --noconfirm'
alias unlock='sudo rm /var/lib/pacman/db.lck'

# Paru/Yay
alias pget='paru -S '
alias yget='yay -S '
alias yrem='yay -R '
alias prem='paru -R '
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'

# Flatpak
alias fpup='flatpak update'

# ====================
# = DEVELOPMENT TOOLS
# ====================
# Git
alias gc='git clone '
alias gp='git pull'
alias gfl='git-flow'
alias gpo="git push --verbose origin"

# Docker
alias dk='docker'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dkb='docker build'
alias dkr='docker run'
alias dkp='docker ps'
alias dkpa='docker ps --all'
alias dki='docker images'
alias dks='docker stop'
alias dke='docker exec -it'
alias lzd='lazydocker'

# Python
alias pipi='pip install'
alias pipu='pip install --upgrade pip'
alias pipir='pip install -r requirements.txt'
alias pipclean='pip freeze > pip-uninstall && pip uninstall -r pip-uninstall -y && rm pip-uninstall'
alias conda-env='source /home/ncasatti/.local/share/Uts/.sdk/anaconda3/bin/activate'
alias env-aws='source ~/Documents/Development/Python/.venv/aws/bin/activate'
alias penv1='source ~/Documents/Development/Python/.venv/research-corteva-cba/bin/activate'
alias penv2='source ~/Documents/Development/Python/.venv/research-corteva-cba36/bin/activate'
alias penv-aws='source ~/Documents/Development/Python/.venv/aws/bin/activate'
alias enva='source .venv/bin/activate'
alias pym='python manage.py'

# AWS
alias aws-cloudf='aws cloudformation'
alias aws-cloudf-create='aws cloudformation create-stack --stack-name'
alias aws-cloudf-describe='aws cloudformation describe-stacks --stack-name'
alias aws-cloudf-delete='aws cloudformation delete-stack --stack-name'
alias aws-cloudf-list='aws cloudformation list-stacks'
alias aws-cloudf-deploy='aws cloudformation deploy --stack-name'
alias aws-ecr='aws ecr'
alias aws-ecr-describe='aws ecr describe-images --repository-name'

# NixOS
alias nrs='sudo nixos-rebuild switch'
alias nrt='sudo nixos-rebuild test'
alias ne='sudo -E nvim /etc/nixos/configuration.nix'
alias ng='sudo nix-collect-garbage'
alias ngd='sudo nix-collect-garbage -d'
alias nu='sudo nixos-rebuild switch --upgrade-all'
alias nd='nix develop -c zsh'
alias nf='vim flake.nix'

# ====================
# = EDITORS
# ====================
alias vim='nvim'
alias v='nvim'
alias sv='sudo -E nvim'
alias n='nano -T 2'
alias sn='sudo nano -T 2'
alias c="cursor . & > /dev/null 2>&1"
alias cx="cursor . & > /dev/null 2>&1 && x"

# Config editing
alias nz='vim ~/.zshrc'
alias iz='vim ~/.config/i3/config'
alias nbashrc='sudo nano ~/.bashrc'
alias nzshrc='sudo nano ~/.zshrc'
alias nsddm='sudo nano /etc/sddm.conf'
alias pconf='sudo nano /etc/pacman.conf'
alias mkpkg='sudo nano /etc/makepkg.conf'
alias ngrub='sudo nano /etc/default/grub'
alias smbconf='sudo nano /etc/samba/smb.conf'
alias nlightdm='sudo $EDITOR /etc/lightdm/lightdm.conf'
alias nmirrorlist='sudo nano /etc/pacman.d/mirrorlist'
alias nsddmk='sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf'

# ====================
# = MISC TOOLS & UTILITIES
# ====================
# Rclone
alias r="rclone"
alias rc="rclone copy -P"
alias rcon="rclone config"
alias rn="rclone ncdu"
alias rs="rclone sync -P"
alias rl="rclone ls"
alias rl1="rclone ls --max-depth=1"
alias rl2="rclone ls --max-depth=2"
alias rl3="rclone ls --max-depth=3"
alias obsidian-push='rclone sync ~/Documents/ObsidianVault gd:Docs/ObsidianVault -P'
alias obsidian-get='rclone sync gd:Docs/ObsidianVault ~/Documents/ObsidianVault -P'
alias obsidian-sync='rclone bisync ~/Documents/ObsidianVault gd:Docs/ObsidianVault -P'

# Wormhole
alias whs='wormhole send'
alias whr='wormhole receive'

# Other utilities
alias br='xrandr --output eDP --brightness'
alias m='cmatrix -s -C cyan'
alias wget='wget -c'
alias pingme='ping -c64 github.com'
alias cls='clear && neofetch'
alias traceme='traceroute github.com'
alias x="exit"
alias kk="~/.config/.remap.sh"
alias ks="~/Temp/KeySound/keySound.sh"

# ====================
# = COMPLETIONS & SOURCING
# ====================
_cfpack_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" cfpack --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _cfpack_yargs_completions cfpack

# Source additional configurations
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"
