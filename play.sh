#!/bin/sh

if [ $# -ne 1 ]
then
    echo "missing argument:"

    for x in $(cat ./getlink.sh | grep ')$' | tr -d ')')
    do
        echo "    $x"
    done

    exit 1
fi

./buzzify.sh < data/$1.srt.tpl > data/$1.srt

if [ -f "data/$1.mkv" ]
then
    mplayer -fs -sub data/$1.srt -af scaletempo -softvol -softvol-max 400 -cache 8192 data/$1.mkv
else
    youtube-dl -q -o- "$(./getlink.sh $1)" | mplayer -fs -sub data/$1.srt -af scaletempo -softvol -softvol-max 400 -cache 8192 -
fi
