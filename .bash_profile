#
# ~/.bash_profile


#virtual_terminal="$( tty | grep -oE ....$ )"
#case "$virtual_terminal" in
 # tty3|tty4|tty5|tty6)
  #  exec fbterm -- bash -c 'TERM=fbterm screen'
#  ;;
#esac


[[ -f ~/.bashrc ]] && . ~/.bashrc
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
export GTK_THEME=Catppuccin-Mocha-Standard-Mauve-Dark

export VISUAL=nvim;
export EDITOR=nvim;
