#!/bin/sh

mkadj() {
    echo -n $(cat data/adjs | sort -R | head -n 1)
}

mknoun() {
    t=$(cat data/tech | sort -R | head -n 1)
    n=$(cat data/nouns | sort -R | head -n 1)

    echo -n "$t $n"
}

while read line
do
    while [[ $line =~ .*%a.* ]]
    do
        line=${line/\%a/$(mkadj)}
    done

    while [[ $line =~ .*%n.* ]]
    do
        line=${line/\%n/$(mknoun)}
    done

    echo $line
done
