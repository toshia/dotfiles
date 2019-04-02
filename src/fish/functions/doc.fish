function doc
    set -g current_docker (docker-containers | fzf)
end
