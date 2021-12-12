#
#   █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
#  ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
#  ███████║██║     ██║███████║███████╗█████╗  ███████╗
#  ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
#  ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
#  ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#

#########################################
# Shorten common commands               #
#########################################
alias ex="chmod +x"
alias cat="bat"
alias bc="bc -l"
alias q="~/ && clear"
alias top="bpytop"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
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

#########################################
# asciinema                             #
#########################################
alias record="asciinema rec"
alias recordAuth="asciinema auth"

#########################################
# MY OWN COMMANDS                       #
#########################################
alias now='date +"%T | %d-%m-%Y"'
alias stfu="osascript -e 'set volume output muted true'"
alias colors="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash"

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
alias gdf="cd ~/dotfiles";
alias gwk="cd ~/Projects/work"
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
alias arec='asciinema rec'
alias c='cargo'
alias cfg='cd ~/.config'
alias cfg='cd ~/.config'
# hardcoding for notification banners to start
# TODO: move to functions with options for preset locations
alias ck='cliclick "c:2525,30"'
# click in window upper-right but closer to middle
alias ckm='cliclick "c:2005,95"'
# click bottom right in window
alias ckr='cliclick "c:2525,1395"'
alias cnv='cd ~/.config/nvim'
alias cov='open coverage/index.html'
alias cpnotes='cp -R  ~/notes/ ~/Dropbox/notes'
alias cprs='rsync -a ~/rusty ~/Dropbox/tech --exclude rust-sources'
alias cpwd='pwd|pbcopy'
alias dots='zsh ~/dotfiles/index.txt'
alias dud='du -d 1 -h'
alias esl='node_modules/.bin/eslint .'
alias exaf='exa -allFI "node_modules|.git|coverage"'
alias eg='exa -a --long --git --group-directories-first --no-permissions --no-user --icons -FI "node_modules|.git|coverage|.DS_Store|.vscode"'
alias exg='exa -a --long --git --group-directories-first --no-permissions --no-user --icons -FI "node_modules|.git|coverage|.DS_Store|.vscode"'
alias exag='exa -a --long --git --group-directories-first --no-permissions --no-user --icons -FI "node_modules|.git|coverage|.DS_Store|.vscode"'
alias exal='exa -allI "node_modules|.git|coverage"'
alias exat='exa -aTI "node_modules|.git|coverage"'
alias gCal='cd ~/oss/gCal'
alias gdotc='git -C ~/dotfiles commit -a -m'
alias gdots='git -C ~/dotfiles status'
alias ghil='gh issue list'
alias gijs='git init && echo "node_modules" >> .gitignore'
alias glf='git log --stat'
alias gld='git log -p --stat'
alias glprs='git log -p --reverse --stat'
alias glps='git log -p --stat'
alias gt='git difftool --no-prompt' #delta
alias gwtl='git worktree list'
alias gyhc='git rev-parse HEAD | pbcopy'
alias hack='history -75 | rg'
alias jlc='jest --config=jest.local.js'
alias ldot='exa -ld .*'
alias mdc='make distclean'
alias mj4='make CMAKE_BUILD_TYPE=RelWithDebInfo -j4'
alias smi='sudo make install'
alias mp='multipass'
alias mpl='multipass list'
# not using multipass much, using `mps` in work-related alias
# alias mps='multipass shell'
alias ng='npm init -y && git init && echo "node_modules" >> .gitignore'
alias nij='node inspect node_modules/.bin/jest --runInBand'
alias nn='nnn -eiH'
alias note='nvim -c "lcd ~/notes/" -c "lua require\"joel.telescope\".browse_notes()"'
alias nv='nvim -c "lua require\"joel.telescope\".project_files()"'
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
alias ta='todoist add'
alias tl1='tree -L 1'
alias triage='nvim ~/notes/rust/triage-template'
alias v='nvim'
alias vac='nvim ~/.config/alacritty/alacritty.yml'
alias vc='nvim ~/.config/nvim/init.lua'
alias vd='nvim -d'
alias vdp='cd ~/vim-dev/plugins'
alias vdro='nvim -d -R'
#alias vft='floaterm'
alias vp='pbpaste | nvim'
alias vsl='nvim -S ~/vim-sessions/latest.vim'
alias vt='nvim +terminal'
alias yp='pwd|pbcopy'
alias sail='bash vendor/bin/sail'
alias pest='vendor/bin/pest'
alias v=nvim
alias zshconfig="code ~/.zshrc"

alias gpr="ggpur"
alias gs="gst"

alias pe="path-extractor"

alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

alias -g Z='| fzf'

alias lg='lazygit'

alias v='nvim'
alias vim='v'
alias vi='v'

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

classnames() {
    local in=$1
    [[ -z "$in" ]] && read in

    echo \"$(echo $in | sed 's/  / /g' | sed 's/ /", "/g')\"
}

cn() {
    local in=$1
    [[ -z "$in" ]] && read in

    classnames $1 | pbcopy
}

cdwhich() {
    cd $(dirname $(which $1))
}

cdparent() {
    cd $(dirname $1)
}

stat-octal() {
    stat -f %Mp%Lp $1
}

loop() {
    for x in {1..$1}; do $@[2,-1]; done
}

ansi-colors() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

