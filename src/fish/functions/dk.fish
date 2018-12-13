function dk --description 'alias dk kill \$(docker-containers | fzf-tmux)'
    docker kill \$(docker-containers | fzf-tmux);
end
