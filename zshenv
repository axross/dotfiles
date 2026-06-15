export PATH=~/.local/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# activate mise
if [[ -x /opt/homebrew/bin/mise ]]; then
  eval "$(/opt/homebrew/bin/mise activate zsh --quiet)"
fi
