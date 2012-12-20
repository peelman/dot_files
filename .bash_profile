complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
alias flushcache='dscacheutil -flushcache'
alias re-register-apps='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
eval "$(rbenv init -)"


HOMEBREW_PATH=/usr/local/bin:/usr/local/sbin
PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
PATH=$HOMEBREW_PATH:~/bin:$PATH

declare -x SVN_EDITOR='/usr/local/bin/mate -w'
declare -x EDITOR='/usr/local/bin/mate -w'

source $HOME/.bash_tokens
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
