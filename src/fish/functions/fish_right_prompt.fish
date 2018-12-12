function fish_right_prompt --description 'Write out the right prompt'
    echo -n (set_color -o 72d5a3) "[" (prompt_pwd) "]" (set_color normal)
end
