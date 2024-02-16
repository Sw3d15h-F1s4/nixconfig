#!/bin/sh

pushd ~/.dotfiles
home-manager switch -f ./users/sam/home.nix
popd
