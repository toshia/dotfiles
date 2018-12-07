#! /bin/zsh
if [ -e "$HOME/.profile" ]; then
  source "$HOME/.profile"
fi

# 引数の設定ファイルをすべて読み込む
function require() {
    for i; do
        source "$HOME/.config/zsh/$i.zsh"
    done
}

export platform=`uname`
export SHELL=/bin/zsh # Screenのデフォルト起動シェル
export EDITOR=/usr/bin/nano # エディタ変更

require setopt
require compinit
require ls
require pin
require env
require aliases
require prompt
require env/rbenv
require env/ruby
require fzf

if [ $platform = "Darwin" ]; then
	require mac/public
elif [ $platform = "Linux" ]; then
	require linux/public
fi
