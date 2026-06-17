export PATH=~/.local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# activate mise
if [[ -x /opt/homebrew/bin/mise ]]; then
  eval "$($(brew --prefix)/bin/mise activate zsh --quiet)"

  # IDE/agent shells (e.g. Claude Code in VSCode) snapshot the environment
  # non-interactively, before any precmd fires, and inherited stale __MISE_*
  # markers can make hook-env a no-op — leaving mise-managed tools (gh, node, …)
  # off PATH. Force a fresh injection so non-interactive shells get them too.
  unset __MISE_DIFF __MISE_SESSION

  eval "$($(brew --prefix)/bin/mise hook-env --quiet -s zsh)"
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
