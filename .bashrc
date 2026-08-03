#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

GREEN=$'\001\e[1;32m\002'
BLUE=$'\001\e[1;34m\002'
YELLOW=$'\001\e[0;33m\002'
RESET=$'\001\e[0m\002'

function git_prompt() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)

    echo " ${YELLOW}(${branch})${RESET}"
}

alias ls='ls -X --color=auto'
alias grep='grep --color=auto'
HISTFILESIZE=20000
HISTTIMEFORMAT="%F %T "
PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${RESET}\$(git_prompt)\$ "
