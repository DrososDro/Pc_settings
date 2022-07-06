#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias p='python'
alias v='nvim'
# # Arch latest news
# if [ "$PS1" ] && [[ $(ping -c1 www.google.com 2>&-) ]]; then
# 	# The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
# 	echo -e "$(echo $(curl --silent https://www.archlinux.org/feeds/news/ | sed -e ':a;N;$!ba;s/\n/ /g') | \
# 		sed -e 's/&amp;/\&/g
# 		s/&lt;\|&#60;/</g
# 		s/&gt;\|&#62;/>/g
# 		s/<\/a>/£/g
# 		s/href\=\"/§/g
# 		s/<title>/\\n\\n\\n   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
# 		s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g
# 		s/<description>/\\n\\n\\e[00;37m/g; s/<\/description>/\\e[00m\\n\\n/g
# 		s/<p\( [^>]*\)\?>\|<br\s*\/\?>/\n/g
# 		s/<b\( [^>]*\)\?>\|<strong\( [^>]*\)\?>/\\e[01;30m/g; s/<\/b>\|<\/strong>/\\e[00;37m/g
# 		s/<i\( [^>]*\)\?>\|<em\( [^>]*\)\?>/\\e[41;37m/g; s/<\/i>\|<\/em>/\\e[00;37m/g
# 		s/<u\( [^>]*\)\?>/\\e[4;37m/g; s/<\/u>/\\e[00;37m/g
# 		s/<code\( [^>]*\)\?>/\\e[00m/g; s/<\/code>/\\e[00;37m/g
# 		s/<a[^§|t]*§\([^\"]*\)\"[^>]*>\([^£]*\)[^£]*£/\\e[01;31m\2\\e[00;37m \\e[01;34m[\\e[00;37m \\e[04m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g
# 		s/<li\( [^>]*\)\?>/\n \\e[01;34m*\\e[00;37m /g
# 		s/<!\[CDATA\[\|\]\]>//g
# 		s/\|>\s*<//g
# 		s/ *<[^>]\+> */ /g
# 		s/[<>£§]//g')\n\n";
# fi
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] $ '  #'\[\033[00m\]\$ '
else
 PS1='\u@\h:\w$(parse_git_branch)\[\033[00m\] $ '
fi
unset color_prompt force_color_prompt
source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash

# Syntactic sugar for ANSI escape sequences
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Prompt variables
PROMPT_BEFORE="$txtcyn\u@\h $txtwht\w$txtrst"
PROMPT_AFTER="\\n\\\$ "

# Prompt command
PROMPT_COMMAND='__git_ps1 "$PROMPT_BEFORE" "$PROMPT_AFTER"'

# Git prompt features (read ~/.git-prompt.sh for reference)
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS="true"
