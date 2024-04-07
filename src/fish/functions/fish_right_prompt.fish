function fish_right_prompt --description 'Write out the right prompt'
    set -l status_code $status
    if [ $status_code != 0 ]
        echo -ns (set_color $fish_color_error) " [" $status_code "] " (set_color normal)
    end
    set -l duration "$CMD_DURATION$cmd_duration"
    if [ "$duration" -gt 250 ]
        echo -sn (set_color green) (humantime "$duration") (set_color normal) " "
    end
    echo -n -s (set_color -o 72d5a3) "[" (prompt_pwd) "]" (set_color normal)
end
