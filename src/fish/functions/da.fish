function da --description 'alias da docker attach \$(docker-containers | fzf-tmux)'
    docker attach (__current_docker)
end
