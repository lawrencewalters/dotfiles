. ~/ssh-agent.bash
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\e[0;32m\w \e[1;33m$(__git_ps1 " (%s)")\e[0m\n\$ '

alias ls="ls --color"
alias ll="ls -al --color"

np() {
("/c/Program Files (x86)/Notepad++/notepad++.exe" $1 &> /dev/null &)
}

winpath() {
    if [ -z "$1" ]; then
        echo "$@"
    else
        if [ -f "$1" ]; then
            local dir=$(dirname "$1")
            local fn=$(basename "$1")
            echo "$(cd "$dir"; echo "$(pwd -W)/$fn")" | sed 's|/|\\|g';
        else
            if [ -d "$1" ]; then
                echo "$(cd "$1"; pwd -W)" | sed 's|/|\\|g';
            else
                echo "$1" | sed 's|^/\(.\)/|\1:\\|g; s|/|\\|g';
            fi
        fi
    fi
}

unixpath() {
    echo "$1" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}