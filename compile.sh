#!/bin/bash

export PATH=/Library/TeX/texbin/:$PATH
platex -halt-on-error ${FILE}
pbibtex ${FILE}
platex -halt-on-error ${FILE}
platex -halt-on-error ${FILE}
dvipdfmx ${FILE}.dvi
