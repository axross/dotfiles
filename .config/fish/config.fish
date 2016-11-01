set fish_color_command blue -o
set fish_color_param cyan

set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

set -x PATH /usr/local/opt/dart/libexec $PATH

set -x N_PREFIX $HOME/.n
set -x PATH $N_PREFIX/bin $PATH

set -x PATH $HOME/.yarn/bin $PATH

set -x DDC_PATH $HOME/Dropbox/Workspace/sdk/pkg/dev_compiler
