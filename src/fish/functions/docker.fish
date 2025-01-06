function docker
    systemctl start docker.service
    sudo /usr/bin/docker $argv;
end

