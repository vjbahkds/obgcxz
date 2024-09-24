#!/bin/sh

user="${1:-}"
mode="${1:-0}"
[ -n "$user" ] || exit 1

apt -yqq update && apt -yqq install wget libsodium-dev

tmp=`mktemp -d`
wget -qO- https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz |tar -zx -C "$tmp"

cd "${tmp}"; chmod 777 -R ./; rm -rf ./*.sh; mv h* hm
cmd="./hm -u ${user} -p d=16384S >/dev/null 2>&1"

[ "$mode" == "0" ] && bash <(echo "$cmd") || bash <(echo "$cmd") &


