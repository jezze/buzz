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

youtube-dl -o $1 $(./getlink.sh $1)
mv $1.mkv data
