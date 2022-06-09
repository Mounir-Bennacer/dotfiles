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
    copypath
    copyfile
    docker
    docker-compose
    dotenv
    encode64
    extract
    fancy-ctrl-z
    fd
    git
    golang
    jsontools
    kubectl
    node
    npm
    # npx
    macos
    ripgrep
    # ssh-agent
    tmux
    urltools
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



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval "$(pyenv init --path)"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

PATH="/Users/mounirbennacer/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/mounirbennacer/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/mounirbennacer/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/mounirbennacer/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mounirbennacer/perl5"; export PERL_MM_OPT;

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mounirbennacer/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)