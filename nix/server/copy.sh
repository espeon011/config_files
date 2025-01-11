#! /usr/bin/env sh

DIR=$(realpath $(dirname $0))
cd $DIR

rm -rf home-manager && cp -R ~/.config/home-manager home-manager
rm -rf nixos && cp -R /etc/nixos nixos
