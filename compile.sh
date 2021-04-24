#!/bin/bash

FILE=report

export PATH=/Library/TeX/texbin/:$PATH
uplatex -halt-on-error ${FILE}
dvipdfmx ${FILE}.dvi
