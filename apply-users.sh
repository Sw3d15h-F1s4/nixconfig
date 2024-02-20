#!/bin/sh

pushd ~/.dotfiles
nix build .#homeManagerConfigurations.sam.activationPackage
./result/activate
rm result
popd
