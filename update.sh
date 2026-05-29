#!/usr/bin/env bash

set -ex

bundle update --all
nix-shell -p bundix --run 'bundix -l'
