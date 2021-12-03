#!/usr/bin/env python3
#imports

import subprocess
subprocess.run(["Rscript", "DataPreparation.R"])
subprocess.run(["Rscript", "ModelFitting.R"])
subprocess.run(["bash", "CompileLaTeX.sh", "MiniProjectLatex.tex", "Biblio1.bib"])
