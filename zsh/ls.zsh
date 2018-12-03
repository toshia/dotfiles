#! /bin/zsh
# ls の動作 (属性表示、色つき)。man ls 参照
if [ "$TERM" = "dumb" -o "$TERM" = "emacs" ]
then
  alias ls='/bin/ls -F'
else
  alias ls='/bin/ls -F --color=auto'
fi

if [ "$platform" = 'Darwin' ]; then
  alias ls="ls -F"
fi
