#!/bin/sh
#dmenu_path | dmenu "$@" | ${SHELL:-"/bin/sh"} &
#echo "first\nsecond\nthird" | dmenu -r | while read -r find; do echo $find; done
#dmenu -r | while read -r find; do echo $find; done

QUERY_TOOL="recoll -b -t"
PROMPT_THEME='-nf #dcdcdc -nb #2f2f2f -sb #a6c292 -sf black'


# dmenu $PROMPT_THEME -p "Chercher:" </dev/null -r | while read -r find; do
#   DOC=$($QUERY_TOOL "$find" | grep 'file://' \
#       | sed -e 's|^ *file://||' | sed -e "s|$HOME/||" \
#       | perl -e 'use URI::Escape; print uri_unescape(<STDIN>);' \
#       | dmenu -p 'Choisir:' \
#       -i $PROMPT_THEME -l 20)
# done


# dmenu $PROMPT_THEME -p "Chercher:" </dev/null -r | while read -r find; do
#     echo "Start"
#     find="ubuntu"
#     DOC=$($QUERY_TOOL "$find" | grep 'file://' \
#       | sed -e 's|^ *file://||' | sed -e "s|$HOME/||" \
#       | perl -e 'use URI::Escape; print uri_unescape(<STDIN>);')
#     echo "$DOC"
#     if [ "x$DOC" != x ]; then
#       echo "RESULT"
#       xdotool key 'Escape'
#       echo -e "($DOC)" | dmenu $PROMPT_THEME -p "Chercher:" -l 20 -i -it "ubuntu"
#     fi
# done
#
# LIST="1\n2\n3\n4\n5"
# echo "$LIST"

search() {
  xdotool key 'Escape'
  query=$1
  result=$($QUERY_TOOL "ubuntu")
  # stop previous dmenu
  # seach for result
  # launch dmenu with search result and with intial text
  if [ -z "$1" ]
  then
    echo 'no'
    dmenu -r | while read -r find; do
      DOC=$($QUERY_TOOL "$find")
      search "$find"
    done
  else 
    echo "$result" | dmenu -l 20 -i
  fi
  # xdotool key 'Escape'
  # dmenu -r | while read -r find; do
  #   DOC=$($QUERY_TOOL "$find")
  #   if [ "x$DOC" != x ]; then
  #     echo "RESULT"
  #     xdotool key 'Escape'
  #     echo "$DOC" | dmenu $PROMPT_THEME -p "Chercher:" -l 20 -i -it "ubuntu"
  #   fi
  # done
}

search

