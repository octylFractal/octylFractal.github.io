#!/usr/bin/env bash

set -ex

bundle update
nix-shell -p bundix --run 'bundix -l'
