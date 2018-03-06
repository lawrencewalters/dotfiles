# aliases 
source ~/dotfiles/shell_profile/alias

# ssh agent
if [ -f $HOME/.ssh/start-agent.sh ]; then
    . $HOME/.ssh/start-agent.sh
fi

HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

# \[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$
#  PS1="\\[\\033[01;34m\\]\\w \\[\\033[31m\\]\`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\\\\\\*\\ \\(.+\\)\$/\\(\\\\\\\\\\1\\)\\ /\`\\[\\033[35m\\]\$\\[\\033[00m\\]
function color_my_prompt {
    # local __cur_location="\033[33m ${PWD##*/}"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    # local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    # local __prompt_tail="\[\033[35m\]"
    local ref=$(git symbolic-ref HEAD 2>/dev/null)
    if [ -z $ref ]; then return; fi
    if [[ -n $(git status -s 2>/dev/null) ]]; then
        local __git_branch_color="\033[31m"
        local dirty="*"
    else
        local __git_branch_color="\033[36m"
        local dirty=""
    fi
    echo -e " $__git_branch_color(${ref#refs/heads/}${dirty})"
}
export PS1='\033[33m\W$(color_my_prompt) \033[00m$ '

if [[ $PROMPT_COMMAND == *"history -a; history -c; history -r;"* ]]; then
  echo "It's there!"
else
  export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
fi