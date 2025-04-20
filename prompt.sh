firstColor="1"
secondColor="5"
thirdColor="7"
textColor="30"
glyph="e0b0"

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

show_git_branch() {
  if [ ! -z "$(parse_git_branch)" ]; then
	  echo -e "\001\033[3${secondColor};4${thirdColor}m\002\u${glyph}\001\033[0m\002\001\033[4${thirdColor};${textColor}m\002 \uf418 $(parse_git_branch) \001\033[0m\002\001\033[3${thirdColor}m\002\u${glyph}\001\033[0m\002 "
  else
	  echo -e "\001\033[3${secondColor}m\002\u${glyph}\001\033[0m\002 "
  fi
}

yazi_icon() {
if [ -n "$YAZI_LEVEL" ]; then
	echo " 󰇥"
fi
}

ssh_icon() {
if [ -n "$SSH_CLIENT" ]; then
	echo " "
fi
}

arrow(){
	echo -e "\001\033[3${firstColor};4${secondColor}m\002\u${glyph}"
}

arrow2(){
	echo -e "\001\033[3${firstColor};49m\002\u${glyph}\033[0m"
}


PS1='\[\033[${textColor};4${firstColor}m\] \u@\H$(ssh_icon)$(yazi_icon) $(arrow)\[\033[${textColor};4${secondColor}m\] \w \[\033[0m\]$(show_git_branch)'
PS2='$(arrow2)\e[0m'
