function fish_prompt --description 'Write out the prompt'
    history --merge
    echo -n -s (set_color yellow) $current_docker (set_color normal) "> "
end
