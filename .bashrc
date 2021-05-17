#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls -l --color=auto'
alias la='ls -a --color=auto'
alias ls='ls --color=auto'
PS1="\[\033[1;36m\][\u@\h \W]$\[\033[0m\] "
#PS1='[\u@\h \W]$ '

#pfetch
#figlet -f slant ARCHER | lolcat
