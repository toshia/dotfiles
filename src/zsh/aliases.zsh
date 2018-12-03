#! /bin/zsh
# エイリアス

#よくパイプで使うコマンドたち
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'

#cdの後に自動でls
function cd() { builtin cd $@ && ls }

#ディレクトリ内のファイルサイズを再帰的に合計
function bu(){
    find -type f -printf "%s\n" | perl -ne '$i++; $byte += $_; $str = "\r$i files, $byte byte"; $str =~ s/(\d{1,3})(?=(?:\d\d\d)+(?!\d))/$1,/g; print $str' }

#マッチしたファイルのファイル名の文字コードを直す
function fncode() { for i in $*; do; mv "$i" `echo "$i" | nkf -w | sed 's/ /_/g'`; done }

function history-all { history -E 1 } # 全履歴の一覧を出力する








