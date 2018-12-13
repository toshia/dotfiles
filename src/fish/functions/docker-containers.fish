function docker-containers
    docker ps --format "{{.Names}}";
end
