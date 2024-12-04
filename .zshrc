# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"


# aliases
alias h='history'
alias hh='history | cut -c 8-'
alias ls='ls --color'
alias logdaemon='journalctl -f -n 1000 -u'
alias ll='ls -lha --color'
alias del='rm -i'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias cd..="cd .."
alias ..="cd .."
alias fhere="find . -iname "
alias df="df -Tha --total"
alias free="free -mt"

export PS1="\[\e[0;33m\][\$PWD]\[\e[m\]\n\[\e[1;32m\]\A \$\[\e[m\]"
LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS

# for mac os
# export PS1=""%F{yellow}[$PWD]%f%F{green}%T %f$ "
# export LSCOLORS=gxfxcxdxbxegedabagacad'


git config --global user.email "miwanczuk7@gmail.com"

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=IweksTheme
source ~/.bash-git-prompt/gitprompt.sh

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases
# Enable history appending instead of overwriting.  #139609
shopt -s histappend
shopt -s cmdhist

# move to root of git dir
function proot {
    if ! git tag > /dev/null 2>&1 && [ $? -eq 0 ]; then
        echo "Not a git repo";
        exit
    fi

    root=$(git rev-parse --show-toplevel)

    cd $root
    $SHELL
}

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
