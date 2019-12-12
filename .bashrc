# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
alias repo="cd /home/morelly_t1/CodeRepo"
alias docs="cd /home/morelly_t1/Docs"
alias hssrepo="/home/morelly_t1/HSS_GIT/hss-git-repository/scripts/Spacewalk/PatchlevelCreation/python-migration"
#alias rdp="rdesktop -k de -g 1850x1100 lt-0001ktj3r1.biotronik.int -u morelly_t1 -d BIOTRONIK -r sound:remote"
alias vps="ssh morelly_1@vps"
alias vps2="ssh morelly_1@vps2"
alias pushdocs="docs; git add *; git commit -m "update"; git push"
alias pushcode="repo; git add *; git commit -m "update"; git push"
alias dhcpval="ssh mgmt-1.mgmt.testsystem-homemonitoring.int"
alias dhcpprod="ssh mgmt-1.mgmt.biotronik-homemonitoring.int"
alias dhcpperf="ssh dhcp-1.mgmt.perftest-homemonitoring.int"
alias dhcpinfra="ssh  infrastructure-10.hss.int"
alias ssh=init_ssh $@;
alias hist="history | grep"
alias ll='ls -hals --color=auto'
alias ..='cd ..'
alias c='clear'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ports='netstat -tulanp'
alias cls="clear && ls -hals --color=auto"
alias sw="ssh spacewalk.hss.int"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

set_title() {
    ORIG=$PS1
    TITLE="\e]2;$*\a"
    PS1=${ORIG}${TITLE}
}

init_ssh(){
        
    # ENVs
    
    local _VAL="mgmt.testsystem-homemonitoring.int";
    local _PROD="mgmt.biotronik-homemonitoring.int";
    local _INFRA="mgmt.hss.int";
    local _DWH="mgmt.datacenter-homemonitoring.int";
    local _PERF="mgmt.perftest-homemonitoring.int"; 
	local _HOST="";

	if [[ "$#" -eq 0 ]];then
		echo -ne "No host specified.\nExiting.\n"
		return
    elif [[ "$#" -eq 1 ]];then
        $_HOST=$(echo $@ | cut -d "@" -f2)
        echo -en "\e]2;$_HOST\a"
        # /usr/bin/ssh -oStrictHostKeyChecking=no $1;
        /usr/bin/ssh $1;
    elif [[ "$#" -eq 2 ]];then
		case "$2" in
    		"Val" | "val")	
    			subssh "morelly_t1" $1 $_VAL
			;;
			"Prod" | "prod")
                subssh "morelly_t1" $1 $_PROD
	        ;;
			"perf" | "Perf")
                 subssh "morelly_t1" $1 $_PERF
			;;
			"Infra" | "infra")
        		subssh "morelly_t1" $1 $_INFRA
	        ;;
             "DWH" | "dwh")
                 subssh "morelly_t1" $1 $_DWH
             ;;
			*)
				echo -ne "Invalid environment.\nExiting.\n";
            	return;
	        ;;
		esac;
	elif [[ "$#" -eq 3 ]];then
    	case "$3" in
             "Val" | "val")
                 subssh $1 $2 $_VAL
             ;;
             "Prod" | "prod")
                 subssh $1 $2 $_PROD
             ;;
             "perf" | "Perf")
                  subssh $1 $2 $_PERF
             ;;
             "Infra" | "infra")
                 subssh $1 $2 $_INFRA
             ;;
              "DWH" | "dwh")
                  subssh $1 $2 $_DWH
              ;;
             *)
                 echo -ne "Invalid environment.\nExiting.\n";
                 return;
             ;;
         esac;
    fi
}

subssh(){

	# $1 = USER
    # $2 = HOST
    # $3 = ENV
	
	local _tmp=""

	if [[ $(host $2.$3 > /dev/null 2>&1; echo $?) -eq 0 ]];then
		echo -ne "Init SSH to $2.$3.\n";

		case "$3" in 
			"$_INFRA")
				_tmp="INFRA"
			;;
			"$_VAL")
				_tmp="VAL"
			;;
			"$_PERF")
				_tmp="PERF"
			;;
			"$_DWH")
				_tmp="DWH"
			;;
			"$_PROD")
				_tmp="PROD"
			;;
		esac
		echo -en "\e]2;[$_tmp]   $2\a"
    	/usr/local/bin/sshrc $1@$2.$3;
	else
    	echo -ne "Host $2.$3 does not exist.\nExiting.\n";
        return;
     fi
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export GOPATH=$HOME/go
PATH=$GOPATH/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias dotfiles='/usr/bin/git --git-dir=/home/morelly_t1/.dotfiles/ --work-tree=/home/morelly_t1'
