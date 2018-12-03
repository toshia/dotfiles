#! /bin/zsh
# brew

function PIN.brew(){
    brew install $@
}

function PUP.brew(){
    brew update
    brew upgrade
}

function PSE.brew(){
    brew search $@
}

P.provide brew
