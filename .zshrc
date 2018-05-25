# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kuro/.zshrc'

autoload -Uz promptinit
promptinit
prompt off
# compinit
# End of lines added by compinstall

export TERM="xterm-256color"

powerline-daemon -q
. /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

