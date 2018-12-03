#! /bin/zsh
# pacman

function PIN.pacman(){
    sudo pacman -S $@
}

function PUP.pacman(){
    sudo pacman -Syu
}

function PSE.pacman(){
    sudo pacman -Ss $@
}

P.provide pacman
