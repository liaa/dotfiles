#!/bin/sh

result() {
  echo ${2:=-n} | dmenu -p "$1"
}

uuid=$(uuidgen)
date=$(date --utc +%FT%TZ)
type=":1"
# read URL from clipboard
clipboardURI=$(xclip -selection c -o)
url="$(result "URL:" $clipboardURI)"
[ -z "$url" ] && exit 
windowTitle=$(xdotool getactivewindow getwindowname)
title="$(result "Title:" "$windowTitle")"
tags="$(result "Tags (comma delimited):")"

bookmark="${uuid}|${date}|${type}|${url}|${title}|${tags}" 
echo $bookmark >> '/home/liang/.bookmarks'
