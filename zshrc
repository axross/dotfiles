autoload -Uz colors && colors

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# completion settings
setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# cd-related settings
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# history settings
export HISTSIZE=1000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# enable 8-bit character support
setopt print_eight_bit

# initialize starship
eval "$(starship init zsh)"
