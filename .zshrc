# Auto completion
autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/capecchi/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#Prompt setup
autoload -U promptinit
promptinit
prompt elite2 yellow
# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#We set some options here
setopt appendhistory autocd hist_ignore_all_dups hist_ignore_space

# User specific alias and functions
alias ls="ls -h --color=auto"

export PATH=$PATH:/home/eric/scripts/

# export ANDROID_HOME=/home/eric/tools/android/android-sdk-linux/
# export PATH=$PATH:/home/eric/tools/android/android-sdk-linux/tools/
# export PATH=$PATH:/home/eric/tools/android/android-sdk-linux/platform-tools/
export PATH=$PATH:/home/eric/bin

# Django
export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/site-packages/django/
