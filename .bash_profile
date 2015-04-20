complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ping
complete -W "info home options install uninstall search list update upgrade" brew
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

alias flushcache='discoveryutil udnsflushcaches'
alias re-register-apps='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias lsdot=" ls -ld .??*"

mtouch() {
    if [ -z "$2" ]
    then
      local mode='755'
    else
      local mode=$2
    fi
    touch "$1";
    chmod $mode "$1";
}

eval "$(rbenv init -)"

declare -x HISTSIZE=10000
declare -x HOMEBREW_PATH=/usr/local/bin:/usr/local/sbin
declare -x PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
declare -x PATH=$HOMEBREW_PATH:~/bin:$PATH
# Make clean tarballs and more in Leopard
declare -x COPYFILE_DISABLE=true

declare -x SVN_EDITOR='/usr/local/bin/mate -w'
declare -x EDITOR='/usr/local/bin/mate -w'

declare -x FIGNORE=".o:~:Application Scripts"

source $HOME/.bash_tokens


### Added by the Heroku Toolbelt
declare -x PATH="/usr/local/heroku/bin:$PATH"

export PS1="\[\e[00;31m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;36m\]\u@\h\[\e[0m\]\[\e[00;37m\]:[\[\e[0m\]\[\e[00;32m\]\w\[\e[0m\]\[\e[00;37m\]] > \[\e[0m\]"