#!/bin/sh

pushd ~/.dotfiles
sudo nixos-rebuild switch --flake .#
rm result
popd
