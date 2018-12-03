#! /bin/zsh
# パッケージマネージャのラッパ

require array

pin_provide_packages=()
pin_primary_package=1
# pinがロードできたら呼ぶ
function P.provide(){
	push pin_provide_packages $1
}

# プライマリパッケージマネージャを印字する
function P.primary(){
	echo $pin_provide_packages[$pin_primary_package]
}

function PIN(){
    PIN.$pin_provide_packages[$pin_primary_package] $@
}

function PUP(){
    PUP.$pin_provide_packages[$pin_primary_package] $@
}

function PSE(){
    PSE.$pin_provide_packages[$pin_primary_package] $@
}
