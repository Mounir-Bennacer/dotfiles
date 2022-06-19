#
#   █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
#  ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
#  ███████║██║     ██║███████║███████╗█████╗  ███████╗
#  ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
#  ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
#  ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#

#########################################
# SHORTEN COMMON COMMANDS               #
#########################################
alias ex="chmod +x"
alias cat="bat"
alias bc="bc -l"
alias q="~/ && clear"
alias top="bpytop"
alias nvl="VIMRUNTIME=runtime $HOME/neovim/build/bin/nvim"
alias mkdir="mkdir -p"
alias hosts="sudo vi /private/etc/hosts"
alias h="history"
alias hs="history | grep"
alias t="touch"
alias c="clear"
alias ls="ls -G"
alias la="ls -la"
alias ll="ls -lh"
alias lt="du -sh * | sort -h"
alias mnt='mount | grep -E ^/dev | column -t'
alias lal="ls -lAh"
alias ct="column -t"
alias grep="grep --color=always"
alias mc="ranger"
alias yota="sudo sysctl -w net.inet.ip.ttl=65"
alias lg="lazygit"

#########################################
# IP / Speedtest                        #
#########################################
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias myip='curl ipinfo.io/ip'

#########################################
# GIT                                   #
#########################################
alias gs="git status"
alias gcm="git commit"
alias gignore="vim .gitignore"
alias ga="git add "
alias gl="git log --pretty=format:'%C(Yellow)%h%Creset %ad | %s%d [%C(Green)%an%Creset]' --graph --date=short"
alias gb="git branch"
alias gbnm="git branch --no-merged"
alias gc="git checkout"
alias ghil='gh issue list'
alias gijs='git init && echo "node_modules" >> .gitignore'
alias glf='git log --stat'
alias gld='git log -p --stat'
alias glprs='git log -p --reverse --stat'
alias glps='git log -p --stat'
alias gt='git difftool --no-prompt' #delta
alias gwl='git worktree list'
alias gw='git worktree'
alias gwa='git worktree add'
alias gwd='git worktree remove'
alias gyhc='git rev-parse HEAD | pbcopy'
alias gpr="ggpur"
alias gs="gst"

#########################################
# asciinema                             #
#########################################
alias record="asciinema rec"
alias recordAuth="asciinema auth"

#########################################
# MY OWN COMMANDS                       #
#########################################
alias now='date +"%T | %d-%m-%Y"'
alias shut="osascript -e 'set volume output muted true'"

#
#  ██████╗  █████╗ ████████╗██╗  ██╗███████╗
#  ██╔══██╗██╔══██╗╚══██╔══╝██║  ██║██╔════╝
#  ██████╔╝███████║   ██║   ███████║███████╗
#  ██╔═══╝ ██╔══██║   ██║   ██╔══██║╚════██║
#  ██║     ██║  ██║   ██║   ██║  ██║███████║
#  ╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝
#
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias gdp="cd ~/Desktop"
alias gdf="cd ~/github.com/mounir-bennacer/dotfiles";
alias gdc="cd ~/Documents"
alias gdl="cd ~/Downloads"

# Custom ZSH Aliases
alias -s txt=nvim
alias -s vim=nvim
alias -s zsh=nvim
alias -s zshrc=nvim
alias -s {c,h}=nvim
alias -s {js,json}=nvim
alias -s {md,MD}=nvim
alias -s {rs,toml}=nvim
alias -s yml=nvim
alias -s lua=nvim
alias c='cargo'
alias cfg='cd ~/.config'

alias cnv='cd ~/.config/nvim'
alias cpwd='pwd|pbcopy'
alias dud='du -d 1 -h'
alias esl='node_modules/.bin/eslint .'
alias exaf='exa -allFI "node_modules|.git|coverage"'
alias exal='exa -allI "node_modules|.git|coverage"'
alias exat='exa -aTI "node_modules|.git|coverage"'
alias hack='history -75 | rg'
alias jlc='jest --config=jest.local.js'
alias ldot='exa -ld .*'
alias mdc='make distclean'
alias mj4='make CMAKE_BUILD_TYPE=RelWithDebInfo -j4'
alias smi='sudo make install'
# not using multipass much, using `mps` in work-related alias
# alias mps='multipass shell'
alias ygi='yarn init -y && git init && echo "node_modules" >> .gitignore'
alias dev='yarn dev'
alias nij='node inspect node_modules/.bin/jest --runInBand'
alias nun='nvim -u NONE'
alias nvc='cd ~/.config/nvim && nvim ~/.config/nvim/init.lua'
alias ppwd='pbpaste'
alias rdb='rust-lldb'
alias rdc='rustup doc --core'
alias rds='rustup doc --std'
alias ru='rustup'
alias rud='rustup doc'
alias rus='rustup show'
alias ruu='rustup update'
alias tl1='tree -L 1'
alias v='nvim'
alias vac='nvim ~/.config/alacritty/alacritty.yml'
alias vc='nvim ~/.config/nvim/init.lua'
alias vd='nvim -d'
alias vdro='nvim -d -R'
alias vp='pbpaste | nvim'
alias v=nvim

alias pe="path-extractor"

alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

alias -g Z='| fzf'

alias tolower="tr '[:upper:]' '[:lower:]'"
alias toupper="tr '[:lower:]' '[:upper:]'"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

alias '?'='google'

alias shuf="rl"

# remove undesired aliases
unalias ff

# helper functions
displays() {
    system_profiler SPDisplaysDataType
}

diffstring() {
    diff <(echo $1) <(echo $2)
}

cdwhich() {
    cd $(dirname $(which $1))
}

loop() {
    for x in {1..$1}; do $@[2,-1]; done
}
