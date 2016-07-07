export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ls='ls -pla'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec'
alias cap='bundle exec cap'

history_search() {
  cat ~/.bash_history | grep $1 | sort | uniq
}
alias history=history_search
