#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias get_idf='. $HOME/esp/esp-idf/export.sh'
export PATH="$PATH:$HOME/.dotfiles/scripts"
alias stmIDE="stmIDE.sh"
