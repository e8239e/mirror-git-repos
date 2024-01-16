#!/usr/bin/env bash

set -e
set -o pipefail

TMPDIR=$(mktemp -d)

cleanup(){
    rm -rf "$TMPDIR"
}

trap cleanup EXIT

cp ./mirror-git-repos "$TMPDIR"
cd "$TMPDIR"

mkdir mirrors

printf "https://github.com/swaywm/sway" > mirrors/sway
printf "https://gitlab.freedesktop.org/wlroots/wlroots.git" > mirrors/wlroots

git clone --mirror https://git.suckless.org/dwm mirrors/dwm

./mirror-git-repos ./mirrors
