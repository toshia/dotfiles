# Defined in - @ line 0
function dl --description 'alias dl=docker logs (docker-containers -a | fzf)'
	docker logs (__current_docker -a) $argv;
end
