#!/bin/bash

for feps in *.eps; do
    f="${feps%.*}"
    echo $f
    convert $f.eps $f.png
    convert $f.eps $f.jpg
    convert $f.eps $f.pdf
    ebb -x $f.png
done
