function de --description 'alias de docker exec -it \$(docker-containers | fzf-tmux)'
    docker exec -it (__current_docker) $argv;
end
