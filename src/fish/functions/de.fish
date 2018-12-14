function de --description 'alias de docker exec -it \$(docker-containers | fzf-tmux)'
    echo docker exec -it (docker-containers | fzf-tmux) $@;
end
