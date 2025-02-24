#Alias Dir Export
export DIR_EXPORT='/etc/profile.d/'

#Alias definitions
if [ -e $HOME/.bash_aliases ]; then
        source $HOME/.bash_aliases
fi
#<!--------------------!>#
#     bash completion
#<!--------------------!>#
 if [[ -f "$HOME/git-completion.bash"  ]]; then
         source "$HOME/.bash_completion.d/git-completion.bash"
 fi
 if ! shopt -oq posix; then
         if [ -f /usr/share/bash-completion/bash_completion ]; then
                 . /usr/share/bash-completion/bash_completion
         elif [ -f /etc/bash_completion ]; then
         . /etc/bash_completion
         fi
 fi
#<!-----------------------------------------------------------------------------------!>#
#     Alias and bookmark the web folder (try to guess it's location)
#     This will NOT overwrite a "web" alias previously definded in .bash_aliases
#<!-----------------------------------------------------------------------------------!>#
if [[ "$(type -t web)" != 'alias' ]]; then
        if [[ -d /var/www/html ]]; then
                alias web='cd /var/www/html'
                export web="/var/www/html"
        elif [[ -d /srv/http ]]; then
                alias web='cd /srv/http'
                export web="/srv/http"
        fi
fi
#<!-----------------------------------------------------------------------------------!>#
#     Finds the current Linux distribution, name, version, and kernel version
#<!-----------------------------------------------------------------------------------!>#
function ver() {
        if [[ -x "$(command -v uname)" ]]; then
                uname --kernel-name --kernel-release --machine && echo
        fi
        if [[ -x "$(command -v hostnamectl)" ]]; then
                hostnamectl && echo
        fi
        if [[ -x "$(command -v lsb_release)" ]]; then
                lsb_release -a && echo
        fi
        cat /etc/*-release 2> /dev/null
}
#<!-------------------------------!>#
#    Vagrant Default Provider
#<!-------------------------------!>#
#..........vmware_desktop
#..........docker
#..........hyperv
#..........virtualbox
export VAGRANT_DEFAULT_PROVIDER=virtualbox
#<!----------!>#
#     bat
#<!----------!>#
export BAT_THEME="gruvbox-dark"
#<!----------!>#
#     Vivid
#<!----------!>#
# Selecciona un theme diferente cada día
export VIVID_THEME=$(awk "NR == $(date +%j) % $(wc -l < ~/.vivid_themes) + 1" ~/.vivid_themes)

# Aplica el theme a LS_COLORS
export LS_COLORS=$(vivid generate "$VIVID_THEME")
#<!----------!>#
#     PS1
#<!----------!>#
export PS1='\[\e[0;95m\][\[\e[0;38;5;51m\]\u \[\e[0;91m\]\W \[\e[0;5;38;5;51m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;95m\]]\[\e[0m\]:\[\e[0;5m\]🚀 \[\e[0m\]'
#<!--------------------!>#
#     Git-Scripts
#<!--------------------!>#
export PATH=$PATH:$HOME/pro/git-scripts
#<!--------------------!>#
#     Go Enviroment
#<!--------------------!>#
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOBIN:$GOROOT/bin
#<!----------------!>#
#     PATH bin
#<!----------------!>#
export PATH=$PATH:$HOME/.local/bin/
#<!--------------------!>#
#     .oh-my-git
#<!--------------------!>#
source $HOME/.oh-my-git/prompt.sh
#<!-------------!>#
#     Cargo
#<!-------------!>#
source $HOME/.cargo/env
#<!-------------!>#
#     node.js
#<!-------------!>#
export VNODEJS=$(node --version)
export PATH=$PATH:$HOME/.nvm/versions/node/$VNODEJS/bin
#<!----------------------!>#
#     CONFIG HISTORY
#<!----------------------!>#
export HISTFILESIZE=100000
export HISTSIZE=${HISTFILESIZE}
export HISTCONTROL=ignoreboth:erasedeps
export HISTTIMEFORMAT="%F %T"
export HISTIGNORE="&:[ ]*:ls:ll:[bf]g:only:onlyf:onlyd:history:clear:cls:exit"
#<!-------------------!>#
#     CONFIG TERM
#<!-------------------!>#
export TERM=xterm-256color
export use_color=true
#<!-----------------------------!>#
#     If TMUX is installed
#<!-----------------------------!>#
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#        exec tmux
#fi
