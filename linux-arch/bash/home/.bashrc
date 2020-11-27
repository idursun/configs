#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#export PATH=$PATH:/home/idursun/bin
export HISTIGNORE="clear:fg:bg:cd -:cd ..:exit:date:w:ls:ll"
export HISTSIZE=5000
