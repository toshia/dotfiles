# Defined in - @ line 1
function docker-compose --wraps='docker-compose --compatibility' --description 'alias docker-compose=docker-compose --compatibility'
 command docker-compose --compatibility $argv;
end
