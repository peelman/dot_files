complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | sed -e 's/\[\([^]]*\)\]\:[0-9]*/\1/g' | sort | uniq`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ping
complete -W "info home options install uninstall search list update upgrade" brew

### This broke in Homebrew 4.0.x
### Commenting out in hopes it can be resurrected soon.
###. $(brew --repository)/Library/Contributions/brew_bash_completion.sh

if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

alias flushcache='discoveryutil udnsflushcaches'
alias re-register-apps='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias lsdot=" ls -ld .??*"

# Grab only the audio from a source via ffmpeg
ffgetpeg() {
    ffmpeg -i $1 -vn -acodec copy -bsf:a aac_adtstoasc -flags global_header $2
}


# touch the given file and set the given mod
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

### Recursively replace extensions of files
### extmv some_folder/ bub aaa
extmv () {
  if [ "$1" == "--help" ]
  then
    echo "extmv some_folder/ jpeg jpg"
    echo "replace jpeg with jpg for all files in some_folder"
    return 0
  fi
    find "${1}" -type f -name "*.${2}" |
    sed "s/\.${2}$//" |
    xargs -I% mv -i "%.${2}" "%.${3}"
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
