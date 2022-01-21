#!/bin/bash
# Author: Amelia Wake aww3021@imperial.ac.uk
# Script: CompileLaTeX.sh
# Desc: simple shell script to compile latex with bibtex.
# Arguments: 1 | .tex
# Date: Oct 2021

# Joining .tex extension onto variable name to make this bash script more convenient 
filename=$(basename "$1" .tex)

# The first pdflatex run generates two files: FirstExample.log and FirstExample.aux (and
# an incomplete .pdf).
# At this step, all cite {...} arguments info that bibtex needs are written into the 
# .aux file.
pdflatex $filename.tex

# The second bibtex command (followed by the filename without the .tex extension)
# results in bibtex reading the .aux file that was generated. 
# It then produces two more files: FirstExample.bbl and FirstExample.blg.
# At this step, bibtex takes the citation info in the aux file and puts the relevant bibliographic
# entries into the .bbl file, formatted according to the instructions provided by the bibliography
# style that you have specified using bibliographystyle{plain}.
bibtex $filename

# The second pdflatex run updates FirstExample.log and FirstExample.aux (and a still incomplete
# .pdf, the citations are not correctly formatted yet).
# At this step, the reference list in the .bbl generated in the above step is included in the 
# document, and the correct labels for the in-text cit{...} commands are written in .aux file.
pdflatex $filename.tex

# The third and final pdflatex run then updates FirstExample.log and FirstExample.aux
# one last time, and now produces the complete .pdf file, with citations correctly formatted.
# At this step, latex knows what the correct in-text citation labels are, and includes them
# in the pdf document. 
pdflatex $filename.tex

# The 'evince' command starts a Document Viewer and opens a specific file when specified.
evince $filename.pdf &

## Cleanup
rm *.aux
rm *.log
rm *.bbl
rm *.blg