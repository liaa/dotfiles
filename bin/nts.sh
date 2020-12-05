#!/bin/bash
#
# Copyright (C) 2013 by Massimo Lauria
#
# Created : "2013-04-17, Wednesday 17:55 (CEST) Massimo Lauria"
# Time-stamp: "2013-04-17, 18:22 (CEST) Massimo Lauria"
#
# Description::
#
# Desktop search tool built around recoll and dmenu
# http://blog.desdelinux.net/como-buscar-archivos-a-texto-completo-en-distros-linux-livianas/
#
# Configuration
QUERY_TOOL="recoll -b -t"
PROMPT_THEME='-nf #dcdcdc -nb #2f2f2f -sb #a6c292 -sf black'

# Code::

# dmenu $PROMPT_THEME -p "Chercher:" </dev/null -r | while read -r find; do
#   DOC=$($QUERY_TOOL "$find" | grep 'file://' \
#       | sed -e 's|^ *file://||' | sed -e "s|$HOME/||" \
#       | perl -e 'use URI::Escape; print uri_unescape(<STDIN>);' \
#       | dmenu -p 'Choisir:' \
#       -i $PROMPT_THEME -l 20)
# done

# Use argument or query interactively.
if [ -z "$@" ]; then
	QUERY=`dmenu $PROMPT_THEME -p "Chercher:" </dev/null`
	#QUERY=`dmenu $PROMPT_THEME -p "Chercher:" </dev/null`
else
	QUERY="$@"
fi

DOC=$($QUERY_TOOL "$QUERY" | grep 'file://' \
    | sed -e 's|^ *file://||' | sed -e "s|$HOME/||" \
    | perl -e 'use URI::Escape; print uri_unescape(<STDIN>);' \
    | dmenu -p 'Choisir:' \
    -i $PROMPT_THEME -l 20)


if [ "x$DOC" != x ]; then
	xdg-open "$HOME/$DOC"
fi
