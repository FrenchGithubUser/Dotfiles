# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
PS1="\W $ "

alias sx='nvim ~/.config/sxhkd/sxhkdrc'
alias po='nvim ~/.config/polybar/main_bar'
alias pi='nvim ~/.config/picom/picom.conf'
alias y='~/scripts/get-music.sh'
alias v='nvim'

export QT_QPA_PLATFORMTHEME="qt5ct"
