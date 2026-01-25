#! /usr/bin/env sh

DIR=$(realpath $(dirname $0))
cd $DIR

rm -rf home-manager && cp -r ~/.config/home-manager home-manager
rm -rf nixos && cp -r /etc/nixos nixos
