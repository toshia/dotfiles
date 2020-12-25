function __tmux_update_pane_title --on-variable PWD --description 'tmuxのpaneタイトルをいい感じにする'
    set -l gitroot (git rev-parse --show-toplevel 2> /dev/null)
    if [ -z "$gitroot" ]
        tmux rename-window (basename $PWD)
    else
        tmux rename-window " "(basename $gitroot)
    end
end
