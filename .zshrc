if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/mounirbennacer/.oh-my-zsh"

# Custom PATHs
export PATH="/opt/homebrew/sbin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/bin:$PATH"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

DISABLE_MAGIC_FUNCTIONS="true"

COMPLETION_WAITING_DOTS="true"

ZSH_ALIAS_FINDER_AUTOMATIC="true"

# User variables
source ~/.config/zsh/.variables.zsh

# Activate zsh plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source "$HOME/.config/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    alias-finder
    ansible
    aws
    brew
    colored-man-pages
    command-not-found
    common-aliases
    copydir
    copyfile
    docker
    docker-compose
    dotenv
    ember-cli
    encode64
    extract
    fancy-ctrl-z
    fd
    gatsby
    git
    golang
    jira
    jsontools
    kubectl
    laravel
    node
    npm
    # npx
    macos
    ripgrep
    # ssh-agent
    tmux
    tmuxinator
    urltools
    vscode
    web-search
    z
    gh
    zsh-vim-mode
)

source $ZSH/oh-my-zsh.sh

source ~/.config/zsh/.p10k.zsh
source ~/.config/zsh/.iterm2.zsh
source ~/.config/zsh/.fzf.zsh

# zsh completions
fpath=(/opt/homebrew/share/zsh-completions $fpath)
[[ -d /opt/homebrew/share/zsh/site-functions/ ]] && fpath+=(/opt/homebrew/share/zsh/site-functions/)

setopt extended_glob

# Key bindings (require zsh-vim-mode)
vim-mode-bindkey viins -- undo '^[z'
vim-mode-bindkey viins -- redo '^[Z'

# User Aliases
source ~/.config/zsh/aliases.zsh

#### FIG ENV VARIABLES ####
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh

#### FIG ENV VARIABLES ####
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
