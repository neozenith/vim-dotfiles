alias ll="ls -laGHf"
alias gs="git status -v"
alias gb="git branch -v -a"
alias gcon="git diff --name-only --diff-filter=U"
export PS1="\e[0;32m\W\e[m"
export PS1="$PS1\$(git-radar --bash --fetch)\$ "
export PATH=$PATH:~/scripts/ssh-connections
#export PATH=$PATH:~/scripts/didit-cli-client
export PATH=$PATH:~/scripts/sql-connections
