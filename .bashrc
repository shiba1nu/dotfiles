PS1='[\u@\H \w]\$ '
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
alias ll='ls -lF'
alias vi='/usr/local/bin/vim'
alias view='/usr/local/bin/vim -R'

# git diff by vimdiff format.
alias gitdiff='git difftool --tool=vimdiff --no-prompt'

# json viewer
function jv() {
    `cat $1 | php -R "print_r(json_decode($argn, true));"`
}
