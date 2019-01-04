function docker-containers
    docker ps --format "{{.Names}}" $argv;
end
