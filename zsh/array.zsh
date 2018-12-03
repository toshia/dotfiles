#! /bin/zsh
# 配列操作関連

# 配列の末尾から値を一つ取り出す
# http://wiki.fdiary.net/zsh/?cmd=view&p=PopFromArray&key=array
function pop() {
    local count=1
    [[ $1 == <-> ]] && {
        count=$1
        shift
    }
    for name in $*; do
        repeat $count do
            eval $name'[$#'$name']=()'
        done
    done
}

# 配列の末尾に引数を追加
# http://wiki.fdiary.net/zsh/?cmd=view&p=PushIntoArray&key=array
function push() {
    local name=$1
    shift
    eval $name'=($'$name' $*)'
}