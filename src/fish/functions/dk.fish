function dk --description 'alias dk kill \$(docker-containers | fzf-tmux)'
    docker kill (__current_docker)
end
