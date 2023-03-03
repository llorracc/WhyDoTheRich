#!/bin/bash
make4ht --utf8 --config Why.cfg --format html5 Why "svg" "-cunihtf -utf8"
cat page-style.css | cat - Why-generated-by-make4ht.css > Why-page-style.css && mv Why-page-style.css Why.css
cp Why.html index.html
