eval "$(oh-my-posh init bash --config /home/lordy/.config/bash_themes/kali.omp.json)"

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

export PATH="$PATH:/home/lordy/.local/bin:/home/lordy/Programs/Scripts:/home/lordy/.dotnet/tools"

export BROWSER="/usr/bin/google-chrome-stable"

export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

unset GREP_OPTIONS # Deprecated

export LOCAL_IP=$(hostname  --ip-addresses | awk '{print $1}')

alias :q="exit"
alias where="which"
alias CLEAR="clear"
alias copy='xsel --clipboard' # copy output using pipe |
alias json_format='python -m json.tool'
alias copyl='fc -ln -1 | xargs | xclip -selection clipboard' # copy last command

# git checkout branches with fzf
alias gbranch='git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout'

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'

# Change directory aliases
alias gd="cd ~/G-Drive"
alias ghd="cd ~/Github"
alias dtop="cd ~/Desktop"
alias testf="cd ~/Test"
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Edit this .bashrc file
alias ebrc='sudo nvim ~/.bashrc'
# Source this .bashrc file
alias srcbrc='source ~/.bashrc'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search running port
alias lport='sudo lsof -i -P -n | grep '

# Show open ports
alias openports='netstat -nape --inet'

# List services
alias sys-list-units="systemctl list-units --type=service | fzf | awk '{print $1}' | xargs -I {} systemctl status {}"

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# click on a text in the terminal, and then auto paste it
alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Alias's for multiple directory listing commands
alias l="ls --color=always"
alias la='ls -a' # show hidden files
alias ls='ls --color=always' # add colors
alias lls='ls -l'   # List
alias lla='ls -Al'  # List and Hidden Files
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# Bash x fzf
source <(fzf --bash)
# Bash x fzf x git (https://github.com/junegunn/fzf-git.sh)
if [[ $- == *i* ]]; then
    source ~/Programs/fzf-git.sh
fi

# Bash History configuration
export HISTCONTROL=erasedups:ignoredups:ignorespace
export HISTSIZE=10000
export HISTFILESIZE=10000
unset HISTTIMEFORMAT
shopt -s histappend

# Functions section

# Go to a specified language test folder
lang () {
    if [ $1 = "list" -o $1 = "l" ]
    then
        ls ~/Test/langs/
    else
        cd ~/Test/langs/$1
    fi
}

# Extracts any archive(s) (if unp isn't installed)
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}

# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Copy prompt input
if [[ -n $DISPLAY ]]; then
  copy_line_to_x_clipboard () {
    printf %s "$READLINE_LINE" | xclip -selection CLIPBOARD
  }
  bind -x '"\C-y": copy_line_to_x_clipboard' # binded to ctrl-y
fi

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip () {
    # Internal IP Lookup.
    if command -v ip &> /dev/null; then
        echo -n "Internal IP: "
        # ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1
        echo $LOCAL_IP
    else
        echo -n "Internal IP: "
        ifconfig wlan0 | grep "inet " | awk '{print $2}'
    fi

    # External IP Lookup
    echo -n "External IP: "
    curl -s ifconfig.me
    echo ""
}
