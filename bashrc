# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W $ \[\033[00m\]"
#export LS_COLORS=$LS_COLORS:'di=00;94'
#eval `dircolors ~/bin/dircolors-solarized/dircolors.256dark`
eval `dircolors ~/.dircolors`

# get current git branch name
function git_branch {
  export gitbranch=[$(git rev-parse --abbrev-ref HEAD 2> /dev/null)]
  if [ "$?" -ne 0 ]
  then
    gitbranch=
  fi
  if [[ "${gitbranch}" == "[]" ]]
  then
    gitbranch=
  fi
}

# set usercolor based on admin status
function user_color {
  id | grep "Admin" > /dev/null
  RETVAL=$?
  if [[ $RETVAL == 0 ]]
  then
    usercolor='[0;35m'
  else
    usercolor='[0;32m'
  fi
}

function ttyname() {
  export TTYNAME=$@
}

export TTYNAME="Gaming PC"
function settitle() {
  p=$(pwd)
  let l=${#p}-25
  if [ "$l" -gt "0" ]
  then
    p=..${p:${l}}
  fi
  t="$TTYNAME $p"
  echo -ne "\e]2;$t\a\e]1;$t\a"
}

inputcolor='[0;37m'
cwdcolor='[0;34m'
gitcolor='[1;31m'
user_color

# PS1 set up
PROMPT_COMMAND='settitle; git_branch;'
export PS1="\[\e${usercolor}\][\u@\h]\[\e${gitcolor}\]${gitbranch}\[\e${cwdcolor}\][\W]\[\e${inputcolor}\] $ "

alias ls="ls --color"
alias vi='vim'

