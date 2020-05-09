#!/bin/bash

docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja uplatex report.tex
docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja dvipdfmx report.dvi
