complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
alias flushcache='dscacheutil -flushcache'
eval "$(rbenv init -)"

HOMEBREW_PATH=/usr/local/bin:/usr/local/sbin
PATH=$HOMEBREW_PATH:~/bin:$PATH

SVN_EDITOR=/usr/local/bin/mate
EDITOR=/usr/local/bin/mate

source ./.bash_tokens