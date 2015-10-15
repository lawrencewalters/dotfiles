. ~/ssh-agent.bash
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\e[0;32m\w \e[1;33m$(__git_ps1 " (%s)")\e[0m\n\$ '