# zmodload zsh/zprof

autoload compinit && compinit

# load zcompdump only when it's not there

# autoload -Uz compinit
# if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#   compinit
# else
#   compinit -C
# fi

autoload -U colors && colors
export ZSH=~/.zsh
export ZSH_CACHE_DIR=$ZSH/cache

HISTSIZE=100000
SAVEHIST=50000
setopt extended_history
setopt hist_expire_dups_first
# setopt hist_ignore_dups
setopt HIST_FIND_NO_DUPS
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

HISTFILE=~/.zsh_history

source ~/.zsh_plugins.sh
# source $HOME/.zsh/k8s/k8s_alias
source $HOME/.zsh/zshalias
source $HOME/.zsh/func
source $HOME/.zsh/lf_icons

export KITTY_CONFIG_DIRECTORY=~/.config/kitty
export NOTES_CLI_HOME="~/notes"
export NOTES_CLI_EDITOR=nvim
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export LC_ALL=en_US.UTF-8
export PATH=$PATH:$HOME/.work-lib
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin

export VISUAL=nvim
export EDITOR="$VISUAL"
export NVRC="~/.config/nvim/init.vim"

# # default fzf command
# # ignored in favour of fzf functions at the bottom of the file
# # export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g""'
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".git" --type f'

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'


# aliases and custom funcs
# source $HOME/.zsh/keys
# source <(awless completion zsh)

bindkey -s '^o' 'lfcd\n'  # zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/amansour/.asdf/installs/terraform/0.12.8/bin/terraform terraform
export PATH=/Users/amansour/Library/Python/3.7/bin:$PATH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/amansour/porsche/git/myct/myct-cloud-helpers/cloud-helpers.sh
export PATH=/Users/amansour/.prsh-myct-tools/bin:$PATH

# OneShop
# source <(kubectl completion zsh)
# source ~/.zsh/my_plugins/k-fzf/.kubectl_fzf.plugin.zsh

# export FZFZ_RECENT_DIRS_TOOL="z"
# export FZFZ_EXTRA_DIRS="~/porsche"
# export FZFZ_EXCLUDE_PATTERN="*\.git*"

fpath=(~/.zsh $fpath)

export AUTO_NOTIFY_THRESHOLD=20


# eval $(thefuck --alias)
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export MANPAGER="nvim -c 'set ft=man' -"

# dotfile tracking
export HOMESHICK_DIR=/usr/local/opt/homeshick
source "/usr/local/opt/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# to serve local server to check from othre devices
# export SERVER_IP=`ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2`

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# POS
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin/:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin/:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin/:$PATH"
export PATH="/usr/local/opt/gawk/libexec/gnubin/:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin/:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/gnutls/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
source ~/.config/pos-aws-commons/configured-assume-role

zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# zprof
source ~/.config/pos-aws-commons/configured-assume-role
