#! /bin/zsh

local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[m%}'

export PROMPT='%(!.#.%%) '
export RPROMPT=$GREEN'[%~]'$DEFAULT
setopt PROMPT_SUBST
