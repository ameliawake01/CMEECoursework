#!/bin/bash

filename=$(basename "$1" .tex)

pdflatex $filename.tex
bibtex $filename
pdflatex $filename.tex
pdflatex $filename.tex

mv $filename.pdf ../results/

## Cleanup
rm *.aux
rm *.log
rm *.bbl
rm *.blg

