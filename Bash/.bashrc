#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias 'vim=nvim'
PS1='[\u@\h \W]\$ '

# This is for fasfetch
fastfetch

# This is for flatpak
export PATH=$PATH:/var/lib/flatpak/exports/bin:$HOME/.local/share/flatpak/exports/bin

