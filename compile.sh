#!/bin/bash

for file in $( ls . | grep .tex$ ); do
    TEX_FILE=`echo $file | sed "s/\.tex\$//"`
    docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja uplatex $TEX_FILE.tex
    docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja dvipdfmx $TEX_FILE.dvi
    rm -f $TEX_FILE.aux $TEX_FILE.dvi $TEX_FILE.log
    if [ -e $TEX_FILE.pdf ]; then
        if [ ! -e build/ ]; then
            mkdir build
        fi
        mv $TEX_FILE.pdf build/$TEX_FILE.pdf
    fi
done
